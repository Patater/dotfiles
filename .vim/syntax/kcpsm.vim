" Vim syntax file
" Language:	PicoBlaze Assembler (KCPSM)
" Maintainer:	Jaeden Amero <jaeden@patater.com>
" Last Change:  2009 December 11
" URL:		http://patater.com/vim
" Revision:	1.00

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"setlocal iskeyword=a-z,A-Z,48-57,.,_
"setlocal isident=a-z,A-Z,48-57,.,_

syn case match
syn keyword kcpsmTodo TODO FIXME XXX contained

syn case ignore
syn match kcpsmIdentifier "[a-z_]\w*"
syn match kcpsmLabel "^[a-z_]\w*"
syn match kcpsmLabel "^[a-z_]\w*:"me=e-1

syn match kcpsmHexadecimal "\<\x\+\>"

syn match kcpsmComment ";.*$" contains=kcpsmTodo

syn match kcpsmRegister "\<s\x\>"

syn match kcpsmConstant "\<k\w\+\>"

syn keyword kcpsmOpcode ADD ADDCY AND CALL COMPARE DISABLE ENABLE INTERRUPT
syn keyword kcpsmOpcode FETCH INPUT INTERRUPT JUMP LOAD OR OUTPUT RESET RETURN
syn keyword kcpsmOpcode RETURNI RL RR SL SR STORE SUB SUBCY TEST XOR

syn keyword kcpsmOpcodeCond C NC Z NZ

syn keyword kcpsmDirective ADDRESS ORG NAMEREG CONSTANT EQU DSIN DSOUT DSIO
syn keyword kcpsmDirective INST


" Define the default highlighting.
if version >= 508 || !exists("did_kcpsm_syntax_inits")
  if version < 508
    let did_kcpsm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
   command -nargs=+ HiLink hi def link <args>
  endif

  HiLink kcpsmTodo Todo
  HiLink kcpsmComment Comment
  HiLink kcpsmDirective Preproc
  HiLink kcpsmHexadecimal Number
  " HiLink kcpsmRegister Structure
  " HiLink kcpsmOpcode Keyword
  " HiLink kcpsmOpcodeCond Keyword
  HiLink kcpsmLabel Label
  HiLink kcpsmConstant Constant
  HiLink kcpsmIdentifier Identifier

  delcommand HiLink
endif

let b:current_syntax = "kcpsm"

" vim: ts=8 sw=8
