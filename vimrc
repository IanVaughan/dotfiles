set nocompatible

" https://github.com/gmarik/vundle
filetype off                   " required! vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'thoughtbot/vim-rspec'
Bundle 'altercation/vim-colors-solarized'

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
"colorscheme github
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0
syntax enable
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16
colorscheme solarized

" Snippets are activated by Shift+Tab
"let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
"set wildmode=list:longest,list:full
"set complete=.,w,t


" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden


