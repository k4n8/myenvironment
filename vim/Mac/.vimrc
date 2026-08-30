" BS
set backspace=indent,eol,start

" DELESC
fixdel

" color
syntax on
set t_Co=256
highlight Visual cterm=reverse
"colorscheme desert256

" match
set showmatch

" wrap
set whichwrap=b,s,h,l,<,>,[,]

" encode
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,utf-8,sjis,cp932

"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~

"全角スペースを表示
" pattern 1
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"デフォルトの ZenkakuSpace を定義
"scriptencoding cp932
"scriptencoding utf-8
function! ZenkakuSpace()
  "highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  highlight ZenkakuSpace cterm=underline ctermbg=Grey gui=underline guibg=Grey
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpace をカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call ZenkakuSpace()
endif


au BufNewFile,BufRead *.ejs set filetype=html

autocmd FileType changelog :set formatoptions=q
autocmd FileType * setlocal formatoptions-=ro
