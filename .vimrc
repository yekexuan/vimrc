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
"set cursorcolumn

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
"set tags=~/webevent.61.com/tags,~/upload.61.com/tags
" 显示当前行号列号
set ruler
set showcmd
set showmode
set scrolloff=7
set nu!
" 高亮搜索文本。 true
set hlsearch
" 搜索时忽略大小写 true
set ignorecase
" 增量搜索模式，即时搜索 true
set incsearch
" 设置tab长度
set tabstop=4
" 设置自动对齐空格数
set shiftwidth=4
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab

" 关闭方向键的使用。 true
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 设置编码方式
set encoding=utf-8
" 自动判断编码时
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"在状态栏显示正在输入的命令
set showcmd

"========================== Vundle 配置 ====================

"开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

"状态栏增强配置
"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2

"文件树
Bundle 'scrooloose/nerdtree'

"括号引号自动补全
Bundle 'Raimondi/delimitMate'

"标签导航
Bundle "majutsushi/tagbar"
"使用F9 打开标签栏导航
nmap <F9> :TagbarToggle<CR>

"文件搜索
Bundle 'kien/ctrlp.vim'

Bundle 'Valloric/YouCompleteMe'

Bundle 'shawncplus/phpcomplete.vim'

"let g:Powline_symbols='fancy'

"Vundle配置必须 开启插件
filetype plugin indent on



"========================================================
"
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
"----------------------PHP函数自动补全----------------------------------------
set dictionary-=~/.vim/vimfiles/TXT/php_funclist.txt dictionary+=~/.vim/vimfiles/TXT/php_funclist.txt
set complete-=k complete+=k
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/vimfiles/TXT/php_funclist.txt dictionary+=~/.vim/vimfiles/TXT/php_funclist.txt
    set complete-=k complete+=k
endfunction

"
"
"
"
"
"=========================== end ==========================
	
"set enc=utf-8
"set fenc=utf-8
"set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"syntax enable
"set cindent shiftwidth=4
"set autoindent shiftwidth=4
"set comments=://
"set comments=s1:/*,mb:*,ex0:/
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2 
"autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cfunctions ctermfg=81
"hi Type ctermfg=118 cterm=none
"hi Structure ctermfg=118 cterm=none
"hi Macro ctermfg=161 cterm=bold
"hi PreCondit ctermfg=161 cterm=bold
"

