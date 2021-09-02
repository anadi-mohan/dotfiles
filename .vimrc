syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set mouse=a
set wrap
set laststatus=2
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" Set for vimwiki to work
set nocompatible
filetype plugin on
set relativenumber!
set foldmethod=marker

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Plugins Install -----------------------------{{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'name':'dracula'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe',{'do':'./install.py'}
Plug 'ycm-core/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'

call plug#end()
" }}}

"colorscheme gruvbox
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden = 1
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:lightline = {
        \ 'colorscheme': 'dracula',
        \}
let g:ctrlp_use_caching = 0

" Normal Remaps ---------------------- {{{
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ss :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <leader>n :NERDTree ./<CR>
nnoremap <leader>t :-1read ~/.vim/template.vim<CR>2j$"=expand('%:t')<C-M>pv4hd

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" }}}

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree ./ | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

" new remaps opening and closing brackets
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap <C-F1> ()<Esc>1ha<CR><CR><Esc>kS<tab>
inoremap [ []<Esc>i
inoremap <C-F2> []<Esc>1ha<CR><CR><Esc>kS<tab>
inoremap {<CR> {}<Esc>r<CR>i<CR>}<Esc>kS
"Comments
inoremap <C-F4> /**/<Esc>2ha

set noshowmode
set encoding=UTF-8
