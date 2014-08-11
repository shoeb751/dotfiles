set whichwrap+=<,>,h,l,[,] " Wrap cursor against line boundaries
set number
set tabstop=2
set autoindent
set copyindent
set shiftwidth=2  " number of spaces to use for autoindenting
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set mouse=a
set pastetoggle=<F2>

" Remappings
nnoremap ; :

" Auto install plugins
execute pathogen#infect()

filetype plugin indent on
if has('autocmd')
	autocmd filetype python set expandtab
endif

if &t_Co >= 256 || has("gui_running")
	" colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
	" switch syntax highlighting on, when the terminal has colors
	syntax on
endif

" Mouse related features
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction
