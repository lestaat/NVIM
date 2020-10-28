"" Basics 
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
syntax enable

"" Plugins
so ~/.vim/plugins.vim
so ~/.vim/plugins/config.vim
so ~/.vim/maps.vim
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugins/yaml.vim

"""Color
colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"
let g:deoplete#enable_at_startup = 1
let g:airline_theme="dark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 2
highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
