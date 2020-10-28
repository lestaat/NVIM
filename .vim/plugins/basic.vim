" PYTHON, YAML 
let g:closetag_filenames = '*.py,*.sh,*.json,*.yaml,*.yml'

" Python
let g:python_highlight_all = 1

" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['cocstatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}


" Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" fugitive always vertical diffing
set diffopt+=vertical

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd BufEnter *.js :silent let myIndex = SearchPatternInFile("@flow") | call SwitchFlowOrTsLsps(myIndex)
autocmd BufEnter *.jsx :silent let myIndex = SearchPatternInFile("@flow") | call SwitchFlowOrTsLsps(myIndex)

function! FindTsServer(idx, value) 
  return a:value.id == 'coc-tsserver'
endfunction

let $FZF_DEFAULT_OPTS='--layout=reverse'

function! SearchPatternInFile(pattern)
    " Save cursor position.
    let save_cursor = getcurpos()

    " Set cursor position to beginning of file.
    call cursor(0, 0)

    " Search for the string 'hello' with a flag c.  The c flag means that a
    " match at the cursor position will be accepted.
    let search_result = search(a:pattern, "c")

    " Set the cursor back at the saved position.  The setpos function was
    " used here because the return value of getcurpos can be used directly
    " with it, unlike the cursor function.
    call setpos('.', save_cursor)

    " If the search function didn't find the pattern, it will have
    " returned 0, thus it wasn't found.  Any other number means that an instance
    " has been found.
    return search_result
endfunction
