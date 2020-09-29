set nocompatible " Use Vim settings, rather than Vi settings
filetype off
set cmdheight=3
set hidden
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'AndrewRadev/splitjoin.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'VundleVim/Vundle.vim'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'prettier/vim-prettier'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" All of your Plugins must be added before the following line
"filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
filetype plugin on
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.go :GoImports
autocmd BufWritePre *.go :GoLint
" set shell=zsh\ -i
set autowrite
set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=2 " Indent by 4 spaces when auto-indenting
set tabstop=2 " Show existing tab with 4 spaces width
syntax on " Enable syntax highlighting
filetype indent on " Enable indenting for files
source ~/.vimrcprettier
set autoindent " Enable auto indenting
set background=dark
colorscheme PaperColor
"colorscheme desert " Set nice looking colorscheme
"highlight Pmenu ctermbg=darkgray guibg=gray guifg=black
set nobackup " Disable backup files
"set laststatus=2 "show status line
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set wildmenu " Display command line's tab complete options as a menu.
set backspace=indent,eol,start
let g:go_fmt_command = "goimports"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-s-j>"
set number relativenumber
set undofile " Maintain undo history
set undodir=~/.vim/undodir
set noswapfile
set scrolloff=3
set showcmd
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>
"netrw
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
let g:netrw_winsize = 25
set noautochdir
"set autochdir
augroup ProjectDrawer
 autocmd!
 autocmd VimEnter * :Lexplore
augroup END
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
set incsearch
nmap <silent> ,/ :nohlsearch<CR>
" highlight trailing whitespace
match ErrorMsg '\s\+$'
" remove trailing whitespaces automatically
"Jump back to last edited buffer
nnoremap <C-b> <C-^>
inoremap <C-b> <esc><C-^>
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
"GO
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"

"Beutify GO :help go-settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"Coc-settings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>o :call HandleURI()<CR>
map <F9> :w<CR>:!python %<CR>
" PLUGIN: FZF
let g:fzf_preview_window = 'right:60%'
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>ff :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <silent> <Leader>fw :Rg <C-R><C-W><CR>
" set foldmethod=syntax
set ignorecase
set smartcase
let g:jedi#completions_enabled = 0
" OBSESSION SESSIONS
let g:session_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
nnoremap <Leader>sp :Obsession<CR>
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
nnoremap <silent> <Leader>+ :vertical resize +5 <CR>
nnoremap <silent> <Leader>- :vertical resize -5 <CR>
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
	\ }))
