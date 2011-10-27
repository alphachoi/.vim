map <F2> :NERDTreeToggle<CR>   " NERDTree目录树开关切换
map <F3> :TlistToggle<CR>      " taglist标签列表开关切换
map <F4> t :NERDTreeMirror<CR>gT<C-w>w<ESC>gt<C-w>w    " 新标签打开一个文件，复制目录树

" map svn key
" map <silent> sd :VCSDiff<CR>
map <silent> ,sd :call SvnDiffToggle()<CR> 
" <CR>是回车，ZQ是退出小窗口的意思
map <silent> ,su :VCSUpdate<CR>ZQ
map <silent> ,sc :VCSCommit Modified...<CR>
map <silent> ,sa :VCSAdd<CR>
map <silent> ,si :VCSInfo<CR>
map <silent> ,sl :VCSLog<CR>
map <silent> ,sn :VCSAnnotate<CR>

" map php-doc key inoremap:插入模式 nnoremap:命令行模式 vnoremap:视图模式
inoremap <C-P> <ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocSingle()<CR>

" svn diff
nmap <silent> <F8> :call SvnDiffToggle()<CR>
nmap <silent> g<F8> :new __SVN_DIFF__<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
function! SvnDiffToggle()
  if bufexists("__SVN_DIFF__")
    bwipeout __SVN_DIFF__
  else
    if exists("t:flwsvndiff")
      diffoff!
      let l:fileName = t:flwsvndiff
      unlet t:flwsvndiff
      exec "bwipeout " . l:fileName
    else
      let t:flwsvndiff = expand("%:h") . "/.svn/text-base/" . expand("%:t") . ".svn-base"
      let l:ft = &ft
      exec "silent vert diffsplit " . t:flwsvndiff
      set readonly
      set buftype=nofile
      exec "set ft=" . l:ft
      wincmd p
      autocmd VimResized * :wincmd =
    endif
  endif
endfunction

"" 标签相关的快捷键
 map tt :tabnew<cr>
 map tn :tabnext<cr>
 map tp :tabprevious<cr>
 map te :tabedit
 map tc :tabclose<cr>

