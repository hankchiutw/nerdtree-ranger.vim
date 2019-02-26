" ============================================================================
" File:        nerdtree-ranger.vim
" Description: Add ranger-like key binding for nerdtree
" Author:      Hank Chiu  <hankchiu.tw@gmail.com>
" Version:     0.1.0
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
call NERDTreeAddKeyMap({
      \ 'key': 'l',
      \ 'callback': 'NERDTreeCustomOpenDir',
      \ 'quickhelpText': 'open the current dir node',
      \ 'scope': 'DirNode' })

call NERDTreeAddKeyMap({
      \ 'key': 'l',
      \ 'callback': 'NERDTreeCustomOpenFile',
      \ 'quickhelpText': 'open the current file node',
      \ 'scope': 'FileNode' })

call NERDTreeAddKeyMap({
      \ 'key': 'h',
      \ 'callback': 'NERDTreeCustomCloseDir',
      \ 'quickhelpText': 'close current dir node or parent node',
      \ 'scope': 'DirNode' })

call NERDTreeAddKeyMap({
      \ 'key': 'h',
      \ 'callback': 'NERDTreeCustomCloseFileDir',
      \ 'quickhelpText': 'close parent dir node',
      \ 'scope': 'FileNode' })

" Expand current dir node
" If already expanded, change root to this dir
function! NERDTreeCustomOpenDir(node)
    if a:node.isOpen
      call b:NERDTree.changeRoot(a:node)
      return
    endif

    call a:node.open()
    call b:NERDTree.render()
endfunction

" Open the file
function! NERDTreeCustomOpenFile(node)
  execute "normal o"
endfunction

" Close current node
" If already closed, go up dir
function! NERDTreeCustomCloseDir(node)
  if a:node.isRoot()
    call nerdtree#ui_glue#upDir(1)
    return
  endif

  if a:node.isOpen
    call a:node.close()
    call b:NERDTree.render()
    return
  endif

  let l:parent = a:node.parent

  while l:parent.isCascadable()
    let l:parent = l:parent.parent
  endwhile

  if l:parent.isRoot()
    call nerdtree#ui_glue#upDir(1)
    return
  endif

  call l:parent.close()
  call b:NERDTree.render()
  call l:parent.putCursorHere(0, 0)
endfunction

" Close parent dir node of this file node
function! NERDTreeCustomCloseFileDir(node)
  let l:parent = a:node.parent

  while l:parent.isCascadable()
    let l:parent = l:parent.parent
  endwhile

  if l:parent.isRoot()
    call nerdtree#ui_glue#upDir(1)
    return
  endif

  call l:parent.close()
  call b:NERDTree.render()
  call l:parent.putCursorHere(0, 0)
endfunction
