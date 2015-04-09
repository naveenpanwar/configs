syntax on
filetype plugin indent on
set modeline

execute pathogen#infect()

" Indentation [[

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

au FileType ruby,coffee,cucumber,eruby,haml,sass,scss,yaml,markdown,vim,handlebars,jade,javascript setlocal expandtab tabstop=2 shiftwidth=2
au FileType python,perl setlocal expandtab
au FileType gitcommit set textwidth=72
" ]]
set noswapfile
set guioptions-=T  "remove toolbar
set guioptions-=m
set guioptions-=r
set guioptions-=L

colorscheme badwolf
