" set shell=/bin/sh
set rtp+=~/.fzf

" TODO: remap ctrl+r to noop so I don't clear the screen (and put it in some
" odd mode!)

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
set cmdheight=1
set nowrap
set autoindent
set smartindent
set backspace=indent,eol,start

" Numbers
set number
set numberwidth=5
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list
set hidden
set listchars=tab:»·,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set mouse=a

" Color scheme
syntax enable
set background=dark
set t_Co=256
let g:airline_powerline_fonts = 1
colorscheme solarized
highlight Comment cterm=NONE ctermfg=240 ctermbg=NONE
highlight VimLineComment cterm=NONE ctermfg=240 ctermbg=NONE
highlight Comment ctermfg=240
"hi SpellBad cterm=undercurl ctermbg=NONE ctermfg=NONE

" Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme             = 'powerlineish'
"let g:airline_enable_branch     = 1
"let g:airline_enable_syntastic  = 1
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

"map <c-a> :bnext<cr>
"map <c-s-a> :bprevious<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>et :e ~/.tmux.conf<CR>
nmap <silent> <leader>ez :e ~/.zshrc<CR>
autocmd bufwritepost .vimrc source $MYVIMRC

set pastetoggle=<leader>p

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.csvbuilder set filetype=ruby
" autocmd BufNewFile,BufRead *.multipart set filetype=eruby
autocmd BufReadPost *.multipart set syntax=eruby

" Highlight line of current active buffer (safe)
set cursorline
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

" Column (safe)
set colorcolumn=120

" Strip whitespace on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
" autocmd BufWritePre     *.rb,*.scss,*.erb,*.js,*.md :call TrimWhiteSpace()

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

" CtrlP settings
nmap ; :CtrlPBuffer<CR> " semi colon to show buffer
nnoremap <leader>. :CtrlPTag<cr>
" let g:ctrlp_max_files = 0 " no limit on number of files to search!
" let g:ctrlp_max_depth = 100 " max dir depth (doesnt seem to be a 0 option)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]\.(git|hg|svn)|\v[\/](node_modules|bower_components)|tmp|spec/integration/vcr_cassettes|public/assets$',
   \ 'file': '\v\.(exe|so|dll|png)$'
   \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip/
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/coverage/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

" Use The Silver Searcher (ag) instead of grep (https://github.com/ggreer/the_silver_searcher)
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldenable
set foldlevel=20

" Spelling
" TODO: Get spelling working/enabled/showing in all files (.rb)
setlocal spell spelllang=en_gb
nnoremap <leader>ss z=
nnoremap <leader>sn ]s
" add to dic
nnoremap <leader>sg zg
set complete+=kspell
set spell

"iab pry binding.pry
iab sel selenium
iab init initialize

" set shell=/bin/sh
"let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Shougo/neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd QuickFixCmdPost *grep* cwindow

nnoremap <F5> :GundoToggle<CR>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"Saves time; maps the spacebar to colon
"nmap <space> :

" "Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

" NERDTree
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

" Indent block and keep selection
vnoremap > ><CR>gv
vnoremap < <<CR>gv 

" Switch between open buffer
nmap <C-n> :bnext<CR>
" nmap <C-s-p> :bprev<CR>
nmap <C-c> :bn<CR>:bd#<CR>

" vim-indent-guides (<leader>ig)
let g:indent_guides_auto_colors = 0
" set ts=1 sw=1 et
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232

" autocmd VimEnter * NERDTree

