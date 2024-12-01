
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

set guicursor="disable"
filetype plugin indent on    " required
syntax on
set termguicolors
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox
if has("syntax")
  syntax on
endif
if has("autocmd")
  filetype plugin indent on
endif
" Setting some decent VIM settings for programming
"set ai                          " set auto-indenting on for programming
set hlsearch
set cursorline					 " higlight current line, Turning it on vim may respond slowly
set cursorcolumn				 " higlight current colum, Turning it on vim may respond slowly
set tabstop=4
set number
"set ai
set shiftwidth=4
set showmatch                   " automatically show matching brackets. work    s like it does in bbedit.
set novb                          " turn on the "visual bell" - which is much     quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two     lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it sh    ould
" set nocompatible                " vi compatible is LAME
set background=dark        	" Use colours that work well on a dark backg    round (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamedplus
syntax enable
set softtabstop=4				" number of spaces in tab when editing
set guifont=Hack

set undofile
set undodir=~/.VimTemp/undo//
set undolevels=1000
set undoreload=1000

set backup
set backupdir=~/.VimTemp/backup//

set directory=~/.VimTemp/dir//

function VscodeUndoRead()
	let l:buf=expand("%")
	let l:ufile1=&undodir."/".l:buf
	let l:ufile=&undodir."/". substitute(l:buf,'[^a-zA-Z]', '_', 'g')
	if filereadable(l:ufile)
		call execute("rundo ".l:ufile)
	endif
	"echo "VscodeUndoRead"
endfunction
function VscodeUndoWrite()
	let l:buf=expand("%")
	let l:ufile1=&undodir."/".l:buf
	let l:ufile=&undodir."/". substitute(l:buf,'[^a-zA-Z]', '_', 'g')
	call execute("wundo ".l:ufile)
	"echo "VscodeUndoWrite"
endfunction
if l:in_vscode==1
	"I don't which event I should use since some events in vscode-neovm don't work in the
	"way I'm familar with.
	autocmd BufEnter * call VscodeUndoRead()
	autocmd BufUnload * call VscodeUndoWrite()
	autocmd InsertLeave * call VscodeUndoWrite()
endif
