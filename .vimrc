set nocompatible "vi互換オフ

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'TwitVim'
NeoBundle 'plasticboy/vim-markdown'

set nobackup
set noswapfile
set showcmd
set showmatch "括弧のマッチング
set autoindent
set smartindent
set number "行番号
syntax on "シンタックスハイライト
set cursorline "Highlght current line
colorscheme delek "for Mac
filetype indent on

"ファイル関連
set fileformat=unix
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8

"BSで消せるように
set backspace=indent,eol,start

"行末/行頭を移動可能に
set whichwrap=b,s,[,],<,>

"補完
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone

"タブを2空白に
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" templete for Ruby
autocmd BufNewFile *.rb 0r $HOME/.vim/template/ruby.txt
