set nocompatible
filetype off

call plug#begin()

set completeopt=menu,menuone
noremap <c-y> <NOP>

" vim document written by chinese
Plug 'yianwillis/vimcdoc'

" dirtory tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
" comment
Plug 'tpope/vim-commentary'

" search file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim motion on speed
Plug 'easymotion/vim-easymotion'

" quick align for different language
" Plug 'junegunn/vim-easy-align'

" lightline
Plug 'itchyny/lightline.vim'
" gitbranch display branch name on lightline
Plug 'itchyny/vim-gitbranch'

" status/tabline for vim that's light as air
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" manager vim session easier
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" git integrating for vim (modern)
if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" ale for checking syntax asynchronously
Plug 'dense-analysis/ale'

" show git commit message for vim
Plug 'rhysd/git-messenger.vim'

" git command mapping for vim
Plug 'tpope/vim-fugitive'

" colorscheme
Plug 'morhetz/gruvbox'
" Plug 'hzchirs/vim-material'
Plug 'kaicataldo/material.vim'
Plug 'sainnhe/edge'

" go
Plug 'buoto/gotests-vim', { 'for': 'go' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" docker
Plug 'ekalinin/Dockerfile.vim'

" html/css
Plug 'jvanja/vim-bootstrap4-snippets', { 'for': 'html' }

" org-mode
Plug 'jceb/vim-orgmode'

" mustache
Plug 'juvenn/mustache.vim'

" coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }


Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'hotoo/pangu.vim'

call plug#end()
filetype plugin indent on

" 显示行号
set number
" 显示标尺1
set ruler
" 折叠
set foldmethod=syntax
set foldlevel=3
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
" 拼写检查
" set spell
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8

set guifont=JetBrains\ Mono:h13
set linespace=2

" set guifont=Roboto\ Mono\ for\ Powerline:h16 " recommended
" set guifont=Source\ Code\ Pro:h15
" set guifont=Fira\ Code:h17

" 配色方案
" colorscheme solarized
"
" scheme2
" if has("gui_running")
"     set background=light
"     colorscheme papercolor
"     let g:airline_theme='papercolor'
" else
" if (has("termguicolors"))
"   set termguicolors
" endif

" scheme4
" 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
" -------------------------------------------------------------------------------------------------
let g:material_theme_style = 'default'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material

if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
    set termguicolors
endif

" scheme5
" for dark version
" set background=dark
" colorscheme edge
" let g:airline_theme = 'material'

" scheme3
" if (has("termguicolors"))
"     set termguicolors
" endif
" set background=dark
" colorscheme spacemacs-theme
" let g:airline_theme='violet'
" 指定配色方案是256色
" set t_Co=256

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" 去掉有关vi一致性模式，避免以前版本的一些bug和局限，解决backspace不能使用的问题
set backspace=indent,eol,start
set backspace=2

" 启用自动对齐功能，把上一行的对齐格式应用到下一行
set autoindent

" 依据上面的格式，智能的选择对齐方式，对于类似C语言编写很有用处
set smartindent
set breakindent

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

" 默认从下面或者右边切分窗口
" set splitbelow
" set splitright

if has("gui_running")
    " au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set lines=35 columns=110
    "set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    "set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    "set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif

" 文件缩进及tab个数
au FileType html,python,vim setl shiftwidth=4
au FileType html,python,vim setl tabstop=4
au FileType java,php,go setl shiftwidth=4
au FileType java,php,go setl tabstop=4

au FileType yaml setl tabstop=2
au FileType yaml setl softtabstop=2
au FileType yaml setl shiftwidth=2

" crash in lastest Homebrew
if has('python3')
    silent! python3 1
endif

" C风格缩进
" set cindent
" set completeopt+=longest,menu

" 功能设置

" Leader键
let mapleader=","
" 自动保存
set autowrite
" 突出显示当前行
set cursorline
" 突出显示当前列
" set cursorcolumn

" 共享剪贴板
set clipboard+=unnamedplus
" 文件被改动时自动载入
set autoread
" 顶部底部保持4行距离
set scrolloff=4

" Use Ctrl+b to open list of buffers
nmap <C-b> :Buffers<CR>

" use popup window instead of preview window
" set previewpopup=height:10,width:60

" ================== MAPPING ===========================

" window manager
map <Leader>sp :vsp<CR>
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>d :bd<CR>
map <Leader>t :terminal<CR>
map <Leader>st :vert term<CR>


" -------------------------------------------------------------------------------------------------
" use thrift highlight syntax plugin in .thrift file
" -------------------------------------------------------------------------------------------------
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

" -------------------------------------------------------------------------------------------------
" fzf plugins
" -------------------------------------------------------------------------------------------------
set rtp+=/usr/local/opt/fzf
nmap <C-p> :FZF<CR>

" ignore generated files for nodejs / rust and so on
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -type f -print -o -type l -print 2> /dev/null"

" add preview window (from bat) for `:Files` command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" -------------------------------------------------------------------------------------------------
" material theme style

" -------------------------------------------------------------------------------------------------
" airline
" -------------------------------------------------------------------------------------------------
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

" coc status bar
" let g:airline#extensions#coc#enabled = 1
" let airline#extensions#coc#error_symbol = '>'
" let airline#extensions#coc#warning_symbol = '!'

" -------------------------------------------------------------------------------------------------
" lightline
" -------------------------------------------------------------------------------------------------
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
            \ 'colorscheme': 'material_vim',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction',
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }

