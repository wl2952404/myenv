au BufNewFile,BufRead *.ejs set filetype=html
syntax on
set encoding=utf-8
set list!
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

"----custom command ----
let mapleader = ' '
let hlstate=0
nnoremap <silent><C-t> :NERDTreeToggle<CR>
nnoremap <silent><Leader>[ :bp<CR>
nnoremap <silent><Leader>] :bn<CR>
nnoremap <silent><Leader>- :bw<CR>
nnoremap <silent><Leader>fi :Files<CR>
nnoremap <silent><Leader>fr :Files /<CR>
nnoremap <silent><Leader>terminal :FloatermNew --autoclose=2 fish <CR>
nnoremap <silent><Leader>li :Lines<CR>
nnoremap <silent><Leader>bi :BLines<CR>
nnoremap <silent><Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><Leader>hl :if (hlstate%2 ==0) \| nohlsearch \|else \| set hlsearch \| endif \| let hlstate=hlstate+1 <CR>
nnoremap 0 ^<Esc>
nnoremap ++ :vertical res +5<CR>
nnoremap -- :res +5<CR>


"----Theme setting
set t_Co=256
set cursorline
silent! colorscheme onehalfdark
silent! let g:airline_theme='onehalfdark'
