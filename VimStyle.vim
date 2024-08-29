" A stylesheet if you want to edit Shilling files with Vim.
" Recommended that you rename this file to something like 'shilling.vim' and put in here: ~/.vim/ftplugin/
" Created by Pineconium, WIP.

" Filemapping
au BufNewFile,BufRead *.shil set filetype=shilling
au BufNewFile,BufRead *.shh set filetype=shilling

" Syntax Highlighting
syntax keyword shillingKeyword start blue vars vari varb vflt list act exit while forever if escape
syntax keyword shillingFunction parrot snooze strleng additem merged sort rev sort revsort rando
syntax keyword shillingImport #~imp
syntax keyword shillingBoolean true false
syntax keyword shillingTypes blank Interg FloatN Boolen
syntax keyword shillingTemp @temp retire

" Keywords
hi def link shillingKeyword Keyword
hi def link shillingFunction Function
hi def link shillingImport Include
hi def link shillingBoolean Boolean
hi def link shillingTypes Type
hi def link shillingTemp Identifier

" Indentation Rules
au FileType shilling setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
au FileType shilling setlocal autoindent smartindent
au FileType shilling setlocal indentkeys+=0{,0},0),0else,0endif


iabbrev <buffer> #s start
iabbrev <buffer> #b blue
iabbrev <buffer> #v vars
iabbrev <buffer> #a act
iabbrev <buffer> #if if
iabbrev <buffer> #while while
iabbrev <buffer> #forever forever
iabbrev <buffer> #exit exit
iabbrev <buffer> #blue blue <C-r>=input("Blueprint name: ")<CR> {
    <CR>}<Esc>O
iabbrev <buffer> #vars vars <C-r>=input("Variable name: ")<CR> = <C-r>=input("Value: ")<CR>;

nnoremap <leader>r :w<CR>:!shilling %<CR>

nnoremap <leader>c :s/^/\/\//<CR>
vnoremap <leader>c :s/^/\/\//<CR>
nnoremap <leader>u :s/^\/\/<CR>
vnoremap <leader>u :s/^\/\/<CR>
au FileType shilling setlocal foldmethod=syntax
syntax region shillingBlueprint start="blue\s\+\w\+\s*{" end="}"
syntax region shillingAction start="act\s\+\w\+\s*{" end="}"