" -------------------------------------------------------------------------------------------------
" 禁止自动下载
" -------------------------------------------------------------------------------------------------
let g:go_disable_autoinstall=0

" -------------------------------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------------------------------
let g:NERDTreeWinPos = "right"
nmap <Leader><C-b> :NERDTreeToggle \| :NERDTreeFind<CR>
" nmap <Leader>B :NERDTreeToggle<CR>

" -------------------------------------------------------------------------------------------------
" nerdcomment
" -------------------------------------------------------------------------------------------------
" let g:NERDSpaceDelims = 1
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1

" -------------------------------------------------------------------------------------------------
" gitgutter
" -------------------------------------------------------------------------------------------------
let g:gitgutter_max_signs=9999

" -------------------------------------------------------------------------------------------------
" YCM make YCM compatible with UltiSnips (using supertab)
" -------------------------------------------------------------------------------------------------
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" -------------------------------------------------------------------------------------------------
" supertab
" -------------------------------------------------------------------------------------------------
" let g:SuperTabDefaultCompletionType = '<C-j>'

" -------------------------------------------------------------------------------------------------
" ripgrep
" -------------------------------------------------------------------------------------------------
" nnoremap <Leader>a :Rg -t <C-R>=expand('%:e')<CR><Space>


" -------------------------------------------------------------------------------------------------
" autoindent
" -------------------------------------------------------------------------------------------------
" au BufWrite * :Autoformat


" -------------------------------------------------------------------------------------------------
" rust-lang
" -------------------------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *rs set filetype=rust

au FileType rust nmap <C-l> :RustFmt<CR>
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)

" -------------------------------------------------------------------------------------------------
" vim-go
" -------------------------------------------------------------------------------------------------
au FileType go nmap <C-l> :GoFmt<CR>
au FileType go nmap <C-g> :GoDecls<CR>
au FileType go nmap <Leader><C-g> :GoDeclsDir<CR>
au FileType go nmap <Leader>gr :GoReferrers<CR>
au FileType go nmap <Leader>gd :GoDescribe<CR>
au FileType go nmap <Leader>gc :GoCallees<CR>
au FileType go nmap <Leader>i :GoImports<CR>

" highlight for go syntax
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

autocmd BufWritePost *.go normal! zv
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

" -------------------------------------------------------------------------------------------------
" indentLine
" -------------------------------------------------------------------------------------------------
let g:indentLine_char = '»' "/00BB
" set list lcs=tab:\»\ 

" -------------------------------------------------------------------------------------------------
" git-messenger
" -------------------------------------------------------------------------------------------------
" let g:git_messenger_close_on_cursor_moved=0
let g:git_messenger_no_default_mappings = 1
nmap <leader>b <Plug>(git-messenger)

" -------------------------------------------------------------------------------------------------
" snipper
" -------------------------------------------------------------------------------------------------
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger = \"<tab>"
" let g:UltiSnipsJumpBackwardTrigger = \"<s-tab>"

" -------------------------------------------------------------------------------------------------
" ale
" -------------------------------------------------------------------------------------------------
" let g:ale_lint_on_enter=0
" let g:ale_go_golint_executable = 'revive'
" let g:ale_go_govet_options = 'govet'
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '!'
" let g:ale_lint_on_insert_leave = 1

" -------------------------------------------------------------------------------------------------
" C++
" -------------------------------------------------------------------------------------------------
au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif

" -------------------------------------------------------------------------------------------------
" vim-session
" -------------------------------------------------------------------------------------------------
let g:session_autosave = 'yes'
nmap <leader>l :OpenSession

" -------------------------------------------------------------------------------------------------
" coc.nvim recommand setting
" -------------------------------------------------------------------------------------------------

source ~/.vim/coc-config.vim

" Remap for format selected region
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" show all available coc-list
nnoremap <silent> <space>l  :<C-u>CocList<cr>
" grep text from current cwd
nnoremap <silent> <space>s  :<C-u>CocList --auto-preview --interactive grep<cr>

" for coc-snippets use tab to confirm
" Use <C-l> for trigger snippet expand.
nmap <C-l> :call CocAction('format')<CR>

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" use coc-translate plug shortcut
nnoremap <silent> <space>t  :<C-u>CocCommand translator.popup<CR>

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" -------------------------------------------------------------------------------------------------
" pangu
" -------------------------------------------------------------------------------------------------
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

