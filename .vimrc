set ai et sts=4 sw=4 ts=4 nocompatible bs=2 bg=dark hlsearch incsearch
set ruler visualbell noerrorbells t_vb= nojoinspaces
set tw=79

" Disable auto-wrapping both display and hard wrapping
set nowrap
set fo-=t

" Optionally show line breaks. We don't really need to show these anymore, now
" that we are highlighting too long lines. The highlight color shows us that
" the line is too long (without making copy paste suck).
set showbreak=
" set showbreak=--->

" set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them
" not be

" Default to unix, and support detection of dos and mac file formats
set ffs=unix,dos,mac

" Default to UTF-8 encoding
set encoding=utf-8

" NI Specific
" set sts=3 sw=3 ts=3

" Linux Kernel Specific
" set noet sts=8 sw=8 ts=8

" Google Style
" set sts=2 sw=2 ts=2

syntax on
colorscheme desert
" set wildmenu

" Highlight too-long lines (and optionally trailing whitespace).
highlight default link TooLong Error
highlight default link TrailinWhites MatchParen
function! HighlightTooLongLines(highlight_trailing_whitespace)
  let l:regex_rightmargin = []
  let l:regex_trailinwhites = []
  if a:highlight_trailing_whitespace != 0
    call add(l:regex_trailinwhites, '\s\+$')
  endif
  if &textwidth != 0
    call add(l:regex_rightmargin, '\%>' . &textwidth . 'v.\+')
  endif
  if len(l:regex_rightmargin) > 0
    let l:regex = '/\(' . join(l:regex_rightmargin, '\|') . '\)/'
    let l:match = 'match TooLong ' . l:regex
    exec l:match
  else
    match none
  endif
  if len(l:regex_trailinwhites) > 0
    let l:regex = '/\(' . join(l:regex_trailinwhites, '\|') . '\)/'
    let l:match = '2match TrailinWhites ' . l:regex
    exec l:match
  else
    2match none
  endif
endfunction
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * call HighlightTooLongLines(1)
augroup end

" Highlight trailing whitespace when not in insert mode.
autocmd InsertEnter * call HighlightTooLongLines(0)
autocmd InsertLeave * call HighlightTooLongLines(1)

" Markdown type discovery
autocmd BufNewFile,BufFilePre,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md set filetype=markdown

" Mbed TLS test files are C with a .function postfix
autocmd BufNewFile,BufFilePre,BufRead *.function set filetype=c

" Tabs will be listed
set list listchars=tab:»·

augroup makefile
    au!
    au FileType make,automake setlocal noet sts=0 ts=8 sw=8
augroup END

augroup golang
    au!
    au FileType go setlocal noet sts=0 ts=8 sw=8
augroup END

augroup gitcommit
    au!
    au FileType gitcommit setlocal tw=72
augroup END

augroup patch
    au!
    au FileType gitcommit setlocal tw=72
augroup END

augroup ft_asm
    au!
    au FileType asm setlocal noet sts=8 sw=8 ts=8
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
     if &term == "xterm" || &term == "xterm-color" || &term == "xterm-256color" || &term == "screen-256color-bce" || &term == "screen-256color" || &term == "rxvt-unicode-256color"
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

" clang-format
" https://clang.llvm.org/docs/ClangFormat.html
map <C-K> :py3f /usr/local/llvm90/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/local/llvm90/share/clang/clang-format.py<cr>
