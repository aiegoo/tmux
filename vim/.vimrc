set encoding=utf-8

call pathogen#infect()

syntax on

colo  solarized
set background=dark
filetype plugin indent on

au VimEnter * wincmd w

set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Enable powerline for vim
set  rtp+=/root/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
let $GIT_ASKPASS='true'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'raimondi/delimitmate'
Plugin 'indentpython.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"plugin
let $GIT_ASKPASS='true'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'morhetz/gruvbox'
"Plugin 'HerringtonDarkholme/yats.vim' "TS Syntax
"
Plugin 'tpope/vim-fugitive'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'   " Modal git editing with <leader>g
Plugin 'tpope/vim-rhubarb'
Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'
Plugin 'dag/vim-fish'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'

nmap <C-n> :NERDTreeToggle<CR>


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ================ General Config ====================
"
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set clipboard=unnamed
set backspace=indent,eol,start  "Allow backspace in insert mode
set autoread                    "Reload files changed outside vim
set clipboard^=unnamed 
set number relativenumber

au BufNewFile, BufRead *.py
set tabstop=4
set autoindent
set smarttab
set shiftwidth=4
set softtabstop=4
set expandtab

au BufNewFile, BufRead *.js, *.html, *.css
set tabstop=2
set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

"display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:∙

set linebreak    "Wrap lines at convenient points

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-endwise
set runtimepath^=~/.vim/bundle/supertab
autocmd StdinReadPre * let s:std_inth


"miscellaneous
"=strftime("%c")<cr>p
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>
set backup

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
" from 
if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ""
      if i != winnr()
        if &wrap
         " HACK: when wrapping lines is enabled, we use the maximum number
         " of columns getting highlighted. This might get calculated by
         " looking for the longest visible line and using a multiple of
         " winwidth().
         let l:width=256 " max
        else
         let l:width=winwidth(i)
        endif
        let l:range = join(range(1, l:width), ',')
      endif
      call setwinvar(i, '&colorcolumn', l:range)
    endfor
  endfunction
  augroup DimInactiveWindows
    au!
    au WinEnter * call s:DimInactiveWindows()
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
  augroup END
endif

" coc config
 let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \]

 set rtp+=$HOME/anaconda3/lib/python3.7/site-packages/powerline/bindings/vim

 " Always show statusline
   set laststatus=2
 "
 " " Use 256 colours (Use this setting only if your terminal supports 256
 " colours)
   set t_Co=256


" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous
" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push
" Show commits for every source line
nnoremap <Leader>gb :Gblame<CR>  " git blame
" Open current line in the browser
nnoremap <Leader>gb :.Gbrowse<CR>

" Open visual selection in the browser
vnoremap <Leader>gb :Gbrowse<CR>
" Open current line in the browser
nnoremap <Leader>gb :.Gbrowse<CR>

" Open visual selection in the browser
vnoremap <Leader>gb :Gbrowse<CR>

" air-line
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'



if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1 "Habilita o breadcrumb que exibe o caminho do arquivo

" git tmux integration
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {C-h} :TmuxNavigateLeft<cr>
nnoremap <silent> {C-j} :TmuxNavigateDown<cr>
nnoremap <silent> {C-k} :TmuxNavigateUp<cr>
nnoremap <silent> {C-l} :TmuxNavigateRight<cr>
nnoremap <silent> {C-\} :TmuxNavigatePrevious<cr>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
