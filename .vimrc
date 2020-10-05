call plug#begin()                                           
Plug 'dense-analysis/ale'                                   
Plug 'preservim/nerdtree'                                   
Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'wadackel/vim-dogrun'
call plug#end() 

set showmatch
set autowriteall
set autoindent
set fileformat=unix
set backspace=indent,eol,start
set complete=.,w,b,u
set hlsearch
set incsearch

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

:set nocompatible
:set wildmode=full
:set tabstop=2
:set shiftwidth=2
:set number
:set incsearch
:set backspace=start,eol,indent
:highlight LineNr ctermfg=DarkGrey
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'

" open nerdtree automatically
autocmd vimenter * NERDTree
:let g:NERDTreeWinSize=20
:let NERDTreeShowHidden=1

"yaml linting
"let g:syntastic_yaml_checkers = ['yamllint']
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = 'X'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'

" general settings
:set ruler
:set showcmd
:set incsearch
:set hlsearch

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Syntax highlighting
packadd! dracula
syntax on
set background=dark

" Fix auto-indentation for YAML files
filetype plugin indent on

augroup yaml_fix
    autocmd!
    autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
let ayucolor="dark"
colorscheme ayu
