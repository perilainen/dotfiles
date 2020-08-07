set nocompatible " Use Vim settings, rather than Vi settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'valloric/youcompleteme'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'NLKNguyen/papercolor-theme'
" All of your Plugins must be added before the following line
call vundle#end() " required
"set rtp-=~/.vim/bundle/youcompleteme/after
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
set autowrite
set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=4 " Indent by 4 spaces when auto-indenting
set tabstop=4 " Show existing tab with 4 spaces width
syntax on " Enable syntax highlighting
filetype indent on " Enable indenting for files
set autoindent " Enable auto indenting
set background=dark
colorscheme PaperColor
"colorscheme desert " Set nice looking colorscheme
highlight Pmenu ctermbg=darkgray guibg=gray guifg=black
set nobackup " Disable backup files
set laststatus=2 "show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set wildmenu " Display command line's tab complete options as a menu.
"call plug#begin('~/.vim/plugged')
"Plug 'vim-airline/vim-airline'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'vim-airline/vim-airline-themes'
"Plug 'SirVer/ultisnips'
"call plug#end()
set backspace=indent,eol,start
let g:go_fmt_command = "goimports"
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsListSnippets="<C-k>"
"let g:UltiSnipsJumpBackwardTrigger="<C-s-j>"
set number relativenumber
set undofile " Maintain undo history
set undodir=~/.vim/undodir
set scrolloff=3
set showcmd
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>
" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e
"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>
autocmd BufWritePre *.go :GoImports
autocmd BufWritePre *.go :GoLint
"GO SETTTINGS
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"Beutify GO :help go-settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
