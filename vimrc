"=====================================================
" STUFF TO REMEMBER
" -----------------
" F5 = Strip trailing whitespace from the file
" F6 = Toggle Gundo tree (Graph of undo tree)
" ,z = Show/Hide NERDTree
" ,h = Hide search highlights
" ,k = Toggle display of scratchpad
" ,w = Show/Hide whitespace characters
" ,t = FuzzyFinder file search
" ,u = FuzzyFinder buffer search
" ,p = Toggle spellcheck on and off
" ,x = Edit .vimrc in a new tab
" CTRL -up/down = move line (or visual selection) up/down
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
" RB Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
" RR Open the Rails ApiDock page for the word under cursor, in a new Firefox tab
" :RF Fold file according to Ruby rules
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

" Pathogen plugin - handle plugins in the bundles folder
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

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

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1    " CTRL + [hjkl] to nav windows
let g:miniBufExplMapWindowNavArrows = 1 " CTRL + arrow keys
let g:miniBufExplMapCTabSwitchBufs = 1  " CTRL-Tab and CTRL-SHift-Tab to switch buffers
let g:miniBufExplModSelTarget = 1       " Avoid opening a buffer in the NERDTree window

" File explorer settings:
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

" Force the terminal to 256 colours.
" Otherwise the molokai theme will not work/
set t_Co=256
" if &t_Co > 2 || has("gui_running")
"   " Enable syntax highlighting
"   syntax on
" endif
if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on

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
" For the molokai colourscheme:
" - 0 has a darker bg and darker comment text.
let g:molokai_original = 1
" colorscheme murphy
" colorscheme vividchalk
colorscheme molokai

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

hi link MBENormal String 
hi link MBEChanged Number
hi link MBEVisibleNormal Identifier
hi link MBEVisibleChanged Keyword

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
"-------------------------------------------------
" Visual mode - press r to replace text without yanking replaced text:
vmap r "_dP

"-------------------------------------------------
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
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
nnoremap <F5> :GundoToggle<CR>
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

let g:browser = 'firefox -new-tab '
" Open the Ruby ApiDock page for the word under cursor, in a new Firefox tab
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  exec '!'.g:browser.' '.url.' &'
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR>

" Open the Rails ApiDock page for the word under cursos, in a new Firefox tab
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


" REST OF FILE = FOLDING (USE RR COMMAND)

" FoldSearch-based folding.
" Copyright (C) 2005 Mauricio Fernandez <mfp@acm.org>
" Current version: http://eigenclass.org/hiki.rb?Usable+Ruby+folding+for+Vim
"
" Add this to your .vimrc and fold with :R. The default fold expression will
" work with Ruby scripts; you can specify where folds start with
" let b:foldsearchexpr = 'myexpression'
" e.g.
"  let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
" or so for Java.
" One way to have this buffer-local variable set is
" au Filetype java let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
"
" It is possible to have comments above a method/class/etc be included in the
" fold, by setting b:foldsearchprefix. All the lines above the detected fold
" matching b:foldsearchprefix will be included in said fold.
" For instance, for Ruby code:
"   let b:foldsearchprefix = '\v^\s*(#.*)?$'
" which can be automated with
"   au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'
"
" Changelog:
" 2005-12-12  1.1  use b:foldsearchprefix to prepend comments to a fold.

"{{{ set s:sid

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

"{{{ FoldText
function! s:Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
  let linenum = v:foldstart
  while linenum <= v:foldend
      let line = getline(linenum)
      if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
    break
      else
    let linenum = linenum + 1
      endif
  endwhile
  if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
      " all lines matched the prefix regexp
      let line = getline(v:foldstart)
  endif
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let diff = v:foldend - v:foldstart + 1
  return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

"{{{~foldsearch adapted from t77: Fold on search result (Fs <pattern>)
"Fs pattern Fold search
"Vimtip put to good use by Ralph Amissah zxy@irc.freenode.net
"Modified by Mauricio Fernandez <mfp@acm.org>
function! Foldsearch(search)
  setlocal fdm=manual
  let origlineno = line(".")
  normal zE
  normal G$
  let folded = 0     "flag to set when a fold is found
  let flags = "w"    "allow wrapping in the search
  let line1 =  0     "set marker for beginning of fold
  if a:search == ""
      if exists("b:foldsearchexpr")
    let searchre = b:foldsearchexpr
      else
    "Default value, suitable for Ruby scripts
    "\(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
    let searchre = '\v(^\s*(def|class|module|attr_reader|attr_accessor|alias_method)\s' .
                 \ '|^\s*\w+attr_(reader|accessor)\s|^\s*[#%"0-9]{0,4}\s*\{(\{\{|!!))' .
                 \ '|^\s*[A-Z]\w+\s*\='
    let b:foldsearchexpr = searchre
      endif
  else
      let searchre = a:search
  endif
  while search(searchre, flags) > 0
    let  line2 = line(".")
    while line2 - 1 >= line1 && line2 - 1 > 0 "sanity check
       let prevline = getline(line2 - 1)
       if exists("b:foldsearchprefix") && (match(prevline, b:foldsearchprefix) != -1)
           let line2 = line2 - 1
       else
           break
       endif
    endwhile
    if (line2 -1 >= line1)
      execute ":" . line1 . "," . (line2-1) . "fold"
      let folded = 1       "at least one fold has been found
    endif
    let line1 = line2     "update marker
    let flags = "W"       "turn off wrapping
  endwhile
  normal $G
  let  line2 = line(".")
  if (line2  >= line1 && folded == 1)
    execute ":". line1 . "," . line2 . "fold"
  endif
  execute "normal " . origlineno . "G"
endfunction

"{{{~folds Fold Patterns
" Command is executed as ':Fs pattern'"
command! -nargs=? -complete=command Fs call Foldsearch(<q-args>)
command! -nargs=? -complete=command Fold call Foldsearch(<q-args>)
"command! R Fs \(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
command! RF Fs

