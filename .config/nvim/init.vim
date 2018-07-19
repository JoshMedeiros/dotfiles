execute pathogen#infect()
let mapleader=","

" UI
colorscheme solarized                       " A nice theme
syntax enable                               " Enable syntax highlighting
set background=dark                         " Set background to dark
set number                                  " Line numbers
set showcmd                                 " Command at bottom
set cursorline                              " Highlight current line
set showmatch                               " Highlight matching braces/brackets/parentheses
set laststatus=2                            " Always show the status line
set t_Co=256                                " 256 colors
set display+=lastline                       " Avoid replacing last lines that don't fit with @'s
set mouse=a                                 " Enable mouse mode
set colorcolumn=80,120                      " Highlight columns 80 and 120
highlight ColorColumn ctermbg=0|            " Set the highlight column color
filetype indent on                          " Load indent files based on filetype

" Spacing
set tabstop=4                               " Number of spaces per tab
set softtabstop=4                           " Always use 4 spaces (even if tabstop is higher)
set shiftwidth=4                            " Number of spaces for indenting
set expandtab                               " Use spaces instead of tabs

" Searching
set ignorecase                              " Make searches case insensitive by default
set smartcase                               " Make searches case sensitive if using an upper case character
set incsearch                               " Search as characters are entered
set hlsearch                                " Highlight searches
nnoremap <leader><space> :nohlsearch<CR>|   " Stop highlighting search

" Folding
set foldenable                              " Enable folding (hiding sections)
set foldlevelstart=10                       " Default the first 10 levels to open
set foldnestmax=10                          " Don't nest folds past 10 levels
set foldmethod=indent                       " Fold based on the indentation
nnoremap <space> za|                        " Fold by hitting space

" Movement
nnoremap j gj|                              " Move down on wrapped lines
nnoremap <Down> gj|                         " Move down on wrapped lines
nnoremap k gk|                              " Move up on wrapped lines
nnoremap <Up> gk|                           " Move up on wrapped lines
nmap <silent> <C-k> :wincmd k<CR>           " Focus window on the top
nmap <silent> <C-j> :wincmd j<CR>           " Focus window on the bottom
nmap <silent> <C-h> :wincmd h<CR>           " Focus window on the left
nmap <silent> <C-l> :wincmd l<CR>           " Focus window on the right


" Visual
nnoremap gV `[v`]                           " Highlight all

" Shortcuts
inoremap jk <esc>|                          " Remap jk to exit insert mode
nnoremap <leader>ev :vsp $MYVIMRC<CR>|      " Edit .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>|   " Source .vimrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>|      " Edit .zshrc
cmap w!! w suda://%|         " Type :w!! to save with sudo

" Plugins

" Vim Airline
let g:airline_powerline_fonts=1             " Enable powerline fonts
let g:airline#extensions#tabline#enabled=1  " Enable tabline (with mouse supportin neovim!)

" CtrlP
let g:ctrlp_match_window='bottom,order:ttb' " Show the match window at the bottom, from top to bottom
let g:ctrlp_working_path_mode='r'           " List files in under source control
let g:ctrlp_user_command='ag %s -l --nocolor --hidden --ignore .git/ -g ""' " Set search command

" Buffers
set hidden                                  " Allow buffers to be hidden with unsaved changes
nnoremap <leader>h :bprevious<CR>|          " Switch to previous buffer
nnoremap <leader><Left> :bprevious<CR>|     " Switch to previous buffer
nnoremap <leader>l :bnext<CR>|              " Switch to next buffer
nnoremap <leader><Right> :bnext<CR>|        " Switch to next buffer

" NERDTree
let NERDTreeQuitOnOpen=1                    " Quit NERDTree when opening a file
nmap <silent> <c-n> :NERDTreeToggle<CR>     " Toggle NERDTree

" Completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"| " Enable tab completion

" Auto CTags
set tags=tags,.git/tags                     " Enable .git/tags as an alternative tags file
let g:auto_ctags=1                          " Enable generating ctags on write
let g:auto_ctags_directory_list=['.git']    " Use .git for saving ctags
let g:auto_ctags_tags_name='tags'           " Save file as tags
let g:auto_ctags_tags_args='--tag-relative -R --sort=yes' " Set ctags arguments

" Deoplete
let g:deoplete#enable_at_startup=1          " Enable deoplete at startup
let g:clang_use_library=1                   " Use libclang instead of the binary, much faster
let g:clang_user_options='-std=c++14'       " Default clang options
let g:clang_snippets=1                      " Enable snippets (placeholders)
set conceallevel=2                          " Enable concealing of snippet placeholders
set concealcursor=inv                       " Enable concealing for i,n, and v modes
set completeopt=menu,longest                " Hide preview window

" Building
nnoremap <F7> :w<CR>:CMakeBuild<CR>
" Hack for running asynchronously
nnoremap <F5> :w<CR>:call jobstart(['cmake', '--build', 'build', '--target', 'run'])<CR>

" Syntastic
let g:syntastic_cpp_compiler='clang++'      " Set C++ compiler to clang
let g:syntastic_cpp_compiler_options='-std=c++14' " Use C++14

" GPG
let g:GPGDefaultRecipients=['Josh Medeiros']
