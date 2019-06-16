" Vim syntax file
" Language:	Snakemake (extended from python.vim)
" Maintainer:	Vivek Rai (mail@raivivek.in)
" Original Author:	Jay Hesselberth (jay.hesselberth@gmail.com)
"
" Usage
"
" copy to $HOME/.vim/syntax directory and add:
"
" au BufNewFile,BufRead Snakefile set syntax=snakemake
" au BufNewFile,BufRead *.smk set syntax=snakemake
"
" to your $HOME/.vimrc file
"
" force coloring in a vim session with:
"
" :set syntax=snakemake
"
if exists("b:current_syntax")
  finish
endif

" Extend python.vim's syntax for use with Snakemake
runtime! syntax/python.vim

" Snakemake rules, as of version 3.3
"
" XXX N.B. several of the new defs are missing from this table i.e.
" subworkflow, touch etc
"
" rule       = "rule" (identifier | "") ":" ruleparams
" include    = "include:" stringliteral
" workdir    = "workdir:" stringliteral
" ni         = NEWLINE INDENT
" ruleparams = [ni input] [ni output] [ni params] [ni message] [ni threads] [ni (run | shell)] NEWLINE snakemake
" input      = "input" ":" parameter_list
" output     = "output" ":" parameter_list
" params     = "params" ":" parameter_list
" message    = "message" ":" stringliteral
" threads    = "threads" ":" integer
" resources  = "resources" ":" parameter_list
" version    = "version" ":" statement
" run        = "run" ":" ni statement
" shell      = "shell" ":" stringliteral

syn keyword pythonStatement	include workdir onsuccess onerror
syn keyword pythonStatement	ruleorder localrules configfile
syn keyword pythonStatement	touch protected temp wrapper
syn keyword pythonStatement	dynamic ancient directory
syn keyword pythonStatement	input output params message shadow
syn keyword pythonStatement	threads resources priority
syn keyword pythonStatement	version run shell benchmark snakefile log script conda
syn keyword pythonStatement	rule subworkflow checkpoint nextgroup=pythonFunction skipwhite

" Similar to special def and class treatment from python.vim, except
" parenthetical part of def and class
syn match pythonFunction
      \ "\%(\%(rule\s\|subworkflow\s\|checkpoint\s\)\s*\)\@<=\h\w*" contained

syn sync match pythonSync grouphere NONE "^\s*\%(rule\|subworkflow\|checkpoint\)\s\+\h\w*\s*"

let b:current_syntax = 'snakemake'
