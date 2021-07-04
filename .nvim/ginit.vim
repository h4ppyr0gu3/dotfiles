" ginit.vim - GUI config for NeoVim
" Author: Nicola Paolucci <nick@durdn.com>
" Source: https://bitbucket.org/durdn/cfg/src

" Theme and Color {{{
"     if font is Terminus, set antialiased
" set noantialias
" GuiFont=Terminus\ (TTF):h14
" GuiFont=Hack:h14
" GuiFont Cascadia Code:h12
" }}}
" Platform specific GUI configuration {{{
if has('win64') || has('win32')
"  set noantialias
  GuiFont Cascadia Code:h12
  set lines=85
endif
" Code on retina {{{
nnoremap <silent> <leader>9 :call CodeOnRetina()<CR>
let g:retina_code_environment_on = 0
function! CodeOnRetina()
  set fuopt=maxvert
  if g:retina_code_environment_on
    if has('mac')
      set noantialias|GuiFont Terminus\ (TTF):h14|set co=80
    else
      set noantialias|GuiFont Terminus\ (TTF):h14|set co=80
    endif
    let g:retina_code_environment_on = 0
  else
    set antialias|set gfn=Inconsolata:h16|set co=80
    let g:retina_code_environment_on = 1
  endif
endfunction
" }}}
" Writing environment {{{
nnoremap <silent> <leader>0 :call ToggleWritingEnvironment()<CR>
let g:writing_environment_on = 0
function! ToggleWritingEnvironment()
  set fuopt=maxvert
  if g:writing_environment_on
    if has('mac')
      set noantialias|GuiFont Terminus\ (TTF):h14|set co=80
    else
      set noantialias|GuiFont Terminus\ (TTF):h14|set co=80
    endif
    let g:writing_environment_on = 0
  else
    set antialias|GuiFont Inconsolata:h22|set co=180
"    set foldcolumn=12
    let g:writing_environment_on = 1
  endif
endfunction
" }}}
if has("mac")
  set fuopt=maxvert
  GuiFont Hack:h14
  command! ToggleFullScreen if &fu|set noantialias|GuiFont Inconsolata:h22|set co=80|set nofu|else|set antialias|GuiFont Inconsolata:h22|set co=100|set fu|endif
  an <silent> Window.Toggle\ Full\ Screen\ Mode :ToggleFullScreen<CR>
endif
