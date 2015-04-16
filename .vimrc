"===========================================================
" Author : trey
" Version : 0.1
" Email : 164355949@qq.com
" Last_modify : 2015-04-10
"
"===========================================================


" ======================== trey 定制 =======================
" 开启语法高亮 true
syntax on

"设置鼠标暂时不能用。 true
set mouse-=a

" 突出显示当前行  true
set cursorline 
set cursorcolumn

" theme 主题 设置。 true
set t_Co=256
colorscheme molokai
"colorscheme solarized
"set background=dark

" 修改屏幕移动快捷键。 true
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 设置 ctags文件路径。 true
set tags=~/webevent.61.com/tags,~/upload.61.com/tags
" 显示当前行号列号
set ruler
set showcmd
set showmode
set scrolloff=7
" 高亮搜索文本。 true
set hlsearch
" 搜索时忽略大小写 true
set ignorecase
" 增量搜索模式，即时搜索 true
set incsearch
" 关闭方向键的使用。 true
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
"=========================== end ==========================

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
syntax enable
set nu!
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
set comments=://
set comments=s1:/*,mb:*,ex0:/
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2 
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cfunctions ctermfg=81
hi Type ctermfg=118 cterm=none
hi Structure ctermfg=118 cterm=none
hi Macro ctermfg=161 cterm=bold
hi PreCondit ctermfg=161 cterm=bold


