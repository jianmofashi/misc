set nocompatible          " 关闭兼容模式，启用 Vim 行为
syntax on                 " 语法高亮
filetype plugin indent on
set number                " 显示行号


" 基本缩进设置（可按偏好改为 2 或 8）
set tabstop=4
set shiftwidth=4
set expandtab             " 用空格替代 tab
set autoindent
set smartindent


" 搜索
set incsearch
set ignorecase
set smartcase


" 编辑体验
set backspace=indent,eol,start
set hidden                " 切换缓冲区时不强制保存
set undofile
set undodir=~/.vim/undo   " 持久化撤销


" 小工具
set wildmenu              " 命令补全菜单
set showcmd               " 显示部分命令
set ruler                 " 显示光标位置
