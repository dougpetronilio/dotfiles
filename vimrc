" Leader
let mapleader = ","

set hidden              " enable multiple modified buffers
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set completeopt=menuone,preview
set grepprg=ack
set clipboard=unnamed   " Copy to clipboard from vim
set backspace=2         " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile          " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set laststatus=2        " Always display the status line
set autowrite           " Automatically :write before running commands
set backspace=indent,eol,start
set autoindent          " automatically indent new line
set copyindent          " copy the previous indentation on autoindenting
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set hlsearch            " Highlight search match
set incsearch           " do incremental searching
set smartcase           " do not ignore if search pattern has CAPS
set smarttab            " insert tabs on the start of a line according to
                        "    shiftwidth, not tabstop
set visualbell          " use visual bell instead of beeping
set noerrorbells        " don't beep"
set list
set nowrap              " Do not wrap words (view)
set wildmenu            " enhanced command completion
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif


if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv

" remove trailing spaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set tags=./tags;

let g:fuzzy_ignore = "*.png;*.PNG;*.jpg;*.JPG;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Resize and Zoom
autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Numbers
set number
set numberwidth=3

" vim-rspec mappings
let g:rspec_command = "VtrSendCommand! rspec {spec}"

nnoremap <Leader>1 :call RunCurrentSpecFile()<CR>
nnoremap <Leader>2 :call RunNearestSpec()<CR>
nnoremap <Leader>3 :call RunLastSpec()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

set background=dark
syntax enable
colorscheme railscasts
