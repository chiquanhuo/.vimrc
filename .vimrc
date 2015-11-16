"我的配置
"author=huozhiquan

"禁用vim兼容模式
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'

" vim-go
Plugin 'fatih/vim-go'

" html 
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/matchit'

" php5.5
Plugin 'vim-scripts/php.vim-for-php5'

"puppet
Plugin 'rodjek/vim-puppet'

"zephir
Plugin 'vim-scripts/Zephyr-Color-Scheme'

"TagBar
Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"Nerdtree
Plugin 'scrooloose/nerdtree'
map<F8> :NERDTreeToggle<CR>

"neocomplete
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup=1

"查找文件插件 ctrlp
Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|git|hg|svn|rvm)$',
            \ 'link': '',
            \}
map <F3> :CtrlP :pwd<CR>

"sql
Plugin 'vim-scripts/SQLUtilities'
let g:omni_sql_no_default_maps=1

" python工具集合，python-mode自带pep8检查，需要放在syntastic前面
Plugin 'klen/python-mode'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_run_key = '<leader><C-R>'
" python checker
let g:pymode_lint_checker = 'pep8'
" Map keys for autocompletion
let g:pymode_lint_ignore = 'E501,C901'
" Disable python folding
let g:pymode_folding = 0
" Key for show python documentation
let g:pymode_doc_key = 'K'
" 兼容virtualenv
let g:pymode_virtualenv = 1

"语法检查,在python-mode后面以免冲突
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
let g:syntastic_ignore_files=[".py$"]
highlight SyntasticErrorSign guifg=white guibg=black

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set history=700

set copyindent

set autoread

set textwidth=200
"vim encoding
set encoding=utf-8

"vim saving file encoding
set fileencoding=utf-8

"设置中文帮助
set helplang=cn

set smartindent

"括号匹配模式
set showmatch

"显示状态行
set ruler

syntax enable
syntax on
set t_Co=256
"设置配色方案
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1

set number 

"自动检测文件类型
filetype plugin indent on

"启动就显示状态栏
set laststatus=2

set expandtab
au FileType html,python,vim,javascript,php,go setl tabstop=4
au FileType html,python,vim,javascript,php,go setl shiftwidth=4

"模仿Windows中的快捷键
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+p
vmap <C-v> "+p
nmap <C-a> ggvG$

"Golang 版本的Tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"禁止自动下载
let g:go_disable_autoinstall=0

"自动补全

if has("autocmd")
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
     augroup END
 
     " 自动补全符号
     function! AutoClose()
         :inoremap ( ()<ESC>i
         :inoremap " ""<ESC>i
         :inoremap ' ''<ESC>i
         :inoremap ` ``<ESC>i
         :inoremap { {}<ESC>i
         :inoremap [ []<ESC>i
         :inoremap ) <c-r>=ClosePair(')')<CR>
         :inoremap } <c-r>=ClosePair('}')<CR>
         :inoremap ] <c-r>=ClosePair(']')<CR>
     endf
 
     function! ClosePair(char)
         if getline('.')[col('.') - 1] == a:char
             return "\<Right>"
         else
             return a:char
         endif
     endf
 
     " to close for PHP and Javascript script
    au FileType go,php,c,python,javascript exe AutoClose()
endif

if has("gui_running")
    set guifont=Ubuntu\ Mono\ Regular\ 10
endif

"查找不区分大小写
set ignorecase

"开启鼠标
if has('mouse')
    set mouse=a
endif
