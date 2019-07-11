set nocompatible
filetype off

call plug#begin()

"YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --rust-completer' }
set completeopt=menu,menuone "关闭自动弹出的窗口
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-y>'
set completeopt=menu,menuone
noremap <c-y> <NOP>
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_global_ycm_extra_conf= '~/.vim/.ycm_extra_conf.py'

" manage YCM configuration files
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" dirtory tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" search file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'buoto/gotests-vim', { 'for': 'go' }
Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'jceb/vim-orgmode'

call plug#end()
filetype plugin indent on

" pathgen plugins-manager
"call pathogen#infect()
"call plug#begin()


" 刷新时间
" set updatetime=200
" 显示行号
set number
" 显示标尺1
set ruler
" 折叠
" set foldmethod=syntax
" set foldlevel=1
" 历史纪录
set history=1000
" 输入的命令显示出来，看的清楚些
set showcmd
" 启动显示状态行1，总是显示状态行2
set laststatus=2
" 使用的 shell
set shell=zsh
" 语法高亮显示
syntax on
" 高亮搜索的字符串
set hlsearch
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8
set gfn=Source\ Code\ Pro:h15
" set gfn=Fira\ Code:h17

" 配色方案
" colorscheme solarized
"
" scheme2
" if has("gui_running")
"     set background=light
"     colorscheme papercolor
"     let g:airline_theme='papercolor'
" else
if (has("termguicolors"))
  set termguicolors
endif


set background=dark
colorscheme material
let g:material_theme_style = 'dark'
let g:airline_theme = 'material'
" endif
"
" scheme3
" if (has("termguicolors"))
"     set termguicolors
" endif
" set background=dark
" colorscheme spacemacs-theme
" let g:airline_theme='violet'
" 指定配色方案是256色
" set t_Co=256

set wildmode=list:longest

set go=aAce              " 去掉难看的工具栏和滑动条

" 去掉有关vi一致性模式，避免以前版本的一些bug和局限，解决backspace不能使用的问题
set backspace=indent,eol,start
set backspace=2

" 启用自动对齐功能，把上一行的对齐格式应用到下一行
set autoindent

" 依据上面的格式，智能的选择对齐方式，对于类似C语言编写很有用处
set smartindent

" vim禁用自动备份
set nobackup
set nowritebackup
set noswapfile

" 用空格代替tab
set expandtab

" 设置显示制表符的空格字符个数,改进tab缩进值，默认为8，现改为4
set tabstop=4

" 统一缩进为4，方便在开启了et后使用退格(backspace)键，每次退格将删除X个空格
set softtabstop=4

" 设定自动缩进为4个字符，程序中自动缩进所使用的空白长度
set shiftwidth=4

" 设置帮助文件为中文(需要安装vimcdoc文档)
set helplang=cn

" 显示匹配的括号
set showmatch


" 文件缩进及tab个数
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java,php,go setl shiftwidth=4
au FileType java,php,go setl tabstop=4

" 检测文件的类型
filetype on
filetype plugin on
filetype indent on

" crash in lastest Homebrew
if has('python3')
  silent! python3 1
endif

" C风格缩进
set cindent
set completeopt=longest,menu

" 功能设置

" Leader键
let mapleader=" "
" 自动保存
set autowrite
" 突出显示当前行 
set cursorline
" 突出显示当前列
set cursorcolumn
"设置光标样式为竖线vertical bar
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" 共享剪贴板
set clipboard+=unnamed
" 文件被改动时自动载入
set autoread
" 顶部底部保持3行距离
set scrolloff=3
" attempt remit iTerm2 slow
set re=1
set ttyfast
set lazyredraw

" ================== MAPPING ===========================

" window manager 
map <Leader>sp :vsp<CR>
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>d :bd<CR>
map <Leader>t :terminal<CR>


" 目录插件
map <C-b> :NERDTreeFind<CR>
map <Leader>B :NERDTreeToggle<CR>

" use thrift highlight syntax plugin in .thrift file
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

" fzf plugins
set rtp+=/usr/local/opt/fzf
nmap <C-p> :FZF<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1

" 禁止自动下载
let g:go_disable_autoinstall=0
" NERDTree 置右
let g:NERDTreeWinPos = "right"
" gitgutter
let g:gitgutter_max_signs=9999

" YCM make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" supertab
let g:SuperTabDefaultCompletionType = '<C-j>'

" ripgrep
nnoremap <Leader>a :Rg -t <C-R>=expand('%:e')<CR><Space>

" rust-lang
autocmd BufNewFile,BufRead *rs set filetype=rust
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap <C-l> :RustFmt<CR>
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" vim-go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType go nmap <C-l> :GoFmt<CR>
au FileType go nmap <C-g> :GoDecls<CR>
au FileType go nmap <Leader><C-g> :GoDeclsDir<CR>
au FileType go nmap <Leader>gr :GoReferrers<CR>
au FileType go nmap <Leader>gd :GoDescribe<CR>
au FileType go nmap <Leader>gc :GoCallees<CR>
au FileType go nmap <Leader>i :GoImports<CR>

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "ultisnips"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

autocmd BufWritePost *.go normal! zv
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')


" git
map <Leader>b :Gblame<CR>

" snipper
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ale
let g:ale_lint_on_enter=0
let g:ale_go_golint_executable = 'revive'
let g:ale_go_govet_options = 'govet'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'
let g:ale_lint_on_insert_leave = 1

" C++
au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif

" ctags && vim-gutentags
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
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

" vim-session
let g:session_autosave = 'yes'
nmap <Leader>l :OpenSession 
