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

" Airline
" TODO: get airline bar to hide crap, eg filetype(vim/ruby), file mode (utf8)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
function! AirlineInit()
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_x = airline#section#create([])
  let g:airline_section_y = airline#section#create([])
endfunction
autocmd VimEnter * call AirlineInit()

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

" Strip whitespace on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre     *.rb,*.scss,*.erb,*.js,*.md :call TrimWhiteSpace()

" CtrlP settings
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bin|vendor)$'
let g:ctrlp_max_files = 0 " no limit on number of files to search!
let g:ctrlp_max_depth = 1000 " max dir depth (doesnt seem to be a 0 option)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
" let g:ctrlp_regexp = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,vendor/
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/chef/*
set wildignore+=*/coverage/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

" Code folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldenable
set foldlevel=20        " show everything unfolded


