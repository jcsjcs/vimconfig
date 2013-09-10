"=====================================================
" STUFF TO REMEMBER
" -----------------
" F5 = Strip trailing whitespace from the file
" F6 = Toggle Gundo tree (Graph of undo tree)
" F7 = Toggle tagslist (list of classes & methods in code)
" F8 = Show YankRing (:YRShow)
" \f = CtrlP - find functions
" \h = Hide search highlights
" \k = Toggle display of scratchpad
" \n = Toggle line numbers on and off
" \o = CtrlP - find files
" \p = Toggle spellcheck on and off
" \w = Show/Hide whitespace characters
" \x = Edit .vimrc in a new tab
" ALT -up/down = move line (or visual selection) up/down
" ----- Open file from same dir as current file:
" \ew = Open in this window
" \es = Open in split window
" \ev = Open in vertical split
" \et = Open in new tab
" -----
" VISUAL MODE
" r = replace visual selection with buffer but don't yank replaced text. (can replace multiple times)
" -----
" :DiffOrig = Show a diff between the current buffer and the file it was loaded from.
" -----
" RB Open the Ruby ApiDock page for the word under cursor, in a new browser tab
" RR Open the Rails ApiDock page for the word under cursor, in a new browser tab
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
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-markdown'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tomtom/tcomment_vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tsaleh/vim-shoulda'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'scratch'
Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'Headlights'
Bundle 'bling/vim-airline'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'moll/vim-bbye'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'jasoncodes/ctrlp-modified.vim'

" My help docs - Usage: ':help me'
" Included here as a bundle even though it is not hosted on github.
" Required for the help command to find it, but will dispay error during
" :BundleInstall
Bundle 'me'

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>f :CtrlPFunky<Cr>
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

syntax on
filetype plugin indent on     " required! 

set hidden " Manage buffers well - remember undo's etc.
runtime macros/matchit.vim " Allow % to jump between if/else/end and <> as well as (), {}
set wildmenu " TAB on a command will list similar commands, not just choose the 1st match
set wildmode=list:longest " Completion similar to a shell
set wildignore+=vendor/bundle/**,doc/**,tmp/**,*.zip " Stop ctrl-P from searching in vendored gems dir.
" Search case-insensitive unless a capital letter is in the search term:
set ignorecase
set smartcase
" Toggle display of end of line, tabs and trailing whitespace
"set listchars=tab:>-,trail:·,eol:$
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

" For Align command, align only the 1st occurrence on a line, e.g:
" a = b = c
" aa = bb = cc
" becomes:
" a  = b = c
" aa = bb = cc
" instead of:
" a  = b  = c
" aa = bb = cc
:call Align#AlignCtrl('l:')

" Add recently accessed projects menu (project plugin)
set viminfo^=!

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

" " Try to get the cursor to change - gnome-terminal
" if has("autocmd")
"   au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"   "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"   au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
" endif

" if &term =~ '^xterm'
"   " solid underscore
"   let &t_SI .= "\<Esc>[4 q"
"   " solid block
"   let &t_EI .= "\<Esc>[2 q"
"   " 1 or 0 -> blinking block
"   " 3 -> blinking underscore
"   " Recent versions of xterm (282 or above) also support
"   " 5 -> blinking vertical bar
"   " 6 -> solid vertical bar
" endif

" Edit .vimrc file
nmap <leader>x :tabedit $MYVIMRC<CR>
map <leader>o :CtrlP<CR>
" Delete current buffer (but retain window). uses bbye plugin.
nnoremap <Leader>q :Bdelete<CR>

" Fix to get arrows to work in screen-256colors terminal (under tmux)
" nnoremap <Esc>A <up>
" nnoremap <Esc>B <down>
" nnoremap <Esc>C <right>
" nnoremap <Esc>D <left>
" inoremap <Esc>A <up>
" inoremap <Esc>B <down>
" inoremap <Esc>C <right>
" inoremap <Esc>D <left>
" map OA <up>
" map OB <down>
" map OC <right>
" map OD <left>
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

let g:airline_theme='solarized'
"let g:airline_enable_fugitive=1
"let g:airline_enable_syntastic=1
"let g:airline_exclude_preview=0

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

" Toggle numbers on and off
:nnoremap <leader>n :setlocal number!<cr>

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
"nnoremap <silent> <F8> :YRShow<CR>
"-------------------------------------------------

" Change * and # in visual mode to search for the highlighted text instead of
" extending the selection to the next matching word.
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

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
if !exists("*MyBufEnter")
  function MyBufEnter()
    " don't (re)store filepos for git commit message files
    if &filetype == "gitcommit"
      call setpos('.', [0, 1, 1, 0])
    endif
  endfunction
endif
au BufEnter * call MyBufEnter()
"-------------------------------------------------

