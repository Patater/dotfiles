set ai et sts=4 sw=4 ts=4 nocompatible bs=2 bg=dark hlsearch incsearch
set ruler visualbell noerrorbells t_vb= nojoinspaces
set tw=79

" Optionally show line breaks. We don't really need to show these anymore, now
" that we are highlighting too long lines. The highlight color shows us that
" the line is too long (without making copy paste suck).
set showbreak=
" set showbreak=--->

" set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them
" not  be

" Default to unix, and support detection of dos and mac file formats
set ffs=unix,dos,mac

" NI Specific
" set sts=3 sw=3 ts=3

" Linux Kernel Specific
set noet sts=8 sw=8 ts=8

" Google Style
" set sts=2 sw=2 ts=2

syntax on
colorscheme desert
" set wildmenu

" Highlight too-long lines (and optionally trailing whitespace).
highlight default link RightMargin Error
function! HighlightTooLongLines(highlight_trailing_whitespace)
  let l:regex_alternatives = []
  if a:highlight_trailing_whitespace != 0
    call add(l:regex_alternatives, '\s\+$')
  endif
  if &textwidth != 0
    call add(l:regex_alternatives, '\%>' . &textwidth . 'v.\+')
  endif
  if len(l:regex_alternatives) > 0
    let l:regex = '/\(' . join(l:regex_alternatives, '\|') . '\)/'
    let l:match = 'match RightMargin ' . l:regex
    exec l:match
  else
    match none
  endif
endfunction
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * call HighlightTooLongLines(1)
augroup end

" Highlight trailing whitespace when not in insert mode.
autocmd InsertEnter * call HighlightTooLongLines(0)
autocmd InsertLeave * call HighlightTooLongLines(1)

" Tabs will be listed
set list listchars=tab:»·

augroup makefile
    au!
    au FileType make,automake setlocal noet sts=0 ts=8 sw=8
augroup END

augroup gitcommit
    au!
    au FileType gitcommit setlocal tw=72
augroup END

if has("gui_running")
    set guioptions=egrLt
    set guioptions=-s
    " Windows Specific
    " set guifont=Monaco:h8:cANSI
    " set guifont=Lucida_Console:h9:cANSI
    " Mac Specific
    " set guifont=Menlo:h14
else
    set bg=dark
     if &term == "xterm" || &term == "xterm-color" || &term == "xterm-256color" || &term == "screen-256color-bce" || &term == "screen-256color"
         set t_Co=256
         colorscheme desert256
     endif
endif

set printoptions=paper:letter

fun! <SID>StripTrailingWhitespaces()
    " Save the cursor location
    let l = line(".")
    let c = col(".")
    " Preserve search position by using call
    call %s/\s\+$//e

    " Restore the cursor location
    call cursor(l, c)
endfun

" gc ("garbage collect") strips all trailing whitespace
nmap gc :%s/\s\+$//<CR>
