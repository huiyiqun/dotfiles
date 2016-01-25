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
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hsanson/vim-android'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'scrooloose/syntastic'
Plugin 'mbbill/fencview'
Plugin 'vim-scripts/fcitx.vim'
Plugin 'pearofducks/ansible-vim'

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

" run SyntasticCheck check every time I write a file
autocmd BufWritePost * call SyntasticCheck()

source ~/.nvimrc.local

" show line number
set number

" set leader character
let mapleader = ","

" set syntastic (populate warning msg to statusline)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_config_file_enabled = 1

" keep an undo file (undo changes after closing)
set undofile

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif

" set javacomplete2
autocmd FileType java set omnifunc=javacomplete#Complete

if filereadable("AndroidManifest.xml")
    let g:JavaComplete_SourcesPath = "target/generated-sources/r"
endif

" navigation within single line
map j gj
map k gk

" configuration about tab
set expandtab
set tabstop=4
set shiftwidth=4
