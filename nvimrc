filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'vim-scripts/Drawit'
Plugin 'othree/yajs.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" Enable powerline fonts for airline
let g:airline_powerline_fonts = 1

" run Flake8 check every time I write a Python file
autocmd BufWritePost *.py call Flake8()

source ~/.nvimrc.local

set number
