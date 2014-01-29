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
set t_Co=256
set term=xterm-256color
syntax enable
set background=dark
let g:solarized_termcolors=16
"let g:solarized_termcolors=256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
let g:airline_powerline_fonts = 1
colorscheme solarized
"highlight SignColumn ctermbg=8
highlight Comment cterm=NONE ctermfg=Black ctermbg=NONE
highlight Comment ctermfg=240

let g:airline#extensions#tabline#enabled = 1

" Snippets are activated by Shift+Tab
"let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
" ev : edit vim (load)
nmap <silent> <leader>ev :e $MYVIMRC<CR>
autocmd bufwritepost .vimrc source $MYVIMRC

autocmd BufNewFile,BufRead Gemfile set filetype=ruby

set cursorline
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
autocmd BufWritePre     *.rb,*.scss,*.erb,*.js :call TrimWhiteSpace()

" CtrlP settings
"let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,vendor/
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bin|vendor)$'
"let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', }
let g:ctrlp_max_files = 0 " no limit on number of files to search!
let g:ctrlp_max_depth = 1000 " max dir depth (doesnt seem to be a 0 option)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Use The Silver Searcher (ag) instead of grep (https://github.com/ggreer/the_silver_searcher)
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let g:ctrlp_use_caching = 0
endif

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Spelling
setlocal spell
setlocal spell spelllang=en_us
nnoremap <leader>ss z=
nnoremap <leader>sn ]s
nnoremap <leader>sg zg
set complete+=kspell

