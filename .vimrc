if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
scriptencoding cp932 
set nocompatible "vi$B8_49%*%U(B
set nobackup
set noswapfile
set showcmd
set showmatch "$B3g8L$N%^%C%A%s%0(B
set autoindent
set smartindent
set number "$B9THV9f(B
syntax on "$B%7%s%?%C%/%9%O%$%i%$%H(B
set cursorline "Highlght current line
colorscheme delek "for Mac
filetype indent on

"$B%U%!%$%k4XO"(B
set fileformat=unix
set fileformats=unix,dos,mac

"BS$B$G>C$;$k$h$&$K(B
set backspace=indent,eol,start

"$BJd40(B
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone

"$B%?%V$r(B2$B6uGr$K(B
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"$BJ8;z%3!<%I$N<+F0G'<1(B
"http://www.kawaz.jp/pukiwiki/?vim#content_1_7
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv$B$,(BeucJP-ms$B$KBP1~$7$F$$$k$+$r%A%'%C%/(B
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv$B$,(BJISX0213$B$KBP1~$7$F$$$k$+$r%A%'%C%/(B
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings$B$r9=C[(B
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " $BDj?t$r=hJ,(B
  unlet s:enc_euc
  unlet s:enc_jis
endif

" $BF|K\8l$r4^$^$J$$>l9g$O(B fileencoding $B$K(B encoding $B$r;H$&$h$&$K$9$k(B
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction

  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" $B2~9T%3!<%I$N<+F0G'<1(B
set fileformats=unix,dos,mac
" $B""$H$+!{$NJ8;z$,$"$C$F$b%+!<%=%k0LCV$,$:$l$J$$$h$&$K$9$k(B
if exists('&ambiwidth')
  set ambiwidth=double
endif
