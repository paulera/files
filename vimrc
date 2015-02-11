" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd			" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hidden			" Hide buffers when they are abandoned

" TAB AND INDENT
set tabstop=4		" Size of a hard tabstop
set shiftwidth=4	" size of an indent
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

set nowrap			" don't wrap lines
set number			" show numbers

" Fix arrows keys - might be needed in some environments
" In insert mode, press <Ctrl+V>+key to generate the ^[XX value
"imap ^[OC <ESC>li
"imap ^[OA <ESC>kli
"imap ^[OB <ESC>jli
"imap ^[OD <ESC>hi

" --------------------------- THEME -------------------------------- "

set t_Co=256 " enable 256 colors terminal

" keywords
highlight Statement  ctermfg=14   cterm=NONE
highlight Special    ctermfg=10   cterm=BOLD


highlight LineNr     ctermfg=DarkGrey
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Visual										cterm=reverse
highlight Comment    ctermfg=DarkGray
highlight NonText    ctermfg=DarkBlue					cterm=NONE
