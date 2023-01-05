" Vim compiler file
" Compiler:         Ninja
" Maintainer:       Pablo Arias <pabloariasal@gmail.com>
" Latest Revision:  2021-05-08

if exists("current_compiler")
  finish
endif
let current_compiler = "ninja"

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=ninja

let &cpo = s:cpo_save
unlet s:cpo_save
