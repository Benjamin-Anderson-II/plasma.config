" External Extensions
call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
call plug#end()


" quick hotkeys
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>
" Remap for md and txt files
noremap j gj
noremap k gk
noremap $ g$
noremap 0 g^

" navigation
set whichwrap+=b,s,h,l,<,>,[,]

" numlines
set nu
set nowrap
set scrolloff=5
set sidescroll=5

" Theme
set termguicolors
colorscheme catppuccin_macchiato
set cursorline
syntax on
highlight EndOfBuffer guifg=bg

" Status Line
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'catppuccin_macchiato'
    \ }
set noshowmode

" Mouse
set mouse=a

" Tabs
set tabstop=4
set shiftwidth=0
set nosmarttab
set shiftround
set expandtab
set autoindent
set smartindent

" Cursor Type (insert/replace/etc)
let &t_SI = "\<Esc>[6 q" "insert
let &t_SR = "\<Esc>[4 q" "replace
let &t_EI = "\<Esc>[2 q" "Normal?

" Specialized options depending on file type
augroup txt_md_settings
    let maplocalleader=','
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal wrap nolist linebreak breakat&vim
    autocmd BufNewFile,BufRead *.txt setlocal wrap nolist linebreak breakat&vim
augroup END

" Automatic installation of missing plugins
autocmd VimEnter * if !empty(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall | endif
