"=====================================================
" STUFF TO REMEMBER
" -----------------
" F5 = Strip trailing whitespace from the file
" F6 = Toggle Gundo tree (Graph of undo tree)
" F7 = Toggle tagslist (list of classes & methods in code)
" F8 = Show YankRing (:YRShow)
" ,z = Show/Hide NERDTree
" ,h = Hide search highlights
" ,k = Toggle display of scratchpad
" ,w = Show/Hide whitespace characters
" ,t = FuzzyFinder file search
" ,u = FuzzyFinder buffer search
" ,p = Toggle spellcheck on and off
" ,x = Edit .vimrc in a new tab
" ALT -up/down = move line (or visual selection) up/down
" ----- Open file from same dir as current file:
" ,ew = Open in this window
" ,es = Open in split window
" ,ev = Open in vertical split
" ,et = Open in new tab
" -----
" VISUAL MODE
" r = replace visual selection with buffer but don't yank replaced text. (can replace multiple times)
" -----
" :DiffOrig = Show a diff between the current buffer and the file it was loaded from.
" -----
" RB Open the Ruby ApiDock page for the word under cursor, in a new browser tab
" RR Open the Rails ApiDock page for the word under cursor, in a new browser tab
" -----
" RUBY DEBUGGER plugin:
" ,b  :toggle_breakpoint
" ,v  :open_variables
" ,m  :open_breakpoints
" ,t  :open_frames
" ,s  :step
" ,f  :finish
" ,n  :next
" ,c  :continue
" ,e  :exit
" ,d  :remove_breakpoints
" -----
"=====================================================
" aid TO LEARNING VIM: disable arrow keys:
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" (also for insert mode:
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

set nocompatible  " We don't want vi compatibility.
" Pathogen plugin - handle plugins in the bundles folder
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
"call pathogen#infect()
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
"yuriyvolkov/vim-snipmate
"rafaelfranca/snipmate-snippets
"
"astashov/vim-ruby-debugger
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-markdown'
Bundle 'hallettj/jslint.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tomtom/tcomment_vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tsaleh/vim-shoulda'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/gundo.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'scratch'
Bundle 'YankRing.vim'
Bundle 'miripiruni/CSScomb-for-Vim'

Bundle 'git://git.wincent.com/command-t.git'
" My help docs - Usage: ':help me'
" Included here as a bundle even though it is not hosted on github.
" Required for the help command to find it, but will dispay error during
" :BundleInstall
Bundle 'me'

syntax on
filetype plugin indent on     " required! 

set hidden " Manage buffers well - remember undo's etc.
let mapleader = ","
runtime macros/matchit.vim " Allow % to jump between if/else/end and <> as well as (), {}
set wildmenu " TAB on a command will list similar commands, not just choose the 1st match
set wildmode=list:longest " Completion similar to a shell
" Search case-insensitive unless a capital letter is in the search term:
set ignorecase
set smartcase
" Toggle display of end of line, tabs and trailing whitespace
" set listchars=tab:>-,trail:·,eol:$
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,trail:·,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" set hls " Highlight search matches
" set nocp incsearch
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
" Toggle highlight search on and off
nmap <silent> <leader>h :silent :nohlsearch<CR>

" Store tempfiles in a central spot:
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Treat all numbers as decimal (not octal)
set nrformats=

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1    " CTRL + [hjkl] to nav windows
let g:miniBufExplMapWindowNavArrows = 1 " CTRL + arrow keys
let g:miniBufExplMapCTabSwitchBufs = 1  " CTRL-Tab and CTRL-SHift-Tab to switch buffers
let g:miniBufExplModSelTarget = 1       " Avoid opening a buffer in the NERDTree window
let g:miniBufExplCheckDupeBufs = 0      " Avoid duplicate buffer check... https://github.com/fholgado/minibufexpl.vim/issues/6

" File explorer settings:
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

if has("autocmd")
  " Enable filetype detection
  " filetype plugin indent on - already set...

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  "Set thor files to use Ruby syntax
  "Set rackup files to use Ruby syntax
  au BufNewFile,BufRead  *.thor    set syntax=ruby
  au BufNewFile,BufRead  *.ru    set syntax=ruby

  " Restore cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

endif

" Edit .vimrc file
nmap <leader>x :tabedit $MYVIMRC<CR>
map <leader>o :CommandT<CR>

" COLOURSCHEME :
" Force the terminal to 256 colours.
" Otherwise the molokai theme will not work/
set t_Co=256
" For the molokai colourscheme:
" - 0 has a darker bg and darker comment text.
"let g:molokai_original = 1
" colorscheme murphy
" colorscheme vividchalk
"colorscheme molokai
colorscheme codeschool
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

