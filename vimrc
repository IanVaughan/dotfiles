set nocompatible

" https://github.com/gmarik/vundle
filetype off                   " required! vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Solarized'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'airblade/vim-gitgutter.git'
Bundle 'junegunn/vim-emoji.git'
Bundle 'tpope/vim-unimpaired.git'
"Bundle 'thoughtbot/vim-rspec'

filetype plugin indent on     " required!

set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch
set laststatus=2  " Always display the status line

" Numbers
set number
set numberwidth=5

" default \
"let mapleader=","

" https://github.com/IanVaughan/dotfiles/blob/master/vimrc
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list
set hidden
set listchars=tab:»·,trail:·

set mouse=a

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Color scheme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airline_powerline_fonts = 1

" Snippets are activated by Shift+Tab
"let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
"set wildmode=list:longest,list:full
"set complete=.,w,t

" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
" ev : edit vim (load)
" sv : save vim (apply)
nmap <silent> <leader>ev :e $MYVIMRC<CR>
autocmd bufwritepost .vimrc source $MYVIMRC

autocmd BufNewFile,BufRead Gemfile set filetype=ruby

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

set colorcolumn=80

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb :call TrimWhiteSpace()

