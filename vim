au BufNewFile,BufRead *.ejs set filetype=html
syntax on
set encoding=utf-8
set list!
"remove  # below for specical char tab
"set invlist 
set noerrorbells
set number
set wrap linebreak
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=manual
set incsearch
set listchars=tab:\ \

"---- Plugin ----
call plug#begin('~/.vim/plugged')
"--Essential
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"--Theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
"--Optional
Plug 'Yggdroot/indentLine'
	let g:indentLine_defaultGroup = 'SpecialKey'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-man'
Plug 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
"--Develop Tool
"
"-Python

"-web dev
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
 let g:user_emmet_install_global = 0
 let g:user_emmet_leader_key=','
 autocmd FileType html,ejs,css,php EmmetInstall

call plug#end()


"---- See `man fzf-tmux` for available options----
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

augroup remember_folds
      autocmd!
        autocmd BufWinLeave * mkview
          autocmd BufWinEnter * silent! loadview
      augroup END

"----custom command shortcut----
let mapleader = ' '
let hlstate=0
nnoremap <silent><C-t> :NERDTreeToggle<CR>
nnoremap <silent><Leader>[ :bp<CR>
nnoremap <silent><Leader>] :bn<CR>
nnoremap <silent><Leader>- :bw<CR>
nnoremap <silent><Leader>fi :Files<CR>
nnoremap <silent><Leader>fr :Files /<CR>
nnoremap <silent><Leader>terminal :FloatermNew --autoclose=2 zsh <CR>
nnoremap <silent><Leader>li :Lines<CR>
nnoremap <silent><Leader>bi :BLines<CR>
nnoremap <silent><Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><Leader>hl :if (hlstate%2 ==0) \| nohlsearch \|else \| set hlsearch \| endif \| let hlstate=hlstate+1 <CR>
"nnoremap 0 ^<Esc>
nnoremap ++ :vertical res +5<CR>
nnoremap -- :res +5<CR>


"----Theme setting
set t_Co=256
set cursorline
silent! colorscheme onehalfdark
silent! let g:airline_theme='onehalfdark'

"Set comment background to tranparent
"hi Comment ctermfg=bg
hi Comment ctermfg=2

"set mouse enable
set ttymouse=xterm2
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>


"Mac specific fix for function keys
map <Esc>OQ <F2>
map <Esc>OR <F3>
map <Esc>OS <F4>
map <Esc>[16~ <F5>
map <Esc>[17~ <F6>
map <Esc>[18~ <F7>
map <Esc>[19~ <F8>
map <Esc>[20~ <F9>
map <Esc>[21~ <F10>
map <Esc>[23~ <F11>
map <Esc>[24~ <F12>et encoding=utf-8

"Save and run
"map <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
map <F9> :w <bar> exec '!clear && g++ -std=c++20 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>


