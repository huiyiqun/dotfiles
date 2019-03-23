" Force UTF-8
set encoding=utf-8

" Default configuration about tab
setlocal expandtab tabstop=2 shiftwidth=2

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
Plug 'vim-scripts/a.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'alvan/vim-closetag'

" language
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'fatih/vim-go'
"Plug 'chen3feng/typhoon-blade', {'rtp': 'vim'}
"Plug 'chemzqm/wxapp.vim'
Plug 'tomlion/vim-solidity'

" config
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'

call plug#end()            " required

source ~/.vimrc.local

" show line number
set number

" set leader character
let mapleader = ","

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

" configure nerdcommenter
let g:NERDCustomDelimiters = { 'elvish': { 'left': '#' }, 'blade': { 'left': '#' } }

" set shell for non-posix shells
set shell=sh

" key bind for nerd tree
nmap <silent> <Leader>t :NERDTreeToggle<cr>

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

set statusline+=%{coc#status()}

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" use <tab> to navigate complete list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <enter> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" key bind for goto with Coc.nvim
nmap <silent> <leader>g <Plug>(coc-definition)
nmap <silent> <leader>G <Plug>(coc-implementation)
nmap <silent> <leader>F <Plug>(coc-fix-current)
nmap <silent> <leader>r <Plug>(coc-references)

" key bind for a.vim
nmap <silent> <Leader>a :A<cr>

" key bind for formating
nmap <silent> <Leader>f :call CocAction('format')<cr>

" key bind for searching
nnoremap <silent> <Leader>s  :<C-u>CocList -I symbols<cr>

" key bind for diagnostic
nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
