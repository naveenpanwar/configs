syntax on
filetype plugin indent on
set modeline

execute pathogen#infect()

" Indentation [[

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number

au FileType ruby,coffee,cucumber,eruby,haml,sass,scss,yaml,markdown,vim,handlebars,jade,javascript setlocal expandtab tabstop=2 shiftwidth=2
au FileType python,perl setlocal expandtab
au FileType gitcommit set textwidth=72
" ]]
set noswapfile
set guioptions-=T  "remove toolbar
set guioptions-=m
set guioptions-=r
set guioptions-=L

set background=dark
colorscheme solarized

" plugin for syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" plugin for autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_auto_delimiter = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" settings for css3-plugin
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Nerd Tree on start if no file is selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerd Tree toggle
map <C-n> :NERDTreeToggle<CR>

" folding
set foldmethod=indent
set foldlevel=99
