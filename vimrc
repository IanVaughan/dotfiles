set nocompatible

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
set showmatch
set ignorecase smartcase
set cursorline
set cmdheight=1
set nowrap

" Numbers
set number
set numberwidth=5

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
  " default \
  let mapleader=","
endif

" Color scheme
syntax enable
set background=dark
let g:solarized_termcolors=16 " needed
let g:airline_powerline_fonts = 1
colorscheme solarized
highlight Comment cterm=NONE ctermfg=240 ctermbg=NONE
highlight VimLineComment cterm=NONE ctermfg=240 ctermbg=NONE
highlight Comment ctermfg=240
hi SpellBad cterm=undercurl ctermbg=NONE ctermfg=NONE


" Snippets are activated by Shift+Tab
"let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
"set wildmode=list:longest,list:full
"set complete=.,w,t
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu

map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

