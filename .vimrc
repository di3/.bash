"" Files, backups and undo
set nobackup
set nowb
set noswapfile

"" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

"" Whitespace
set wrap                          " wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces
set noexpandtab	                  " do not replace tab with spaces
set backspace=indent,eol,start    " backspace through everything in insert mode

"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

"" Other
set ls=2                          " always show status bar
set number                        " show line numbers
set cursorline                    " display a marker on current line
set ruler                         " show cursor position
set showmatch                     " show matching ) and }
set showmode                      " show current mode

" Add Ctrl+C, Ctrl+X, Ctrl+V keys to copy/cut/paste action
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
