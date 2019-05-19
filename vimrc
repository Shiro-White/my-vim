syntax on
set nu
set showmode
set noswapfile
set hlsearch
set incsearch
set autoread
set autowrite
set cursorline

" Tabs
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2

" YouCompleteMe and snippets
let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" set filetype
au BufNewFile,BufRead *.ejs set filetype=html

" File extension close tag
let g:closetag_filenames = '*.html, *.ejs, *.js, *.jsx, *.ts, *.tsx'

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.git', 'node_modules', 'venv']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" lightline
let g:lightline = {
	\ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
	\ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightLineFilename',
      \   'linting': 'LinterStatus',
\ },
\ }

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! LightLineFilename()
  return expand('%')
endfunction

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
autocmd FileType html,css EmmetInstall
