if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif

syn on " 语法高亮

set bs=2 " 在insert模式下用退格键删除
set nocompatible " Disable vi-compatibility 
filetype off
"colorscheme molokai
set laststatus=2 " 总是显示状态行
set expandtab    " 以下三个配置配合使用, 设置tab和缩进空格数
set shiftwidth=4
set tabstop=4

set cursorline " 为光标所在行加下划线
set number	" 显示行号
set autoread    " 文件在vim之外修改过, 自动重新读入

set hls " 检索时高亮显示
"set foldmethod=marker " 代码折叠
"set fdm=syntax
"set fdm=indent
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""
" NERDTree
""""""""""""
map <F5> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree " 导致YCM 不能正常工作
set autochdir



""""""""""""
" vim-airline-superman
"   customization
" themes (vim-airline-themes)
"
" https://vimawesome.com/plugin/vim-airline-superman
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" https://github.com/vim-airline/vim-airline-themes
""""""""""""

"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'

"let g:airline_theme = 'base16' " set theme
let g:airline_powerline_fonts = 1


""""""""""""
" tagbar
""""""""""""
map <F6> :TagbarToggle<CR>


""""""""""""
" ctrlp-vim
" https://vimawesome.com/plugin/ctrlp-vim-red
" Ctrl + p
""""""""""""

""""""""""""
" a.vim
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches
""""""""""""
nnoremap <silent> <F8> :A<CR>     " switch to cpp/c files
nnoremap <silent> <F9> :AS<CR>    " splits and switches
nnoremap <silent> <M-F9> :AV<CR>  " vertical splits and switches 




""""""""""""
" indentline
" https://vimawesome.com/plugin/indentline
""""""""""""


""""""""""""
" fugitive
" https://vimawesome.com/plugin/fugitive-vim
""""""""""""

set rtp+=~/.fzf


" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F11> :!cscope -Rbkq <CR>
map <silent> <F12> :YcmCompleter FixIt<CR>

"nnoremap <leader>jx :YcmCompleter FixIt<cr>

filetype plugin indent on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