" "peaksea colour:
" if ! has("gui_running") 
"   set t_Co=256 
" endif 
" " feel free to choose :set background=light for a different style 
" set background=dark 
" colors peaksea 

set cf  " Enable error files & error jumping.
" set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
"set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
" set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Minibuffer Explorer COLOUR Settings
"hi MBENormal guifg=lightblue guibg=black ctermfg=lightblue ctermbg=black
"hi MBEChanged guifg=yellow guibg=black ctermfg=white ctermbg=lightblue
"hi MBEVisibleNormal guifg=green guibg=black ctermfg=green ctermbg=black
"hi MBEVisibleChanged guifg=lightgreen guibg=black ctermfg=white ctermbg=lightgreen
" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=bg ctermfg=green ctermbg=bg
hi MBEVisibleChangedActive guifg=#F1266F guibg=bg ctermfg=magenta ctermbg=bg
hi MBEVisibleChanged guifg=#F1266F guibg=bg ctermfg=magenta ctermbg=bg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=bg ctermfg=lightblue ctermbg=bg
hi MBEChanged guifg=#CD5907 guibg=bg ctermfg=brown ctermbg=bg
hi MBENormal guifg=#808080 guibg=bg ctermfg=gray ctermbg=bg

" Formatting
set ts=2          " Tabs are 2 spaces
set bs=2          " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set sts=2         " soft tab stop
set et            " expandtab
set autoindent
set smarttab

" Spelling
" Toggle spell checking on and off with `,p`
let mapleader = ","
nmap <silent> <leader>p :set spell!<CR>
 
" Set region to British English
set spelllang=en_gb

" Visual
set showmatch     " Show matching brackets.
set mat=5         " Bracket blinking.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
" Show syntax errors in the status line: (Syntactic plugin) [[[INTERFERES WITH
" RAILS ]]]
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
" Try to use Ruby1.9 for syntax validation:
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-1.9.3-p0/bin/ruby'
" gvim "specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

"-------------------------------------------------
" map <Leader>t :FuzzyFinderTextMate<CR>
" map <leader>u :FuzzyFinderBuffer<CR>
map <leader>z :execute 'NERDTreeToggle ' . getcwd()<CR>
"-------------------------------------------------
" For opening files from the same directory as the current file:
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
"-------------------------------------------------
" Save a root-permission file with sudo after opening as user:
"cmap W w !sudo tee % >/dev/null
"cmap w!! %!sudo tee > /dev/null %
"-------------------------------------------------
" Visual mode - press r to replace text without yanking replaced text:
"vmap r "_dP
vmap r "_c<Esc>pp

"-------------------------------------------------
" Bubble single lines
nmap <M-Up> ddkP
nmap <M-Down> ddp
" Bubble multiple lines
vmap <M-Up> xkP`[V`]
vmap <M-Down> xp`[V`]
"-------------------------------------------------
" Close all buffers
nmap <leader>D :bufdo bd<CR>
 
" Switch between last two buffers
nnoremap <leader><leader> <C-^>
"-------------------------------------------------

" Strip trailing blanks from the whole file:
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
"-------------------------------------------------
" Graph of undo tree:
nnoremap <F6> :GundoToggle<CR>
"-------------------------------------------------
" Toggle tagslist
nnoremap <silent> <F7> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
"-------------------------------------------------

" YankRing - shared clipboard
nnoremap <silent> <F8> :YRShow<CR>
"-------------------------------------------------

" Toggle the Scratch pad with ,k
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction

map <leader>k :call ToggleScratch()<CR>
"-------------------------------------------------

"let g:browser = 'firefox -new-tab '
let g:browser = 'google-chrome -new-tab '
" Open the Ruby ApiDock page for the word under cursor, in a new browser tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>

" Open the Rails ApiDock page for the word under cursos, in a new browser tab
function! OpenRailsDoc(keyword)
 let url = 'http://apidock.com/rails/'.a:keyword
 exec '!'.g:browser.' '.url.' &'
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>
"-------------------------------------------------

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"-------------------------------------------------
" When editing a git commit message (.git/COMMIT_EDITMSG) you often won't start on the first line.
" http://vim.wikia.com/wiki/Always_start_on_first_line_of_git_commit_message
function MyBufEnter()
  " don't (re)store filepos for git commit message files
  if &filetype == "gitcommit"
    call setpos('.', [0, 1, 1, 0])
  endif
endfunction
au BufEnter * call MyBufEnter()
"-------------------------------------------------

