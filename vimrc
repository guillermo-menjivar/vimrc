"""""""""""""""""""""
"configure pathogen
"""""""""""""""""""""

execute pathogen#infect()

"pathogen plugins
call plug#begin()
Plug 'fatih/vim-go'
"Plug 'SirVer/ultisnips'
if has('python3')
    Plug 'SirVer/ultisnips'
elseif has('python')
    Plug 'SirVer/ultisnips', {
        \   'tag': '3.2',
        \   'dir': get(g:, 'plug_home', '~/.vim/bundle') . '/ultisnips_py2',
        \ }
endif
Plug 'fatih/molokai'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'preservim/nerdtree'
Plug 'vim-python/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stephpy/vim-yaml'
Plug 'hashivim/vim-terraform'
call plug#end()

"""""""""""""""""""""""
"ultisnip configuration
"""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""
"molokai configuration
""""""""""""""""""""

let g:rehash256 = 1
let g:molokai_original = 1

colorscheme molokai

"""""""""""""""""""""
"system configuration
"""""""""""""""""""""

" assign a leader key"
let mapleader = '\'

set nu
set mouse=a
syntax on
filetype plugin indent on
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap ` ``<left>
inoremap try: try:<CR>except:<up>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>t :terminal<CR>
nnoremap <leader>o :tabnew %<CR>
nnoremap <leader>u :tabclose <CR>

"highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/"

"automatically remove trailing space
autocmd BufWritePre * %s/\s\+$//e"

"configure tabs to spaces"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent

" disable arrows"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"""""""""""""""""""""
"go configurations
"""""""""""""""""""""

let g:go_fmt_command = "goimports"
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_auto_sameids = 1
let g:go_fmt_autosave = 1




"""""""""""""""""""""
"dart configurations
"""""""""""""""""""""
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


""""""""""""""""""""""""""
" nerdtree configuration
""""""""""""""""""""""""""
au VimEnter *  NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

""""""""""""""""""""""""""
" python configuration
""""""""""""""""""""""""""
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_space_errors = 1
let g:python_highlight_builtin_funcs_kwarg = 1

"""""""""""""""""""""""""""
" python pep8 plugin
"""""""""""""""""""""""""""
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
let g:autopep8_aggressive=2
let g:autopep8_max_line_length=79
let g:autopep8_indent_size=4
let g:autopep8_diff_type='vertical'

"""""""""""""""""""""""""""
" yamllint configuration
"""""""""""""""""""""""""""
let g:syntastic_yaml_checkers = ['yamllint']

"""""""""""""""""""""""""""
" terraform configuration
"""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fmt_on_save=1
