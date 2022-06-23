" #############  Vundle Plugin ##############


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" ######################  Start of Vundle Example  ####################

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line



" ######################  End of Vundle Example  ####################
"
" Insert your plugin from here                   ####### Start of plugin #######


Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plugin 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
Plugin 'vim-python/python-syntax'                    " Python highlighting
Plugin 'junegunn/vim-emoji'                          " Vim needs emojis!
Plugin 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
Plugin 'frazrepo/vim-rainbow'

















call vundle#end()            " required             ###### End of plugin #######

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





" ############# End of  Vundle Plugin ##############






"if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

syntax on
set termguicolors
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox





" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" *********************** CHANGES MADE BY SOURAV ********************
" {

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


" }
" *********************** CHANGES MADE BY SOURAV ********************



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

let g:python_highlight_all = 1

" Removes pipes | that act as seperators on splits
"set fillchars+=vert:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
"let g:lightline = {
"      \ 'colorscheme': 'darcula',
"      \ }
