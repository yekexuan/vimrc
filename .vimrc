"===========================================================
" Author : trey
" Version : 0.3
" Email : 164355949@qq.com
" Last_modify : 2015-05-14
"
"===========================================================


" ======================== trey 定制 =======================

" 修改leader键
let mapleader = ','
let g:mapleader = ','

"代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" zc      折叠
" zC     对所在范围内所有嵌套的折叠点进行折叠
" zo      展开折叠
" zO     对所在范围内所有嵌套的折叠点展开
" [z       到当前打开的折叠的开始处。
" ]z       到当前打开的折叠的末尾处。
" zj       向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
" zk      向上移动到前一折叠的结束处。关闭的折叠也被计入。
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 设置 ctags文件路径。 true
" set tags=/home/trey/workspace/anjuke/tags
set tags=tags;

" 突出显示当前行  true
set cursorline
"set cursorcolumn

" 修改屏幕移动快捷键。 true
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
nmap <Leader>qq :q!<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>


"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

"set laststatus=2

" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对行号 便于普通模式下进行移动
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
let colorflag=1
function! ColorToggle()
    " if $colorflag % 2
    " if $colorflag == '1'
        " :colorscheme molokai
        " set colorflag=1
        " :colorscheme solarized
    " else
        :colorscheme solarized
        " set colorflag=2
        " :colorscheme molokai
    " endif
endfunc
" F1 废弃这个键
noremap <F1> <Esc>""
" F2 切换主题方案。
" map <F2> :colorscheme molokai<cr>
map <F2> :call ColorToggle()<cr>

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

"更高效的移动 [,, + w/fx]
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)"

"使用F9 打开标签栏导航
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"文件搜索
Bundle 'kien/ctrlp.vim'

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     /" MacOSX/Linux"
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

Bundle 'vim-scripts/matchit.zip'

" ======================= JavaScript =====================

Bundle 'pangloss/vim-javascript'
Bundle 'beautify-web/js-beautify'
Bundle 'marijnh/tern_for_vim'

"补全插件
Bundle 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_goto_buffer_command = 'horizontal-split'

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" 在下面这些文件中关闭 不启用。
" let g:ycm_filetype_blacklist = {
" \ 'tagbar' : 1,
" \ 'qf' : 1,
" \ 'notes' : 1,
" \ 'markdown' : 1,
" \ 'unite' : 1,
" \ 'text' : 1,
" \ 'vimwiki' : 1,
" \ 'gitcommit' : 1,
" \ 'php' : 1,
" \}

"let g:ycm_filetype_blacklist = {'*': 1}

let g:ycm_filetype_whitelist = {}

"Bundle 'shawncplus/phpcomplete.vim'

"PHP
"自动补全
Bundle 'StanAngeloff/php.vim'
Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'
" phpcomplete_extended 打开composer项目是会出现创建索引提示。现在不使用。

" 快速注释
Bundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

"vim shell vimshell
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell.vim'
" let g:Powline_symbols='fancy'
let g:vimshell_prompt='>  '
" vimshell 快捷键修改.
" ctags 生成php 索引文件。生成路径在当前目录下。
autocmd FileType vimshell
            \ call vimshell#altercmd#define('tags', 'ctags -R --languages=php --langmap=php:+.phtml --php-kinds=+cidf --fields=+aiKSz --extra=+q')
" 建立 别名命令 ll
autocmd FileType vimshell
            \ call vimshell#altercmd#define('ll', 'ls -l')
" vi映射成vim　
autocmd FileType vimshell
            \ call vimshell#altercmd#define('vi', 'vim')
" 使用php 脚本生成文件
autocmd FileType vimshell
            \ call vimshell#altercmd#define('artisan', '/home/trey/shell/artisan.php')
" map <Left> <Nop>
" autocmd FileType vimshell
            " \ call vimshell#altercmd#difine('', '')

" 快速加入修改环绕字符
Bundle 'tpope/vim-surround'
" for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'

" 快速去行尾空格 使用方法：  [, + <Space>]
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"vim 主题
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"=========================== 状态栏增强展示 =================================
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

" buffer 操作
Bundle "szw/vim-ctrlspace"
" buffer操作插件
" 打开 , b   退出 q esc Q
" v s 分屏打开
" d 关闭选定buffer

let g:airline_exclude_preview = 1
hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
let g:ctrlspace_default_mapping_key="<leader>b"
"Vundle配置必须 开启插件
filetype plugin indent on

syntax enable
" theme 主题 设置。 true
set t_Co=256
set background=dark
let g:rehash256 = 1
colorscheme molokai
" colorscheme beekai
" let g:molokai_original=1

" colorscheme solarized
" colorscheme wells-colors
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_termtrans=1

" git插件
" Bundle "tpope/vim-fugitive"


" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" tab 操作
" TODO: ctrl + n 变成切换tab的方法
" http://vim.wikia.com/wiki/Alternative_tab_navigation
"
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" 新建tab  Ctrl+t
nnoremap <leader>tt :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>
let g:last_active_tab = 1

" 开启语法高亮 true
syntax on
syntax enable

" 快捷切换当前路径
nmap <leader><leader>g :lcd %:p:h<CR>
"在状态栏显示正在输入的命令
set showcmd
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>""
"设置鼠标暂时不能用。 true
set mouse-=a
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 下使用 shell命令。
noremap <leader><leader>s :VimShellPop<cr>
let g:vimshell_popup_height = 40
let g:vimshell_enable_stay_insert = 1
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_prompt = 'fnamemodify(getcwd(), ":~")'

" 正向搜索字符　: ,, f
" 反向搜索字符串
map <leader><leader>r <leader><leader>F
"==========================================================
"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2
" autocmd filetype vimshell inoremap <Esc> <S>
"=========================== end ==========================
