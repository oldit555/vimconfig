set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Avoid a name conflict with L9
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'jashkenas/coffeescript'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set nocompatible
syntax enable
set laststatus=2
set number
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set noswapfile
set wildmenu
" ignore case in search
set smartcase
" disable folding because it is evil
set nofoldenable
" don't show intro
set shortmess+=I
let macvim_skip_colorscheme = 1
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
noremap <C-l> :tabn<cr>
noremap <C-h> :tabp<cr>
noremap <Space>t :tabnew<CR>
nnoremap <C-j>  <c-w>W
nnoremap <C-k> <c-w>w
imap <D-y> <C-y>,
imap <D-p> <C-R>"
" Add paste from buffer in inserrt mode
" Adding dash as part of the word
set isk+=-

" saving as root
cmap w!! %!sudo tee > /dev/null %

:nnoremap gr :Ack '\b<cword>\b' *<CR>
:nnoremap gR :Ack <cword> *<CR>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => vimgrep searching and cope displaying
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " When you press gr you vimgrep after the selected text
 vnoremap <silent> gr :call VisualSelection('gr')<CR>


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Helper functions
 " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 function! CmdLine(str)
      exe "menu Foo.Bar :" . a:str
      emenu Foo.Bar
      unmenu Foo
 endfunction

 function! VisualSelection(direction) range
      let l:saved_reg = @"
      execute "normal! vgvy"

      let l:pattern = escape(@", '\\/.*$^~[]')
      let l:pattern = substitute(l:pattern, "\n$","", "")

      if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
      elseif a:direction == 'gr'
        execute "Ack " . l:pattern
      elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
      elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
      endif

      let @/ = l:pattern
      let @" = l:saved_reg
 endfunction
