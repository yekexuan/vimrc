"===========================================================
" Author : trey
" Version : 0.2
" Email : 164355949@qq.com
" Last_modify : 2015-04-28
"
"===========================================================


" ======================== trey 定制 =======================
"
" 修改leader键
let mapleader = ','
let g:mapleader = ','
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
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

"set laststatus=2

" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" F1 废弃这个键,防止调出系统帮助
noremap <F1> <Esc>""



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
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"let NERDTreeDirArrows=0
"let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

"括号引号自动补全
Bundle 'Raimondi/delimitMate'

"标签导航
Bundle "majutsushi/tagbar"
"使用F9 打开标签栏导航
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"文件搜索
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ }
            "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            let g:ctrlp_working_path_mode=0
            let g:ctrlp_match_window_bottom=1
            let g:ctrlp_max_height=15
            let g:ctrlp_match_window_reversed=0
            let g:ctrlp_mruf_max=500
            let g:ctrlp_follow_symlinks=1

"补全插件
Bundle 'Valloric/YouCompleteMe'
"
""youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
""let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
"let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
"let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 "注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_tags_files = 1
"
"" let g:ycm_autoclose_preview_window_after_completion = 1
"" let g:ycm_autoclose_preview_window_after_insertion = 1
"
"" 跳转到定义处, 分屏打开
"let g:ycm_goto_buffer_command = 'horizontal-split'
"" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
""
"
""let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全,
"" 不过python关键字都很短，所以，需要的自己打开
""
"" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
"" old version
"if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
"    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
"endif
"" new version
"if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
"    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"endif
""
""         " 直接触发自动补全 insert模式下
""         " let g:ycm_key_invoke_completion = '<C-Space>'
""         " 黑名单,不启用
"let g:ycm_filetype_blacklist = {
"            \ 'tagbar' : 1,
"            \ 'gitcommit' : 1,
"            \}
"Bundle 'shawncplus/phpcomplete.vim'

"PHP
"自动补全
Bundle 'StanAngeloff/php.vim'
Bundle 'Shougo/unite.vim'
Bundle 'm2mdas/phpcomplete-extended'


Bundle "szw/vim-ctrlspace"
let g:airline_exclude_preview = 1
hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8

" 多语言语法检查
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
highlight SyntasticErrorSign guifg=white guibg=black

"vim shell
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell.vim'

"let g:Powline_symbols='fancy'


"状态栏增强展示
"新的airline配置
Bundle 'bling/vim-airline'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'


" 快速去行尾空格 [, + <Space>]
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"Vundle配置必须 开启插件
filetype plugin indent on



"========================================================
"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
"----------------------PHP函数自动补全----------------------------------------
"set dictionary-=~/.vim/vimfiles/TXT/php_funclist.txt dictionary+=~/.vim/vimfiles/TXT/php_funclist.txt
"set complete-=k complete+=k
"au FileType php call AddPHPFuncList()
"function AddPHPFuncList()
"    set dictionary-=~/.vim/vimfiles/TXT/php_funclist.txt dictionary+=~/.vim/vimfiles/TXT/php_funclist.txt
"    set complete-=k complete+=k
"endfunction
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

