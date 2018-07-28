" Force UTF-8
set encoding=utf-8

" Default configuration about tab
setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2

" set python version for powerline
let g:powerline_pycmd="py3"

call plug#begin('~/.vim/bundle/')

" basic
Plug 'tpope/vim-sensible'

" style
Plug 'romainl/Apprentice'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" util
Plug 'vim-scripts/Drawit'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/fencview'
Plug 'vim-scripts/fcitx.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'vim-scripts/a.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'dhruvasagar/vim-table-mode'

" language
Plug 'sheerun/vim-polyglot'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go'
Plug 'chen3feng/typhoon-blade', {'rtp': 'vim'}
Plug 'chemzqm/wxapp.vim'

" config
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'

call plug#end()            " required

call glaive#Install()

source ~/.vimrc.local

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

let g:ycm_path_to_python_interpreter = "python3"

" key bind for YCM
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>G :YcmCompleter GoToDefinition<CR>
nnoremap <leader>F :YcmCompleter FixIt<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

" disable YCM for specific filetype
let g:ycm_filetype_blacklist = {
    \ 'html' : 1,
    \}

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:syntastic_go_checkers = ['go', 'gofmt', 'govet']

" configure nerdcommenter
let g:NERDCustomDelimiters = { 'elvish': { 'left': '#' }, 'blade': { 'left': '#' } }

" set shell for elvish is not posix
set shell=sh

" key bind for a.vim
nmap <silent> <Leader>a :A<cr>

" key bind for codefmt
Glaive codefmt plugin[mappings]
nmap <silent> <Leader>f :FormatCode<cr>

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

" highlight column 80
set colorcolumn=80

" setup closetag
let g:closetag_filenames = '*.html,*.vue,*.wxml'

" select colorscheme
colorscheme apprentice

" disable blade in plolyglot, which is not what I want
let g:polyglot_disabled = ['blade']

" Show the size of block one selected in visual mode.
set showcmd

" Enable backup and undo files by default.
let s:dir = has('win32') ? '$APPDATA/Vim' : isdirectory($HOME.'/Library') ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
let &backupdir = expand(s:dir) . '/backup//'
let &undodir = expand(s:dir) . '/undo//'
if !isdirectory(expand(s:dir))
  call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
end
set undofile

" Highlight line under cursor. It helps with navigation.
set cursorline

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Enable mouse for scrolling and window resizing.
set mouse=a

" Enable search highlighting.
set hlsearch

" Auto center on matched string.
noremap n nzz
noremap N Nzz
