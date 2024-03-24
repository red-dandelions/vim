"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基础设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " 设置不兼容原始vi模式
filetype off             " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set rnu                  " 开启相对行号
set cursorline           " 高亮显示当前行
highlight CursorLine   cterm=NONE ctermbg=235 guibg=NONE guifg=NONE
                         " 高亮显示当前行具体设置
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
                         " 设置状态行显示的信息
"set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   
                         " 允许光标出现在最后一个字符的后面
set mouse=a              " 开启鼠标支持
set backspace=indent,eol,start 
                         " 允许删除换行符
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单
set hidden               " 文件未保存时切换缓冲区由vim保存
set display=lastline     " 避免折行后某一行不见
set fillchars=vert:\ ,stl:\ ,stlnc:\   
                         " 在分割窗口间留出空白
set autochdir            " 移至当前文件所在目录
"set foldmethod=indent    " 根据缩进进行折叠
set foldmethod=syntax    " 根据语法进进行折叠
"set foldmethod=marker    " 根据标志进行折叠
set tags=./tags;,tags    " 加载 tags 文件
set fileformat=unix      " 设置文件格式为 unix
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
                         " 再次打开文件光标在上次编辑的行首
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k
                         " 窗口切换 
noremap j gj
noremap gj j
noremap gk k
noremap k gk
                         " 移动对应屏幕行

map <F12> :call Clss()<CR>
func! Clss()
    exec '!clear'
    endfunc              " F12一键清屏
map <F8> :call Term()<CR>
func! Term()
    exec 'terminal'
    endfunc              " F8调出终端
map <C-n> :NERDTreeToggle<CR>
                         " Ctrl n开启目录树nerdtree插件
map <F4> :TlistToggle<CR>
                         " F4 开始函数列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    
                         " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=2            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码
set history=2000         " 历史ex命令记录上限提高
set showmatch            " 高亮显示匹配括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set nowrapscan          " 搜索到文件两端停止
set incsearch           " 实时搜索

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')              " 指定安装插件的目录

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                     " 目录树
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " 目录树美化
Plugin 'vim-airline/vim-airline'                 " 状态栏美化
Plugin 'vim-airline/vim-airline-themes'          " 状态栏美化主题
Plugin 'luochen1990/rainbow'                     " 彩虹括号
Plugin 'vim-scripts/DoxygenToolkit.vim'          " Doxygen 注释自动生成
Plugin 'vim-scripts/taglist.vim'                 " 函数列表插件
Plugin 'ludovicchabant/vim-gutentags'            " 自动索引插件

call vundle#end()            
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 退出最后一个文件时关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Doxygen 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 在文件首处 :DoxAuthor 会自动填充
" 设置 DoxygenToolkit 插件在@author区域自动填充名字
let g:DoxygenToolkit_authorName="vanilla@"
" 讲光标停在数据结构声明或者函数声明的第一行，:Dox 会自动生成注释


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数列表插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Inc_Winidth=0
let Tlist_Auto_Open=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动索引插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"  gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


