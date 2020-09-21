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
let g:indentLine_char = '¦'

call plug#begin()
Plug 'dense-analysis/ale' 
Plug 'preservim/nerdtree' 
call plug#end()
" open nerdtree automatically
autocmd vimenter * NERDTree
:let g:NERDTreeWinSize=20 
:let NERDTreeShowHidden=1 

"yaml linting
let g:syntastic_yaml_checkers = ['yamllint']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" general settings
:set ruler
:set showcmd
:set incsearch
:set hlsearch
