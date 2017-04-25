filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" style
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'

" util
Plugin 'vim-scripts/Drawit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/fencview'
Plugin 'vim-scripts/fcitx.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'dhruvasagar/vim-table-mode'

" language
"Plugin 'scrooloose/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-sensible.git'
Plugin 'pearofducks/ansible-vim'
Plugin 'othree/yajs.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-scripts/jade.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'kylef/apiblueprint.vim'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag.git'
Plugin 'fatih/vim-go'
Plugin 'huiyiqun/elvish.vim'
Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'
Plugin 'lervag/vimtex'
Plugin 'GutenYe/json5.vim'

" config
Plugin 'editorconfig/editorconfig-vim'
Plugin 'embear/vim-localvimrc'


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
"autocmd BufWritePost * call SyntasticCheck()

source ~/.nvimrc.local

" show line number
set number

" set leader character
let mapleader = ","

" set syntastic (populate warning msg to statusline)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_java_javac_config_file_enabled = 1

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
"autocmd FileType java set omnifunc=javacomplete#Complete

"if filereadable("AndroidManifest.xml")
    "let g:JavaComplete_SourcesPath = "target/generated-sources/r"
"endif

" navigation within single line
map j gj
map k gk

" configuration about tab
set expandtab
set tabstop=4
set shiftwidth=4

let g:ycm_path_to_python_interpreter = "python"

" key bind for YCM
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

" disable YCM for specific filetype
let g:ycm_filetype_blacklist = {
    \ 'html' : 1,
    \}

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:syntastic_go_checkers = ['go', 'gofmt', 'govet']

" configure nerdcommenter
let g:NERDCustomDelimiters = { 'elvish': { 'left': '#' } }

" set shell for elvish is not posix
set shell=sh

" key bind for fswitch
nmap <silent> <Leader>a :FSHere<cr>

" key bind for clang-format
nmap <silent> <Leader>f :ClangFormat<cr>

" key bind for nerd tree
nmap <silent> <Leader>t :NERDTreeToggle<cr>

" use vimtex with ycm
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
            \ 're!\\hyperref\[[^]]*',
            \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\(include(only)?|input){[^}]*',
            \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
            \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
            \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
            \ ]

" setup table mode
autocmd FileType markdown let g:table_mode_corner='|'
