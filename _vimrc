set nocompatible
set exrc
set autoread
se tw=80
se colorcolumn=+1
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
se ts=4
se sw=4
se et
se wm=0
se ai
se wildignore=*.o,*.obj,*.vcd,*.exe,*.dat
se nobackup writebackup
let s:vim_cstmztn_files_dir='E:\Vim_Files\'
let &directory=s:vim_cstmztn_files_dir.'vim_backup'
let &backupdir=s:vim_cstmztn_files_dir.'vim_backup'
se nofoldenable
se foldmethod=syntax
se foldcolumn=3
se cmdheight=1
se clipboard=unnamed
if has('gui_running')
    se guifont=Courier_New:h12:cANSI
endif    
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Setting up Vundle - The Vim Plugin Bundler
" Based on -
"   https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
let vundleAlreadyExists=1
let vundle_readme=expand(s:vim_cstmztn_files_dir.'bundle\vundle\README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    if isdirectory(expand(s:vim_cstmztn_files_dir.'bundle')) == 0
        call mkdir(expand(s:vim_cstmztn_files_dir.'bundle'), 'p')
    endif
    execute 'silent !git clone https://github.com/gmarik/vundle "' . expand(s:vim_cstmztn_files_dir.'bundle\vundle') . '"'
    let vundleAlreadyExists=0
endif

" Setting runtimepath for Vundle use
let &rtp.=','.s:vim_cstmztn_files_dir.'bundle\vundle\'
call vundle#rc(expand(s:vim_cstmztn_files_dir.'bundle'))

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" CCTree
Bundle 'vim-scripts/CCTree'

" Gundo
Bundle 'vim-scripts/Gundo'

" Jedi-Vim
Bundle 'davidhalter/jedi-vim'

" Mark
Bundle 'vim-scripts/Mark--Karkat'

" Multisearch
Bundle 'vim-scripts/multisearch.vim'

" Nerdtree
Bundle 'scrooloose/nerdtree'

" Python-Mode
Bundle 'klen/python-mode'

" Source-Explorer
Bundle 'vim-scripts/SrcExpl'

" Taglist
Bundle 'vim-scripts/taglist.vim'

" Trinity
Bundle 'vim-scripts/Trinity'

" Fugitive
Bundle 'tpope/vim-fugitive'

" Markdown
Bundle 'tpope/vim-markdown'

" Abolish
" To handle variants (case and lexical) of a word
Bundle 'tpope/vim-abolish'

" Markdown Preview
Bundle 'swaroopch/vim-markdown-preview'

" Vis
Bundle 'vim-scripts/vis'

" VisIncr
Bundle 'vim-scripts/VisIncr'

" Vissort
Bundle 'yaroot/vissort'

" PlantUML Syntax
Bundle 'aklt/plantuml-syntax'

" Files which are necessary for my workflow such as -
"        - Man pages
"        - OS abstraction layer files
Bundle 'sibinpthomas/vim_personal_xtra'

" Installing plugins the first time
if vundleAlreadyExists == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    execute 'BundleInstall'
endif


amenu icon=$VIM/Compile.bmp ToolBar.Compile <F5><CR>
amenu icon=$VIM/WeakCompile.bmp ToolBar.WeakCompile w<F5><CR>
nmap gF c :tabe <cfile><CR>
nmap gh :vimgrep <cword> ./**/*.h<CR>
nmap 1gh :vimgrep <cword> ../**/*.h<CR>
nmap 2gh :vimgrep <cword> ../../**/*.h<CR>
nmap 3gh :vimgrep <cword> ../../../**/*.h<CR>
nmap ~t :tabnew<CR>
nmap ~T :tabnew<CR>
nmap t :tabn<CR>
nmap T :tabp<CR>
nmap \\ %
vmap \\ %
vmap <C-c> "*y
nmap <C-BS> :e#<CR>
nmap 1<C-BS> :e#1<CR>
nmap 2<C-BS> :exec "e#" . getchar()-48<CR>
nmap 3<C-BS> :e#3<CR>
nmap 4<C-BS> :e#4<CR>
nmap 5<C-BS> :e#5<CR>
nmap 6<C-BS> :e#6<CR>
nmap 7<C-BS> :e#7<CR>
nmap 8<C-BS> :e#8<CR>
nmap <C-p> :hardcopy<CR>
nmap <C-Space> :cwin<CR>
nmap <C-Up> :cp<CR>
nmap <C-Down> :cn<CR>
nmap <C-Space>v :vert topleft cwin<CR> :vert resize 50<CR>
nmap <C-Space>V :vert topleft cwin<CR> :vert resize 50<CR>
nmap ; :%s/\<<C-R>=expand("<cword>")<CR>\>//gn
nmap , :vimgrep /\<<C-R>=expand("<cword>")<CR>\>/ ./**/*.[ch]
nmap K :Man <C-R>=expand("<cword>")<CR><CR>
smap << <C-G> < <C-G>
noremap <C-D> <C-A>
inoremap jj <Esc>

" run cscope and add the cscope.out database to the session
nmap csc :CSC<CR> 

" run cscope and add the cscope.out database to the session
nmap cscf :CSCf<CR> 

" simple find
nmap <C-F1> :cs find 0 <C-R>=expand("<cword>")<CR><CR> 

" simple find appended to quickfix window
nmap c<C-F1> :se cscopequickfix=s-,c0,d0,i0,t0,e0<CR> :cs find 0 <C-R>=expand("<cword>")<CR><CR> :se cscopequickfix=s0,c0,d0,i0,t0,e0<CR>

" find definition
nmap <C-F2> :cs find 1 <C-R>=expand("<cword>")<CR><CR>

" find definition appended to quickfix window
nmap c<C-F2> :se cscopequickfix=s-,c0,d0,i0,t0,e0<CR> :cs find 1 <C-R>=expand("<cword>")<CR><CR> :se cscopequickfix=s0,c0,d0,i0,t0,e0<CR>

" functions called by this function
nmap <C-F3> :cs find 2 <C-R>=expand("<cword>")<CR><CR>

" functions called by this function appended to quickfix window
nmap c<C-F3> :se cscopequickfix=s0,c0,d-,i0,t0,e0<CR> :cs find 2 <C-R>=expand("<cword>")<CR><CR> :se cscopequickfix=s0,c0,d0,i0,t0,e0<CR>

" functions calling this function
nmap <C-F4><F4> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

" functions calling this function appended to quickfix window
nmap c<C-F4><F4> :se cscopequickfix=s0,c-,d0,i0,t0,e0<CR> :cs find 3 <C-R>=expand("<cword>")<CR><CR> :se cscopequickfix=s0,c0,d0,i0,t0,e0<CR>

" Find this file
nmap <C-F5> :cs find 7 <C-R>=expand("<cfile>")<CR><CR>

" Find files #including this file
nmap <C-F6> :cs find 8 <C-R>=expand("<cfile>")<CR><CR>


" Trinity stuff
" http://www.vim.org/scripts/script.php?script_id=2347
"
" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F10>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F11>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F12>  :TrinityToggleNERDTree<CR>


 
" Finds name and path of current buffer
cabbr fecho echo expand("%:p")

" opens 'cs find 7' files in a new tab
cabbr tcs tabnew \| :cs find 7

" saves time for me
iabbr pri printf("");
iabbr hte the

nmap zz o<Esc>
nmap vim :so $VIM\_vimrc<CR>
nmap ovim :tabe $VIM\_vimrc<CR>


autocmd!
autocmd GUIEnter * :simalt ~x
autocmd BufEnter *.86S se filetype=asm
autocmd BufEnter *.armS se filetype=asm
autocmd BufEnter * syntax keyword Type api_result_e API_RESULT API_SUCCESS API_FAILURE API_ON API_OFF API_TRUE API_FALSE
autocmd BufEnter * syntax keyword Type DECL_REGISTER DECL_CONST DECL_STATIC
autocmd BufEnter * syntax keyword Type CHAR INT8 UCHAR UINT8 INT16 UINT16 INT32 UINT32 INT64 UINT64 BOOLEAN
autocmd BufEnter * syntax keyword Type u8 s8 u16 s16 u32 s32 u64 s64 v_u8 v_s8 v_u16 v_s16 v_u32 v_s32 v_u64 v_s64 SOCKET 
autocmd BufEnter * syntax keyword Type sc_bv sc_logic sc_lv sc_int sc_uint sc_bigint sc_biguint
autocmd BufEnter * syntax keyword Special SC_MODULE SC_CTOR
autocmd BufEnter *.txt setl tw=0 
autocmd BufEnter *.md nmap <F5> :MakeMarkdown<CR>
autocmd BufEnter *.tex nmap <F5> :MakeLatex<CR>
autocmd BufEnter *.pu nmap <F5> :MakePlantUML<CR>
                               \:if findfile( expand("%:p:r").".png", expand("%:p:h") )!=""<CR> 
                               \    :!%:p:r.png<CR> 
                               \:else<CR> 
                               \    :for line in readfile(expand("%:p"))<CR>
                               \        :let mlist = matchlist(line, '@startuml \([^ \t\r\n]*.png\)')<CR>
                               \        :if len(mlist) > 1<CR>
                               \            :silent exe "!".mlist[1]<CR>
                               \            :break<CR>
                               \        :endif<CR>
                               \    :endfor<CR>
                               \:endif<CR>
                               " Remove 'break' to view all the generated images.
autocmd BufEnter *.tcl nmap <F5> :MakeTcl<CR>
autocmd BufEnter *.py nmap <F5> :MakePy<CR>
autocmd BufEnter *.py nmap g<F5> :MakeDebugPy<CR>
autocmd BufEnter *.py setlocal indentexpr=GetGooglePythonIndent(v:lnum)
autocmd BufEnter *.py setlocal foldmethod=indent
autocmd BufEnter *.c nmap <F9> :Makecompile<CR> :vert topleft cwin<CR> :vert resize 50<CR>
autocmd BufEnter *.c nmap <F5> :Makexec<CR> 
                              \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                              \    :!%:p:r.exe<CR>
                              \:else<CR>
                              \    :vert topleft cwin<CR>
                              \    :vert resize 50<CR>
                              \:endif<CR> 
autocmd BufEnter *.c nmap a<F5> :Makexecall<CR> 
                               \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                               \    :!%:p:r.exe<CR>
                               \:else<CR>
                               \    :vert topleft cwin<CR>
                               \    :vert resize 50<CR>
                               \:endif<CR> 
autocmd BufEnter *.c nmap w<F5> :Makexecweak<CR> 
                               \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                               \    :!%:p:r.exe<CR>
                               \:else<CR>
                               \    :vert topleft cwin<CR>
                               \    :vert resize 50<CR>
                               \:endif<CR> 
autocmd BufEnter *.c nmap wa<F5> :Makexecallweak<CR> 
                                \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                                \    :!%:p:r.exe<CR>
                                \:else<CR>
                                \    :vert topleft cwin<CR>
                                \    :vert resize 50<CR>
                                \:endif<CR> 
autocmd BufEnter *.c nmap g<F5> :MakexecDebug<CR> 
                               \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                               \    :!gdb %:p:r.exe<CR>
                               \:else<CR>
                               \    :vert topleft cwin<CR>
                               \    :vert resize 50<CR>
                               \:endif<CR> 
autocmd BufEnter *.c nmap gw<F5> :MakexecweakDebug<CR> 
                                \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                                \    :!gdb %:p:r.exe<CR>
                                \:else<CR>
                                \    :vert topleft cwin<CR>
                                \    :vert resize 50<CR>
                                \:endif<CR> 
autocmd BufEnter *.c :retab
autocmd BufEnter *.h :retab
autocmd BufEnter *.cpp nmap <S-F5> :MakexecCPP<CR> 
                                  \:if findfile( expand("%:p:r").".exe" ,expand("%:p:h") )!=""<CR>
                                  \    :!%:p:r.exe<CR>
                                  \:else<CR>
                                  \    :vert topleft cwin<CR>
                                  \    :vert resize 50<CR>
                                  \:endif<CR> 
autocmd BufEnter *.cpp :retab
autocmd BufEnter COMMIT_EDITMSG setl spell
autocmd BufEnter COMMIT_EDITMSG setl tw=0

command -nargs=1 Man :exe 'tabe '.s:vim_cstmztn_files_dir.'bundle\\vim_personal_xtra\\man_pages\\man3\\<args>.txt'
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command CSC :if cscope_connection()==1 | exe "cs kill 0" | exe delete("cscope.out") | :endif | :silent exe "!cscope -b -R" | :cs add cscope.out | :CCTreeLoadDB cscope.out
command CSCf :if cscope_connection()==1 | exe "cs kill 0" | exe delete("cscope.out") | :endif | :silent exe "!cscope -i %" | :cs add cscope.out | :CCTreeLoadDB cscope.out
command -nargs=? Make :w | :se makeprg=make | :make! <args>
command Makecompile :w | :se makeprg=gcc\ -c\ -ansi\ -pedantic\ -Wall\ -Wextra\ -Werror\ -Wno-unused-parameter\ -o\ %<.o\ % | :make!
command Makepreprocess :w | :silent exe "!gcc -E % > %:p:r.prepro.c" | :tabe %:p:r.prepro.c
command Makeassemblygcc :w | :silent exe "!gcc -o %<.86S -S % -I".s:osal_files_dir | :tabe %:p:r.86S
command Makeassemblyarmcc :w | :silent exe "!armcc -o %<.armS -S %" | :tabe %:p:r.armS
command Vimtips :exe 'tabe '.s:vim_cstmztn_files_dir.'bundle\\vim_personal_xtra\\Vim_Tips.txt'

let s:osal_files_dir=s:vim_cstmztn_files_dir.'bundle\vim_personal_xtra\osal\'
command -nargs=? Makexec :w | :silent exe "!rm -f %:p:r.exe" | :let &makeprg='gcc -ansi -pedantic -Wall -Wextra -Werror -Wno-unused-parameter -o %< % -I'.s:osal_files_dir.' <args>' | :make!
command -nargs=? Makexecweak :w | :silent exe "!rm -f %:p:r.exe" | :let &makeprg='gcc -o %< % -I'.s:osal_files_dir.' <args>' | :make!
command -nargs=? MakexecDebug :w | :silent exe "!rm -f %:p:r.exe" | :let &makeprg='gcc -g -O0 -ansi -Wall -Wextra -Werror -Wno-unused-parameter -o %< % -I'.s:osal_files_dir | :make!
command -nargs=? MakexecweakDebug :w | :silent exe "!rm -f %:p:r.exe" | :let &makeprg='gcc -g -O0 -o %< % -I'.s:osal_files_dir | :make!
command -nargs=? Makexecall :w | :silent exe "!rm -f %:p:r.exe" | :se makeprg=gcc\ -ansi\ -pedantic\ -Wall\ -Wextra\ -Werror\ -Wno-unused-parameter\ -o\ %<\ *.c | :make!
command -nargs=? Makexecallweak :w | :silent exe "!rm -f %:p:r.exe" | :se makeprg=gcc\ -o\ %<\ *.c | :make!
command -nargs=? MakexecCPP :w | :silent exe "!rm -f %:p:r.exe" | :se makeprg=g++\ -ansi\ -Wall\ -Wextra\ -Werror\ -Wno-unused-parameter\ -o\ %<\ % | :make!
command -nargs=? MakeLatex :w | call CompileLatexFile(expand("%:r"))
command -nargs=? MakeTcl :w | :!tclsh %
command -nargs=? MakeMarkdown :w | :MarkdownPreview
command -nargs=? MakePlantUML :w | :silent !plantuml.jar %
command -nargs=? MakePy :w | :!%
command -nargs=? MakeDebugPy :w | :!python -u -m pdb %
command -nargs=? MakeDisassemblePy :w | :!python -m dis %

let pl_os_abstraction=s:osal_files_dir.'os_abstraction.h'
nmap opl :exe 'tabe '.pl_os_abstraction<CR>

source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/autotag.vim
source $VIMRUNTIME/mswin.vim
"behave mswin


if has("cscope") && executable("cscope")
    se csprg=cscope
    set csto=0
    set cst
    set nocsverb
    se cscopequickfix=s0,c0,d0,i0,t0,e0
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        exe 'so '.s:vim_cstmztn_files_dir.'bundle\CCTree\ftplugin\cctree.vim'
        silent CCTreeLoadDB cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
        exe 'so '.s:vim_cstmztn_files_dir.'bundle\CCTree\ftplugin\cctree.vim'
        silent CCTreeLoadDB $CSCOPE_DB
    else
        autocmd BufEnter * silent! lcd %:p:h
    endif
    set csverb
else
    autocmd BufEnter * silent! lcd %:p:h
endif
noh



""" Compile *.tex file to generate *.pdf
function! CompileLatexFile(filename_root)
    if filereadable(a:filename_root . ".dvi")
        exe delete(a:filename_root . ".dvi")
    endif
    if filereadable(a:filename_root . ".ps")
        exe delete(a:filename_root . ".ps")
    endif
    if filereadable(a:filename_root . ".pdf")
        exe delete(a:filename_root . ".pdf")
    endif

    echo a:filename_root." is the name of the file."
    set makeprg=latex\ -halt-on-error\ -c-style-errors\ -interaction=nonstopmode\ -quiet\ %
    set efm=%A%f:%l:%m
    make!

    if filereadable(a:filename_root . ".dvi")
        silent exe "!dvips " . a:filename_root
    else
        echo "Error generating " . a:filename_root . ".dvi file. \n'latex' command failed"
        vert topleft cwin
        vert resize 50
        return
    endif

    if filereadable(a:filename_root . ".ps")
        silent exe "!ps2pdf " . a:filename_root . ".ps"
    else
        echo "Error generating " . a:filename_root . ".ps file. \n'dvips' command failed."
        return
    endif

    if filereadable(a:filename_root . ".pdf")
        silent exe "!" . a:filename_root . ".pdf"
    else
        echo "Error generating " . a:filename_root . ".pdf file. \n'ps2pdf' command failed."
        return
    endif
endfunc


" smap <C-f> <C-g>:call RegCopy()<CR>
" xmap <C-f> :call RegCopy()<CR>
" function! RegCopy() range
"     let l:char=nr2char(getchar())
"     if (l:char<='z' && l:char>='a') || (l:char<='Z' && l:char>='A')
"         let l:saved_reg = @"
"         execute "normal! vgvy"
"         call setreg( l:char, @")
"         "echo @"
"         "echo getreg(l:char)
"         let @" = l:saved_reg
"     else
"         echo ":Error in arg to RegCopy()"
"     endif
" endfunction
" 
" nmap <C-b> :call RegPaste()<CR>
" imap <C-b> <C-o>:call RegPaste()<CR>
" function! RegPaste() range
"     let l:char=nr2char(getchar())
"     if (l:char<='z' && l:char>='a')
"         exec "normal \"" . l:char . "p"
"     else
"         echo ":Error in arg to RegPaste()"
"     endif
" endfunction

""" Search for visually selected text {{{
""" From an idea by Michael Naumann, Jürgen Krämer.
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "\r"
    else
        execute "normal /" . l:pattern . "\r"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

xnoremap <silent> * :call VisualSearch('f')<CR>:set hls<CR>
xnoremap <silent> # :call VisualSearch('b')<CR>:set hls<CR>
snoremap <silent> * <C-g>:call VisualSearch('f')<CR>:set hls<CR>
snoremap <silent> # <C-g>:call VisualSearch('b')<CR>:set hls<CR>




""" map <F10> to toggle the highlight search mode
""" if hlsearch is on  then simply turn it off
""" if hlsearch is off then highlight word under cursor only
nnoremap <silent> hls :call SetSearchReg()<CR>:set invhls<CR>
function! SetSearchReg()
    if &hlsearch == 0
        let @/ = expand('<cword>')
    endif
endfunc



""" map 'col' to find the next line in the current buffer which extends beyond 80
""" columns in width.
""" Finds the next line (from current line) with more than 80 columns
nmap col :call Column80_line()<CR>
function! Column80_line() range
    let l:save_cursor = getpos(".")
    let l:count = a:firstline+1
    let l:column = 0
    let l:lastline = line("$")
    while l:column <= 81
        call cursor(l:count,1) "set the cursor at the beginning of the line
        let l:column = col("$")
        let l:count = l:count + 1        
        if l:count > l:lastline
            break
        endif
    endwhile
    if l:column <= 81
        call setpos('.', l:save_cursor) "places cursor at the same line from
                                        "where function was invoked
    else
        call cursor((l:count - 1),l:column) "set the cursor at the end of the 
                                            "line with more than 80 columns
    endif
endfunction


""" Indent Python in the Google way.

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"


"*****************************************************************************
"** input:   strProjectPath:  path of Visual Studio project                 
"**          strProjectName:  name of Visual Studio project                 
"** output:  none                                                           
"*****************************************************************************
"** remarks:                                                                
"**   Setup some variables so that the script functions can find the make   
"**   file, exe-file...                                                     
"**   E.g.  :call VVS_SetEnvironment( 'f:\prog\GALer', 'GALer' )            
"*****************************************************************************
function VVS_SetEnvironment( strProjectPath, strProjectName )

    so $VIM\vim70\VimVS6.vim

    call VVS_Init( a:strProjectPath, a:strProjectName )

endfunction


""" map 'com' to toggle commenting of the given number of lines
""" if the lines are already commented, uncomment them
""" if the lines aren't commented, comment them
nmap com :call Toggle_comment_func()<CR> 
vmap com :call Toggle_comment_func()<CR> 
function! Toggle_comment_func() range
    let l:count = a:firstline
    "echo l:count.'  count'
    "echo a:lastline.'  a:lastline'
    while l:count <= a:lastline
        "echo l:count.'  count'
        call cursor(l:count,1) "set the cursor at the beginning of the line
        if search('^\s*\/\*.*\*\/\s*$','c',line(".")) != 0 
            :.s/\/\*\(.*\)\*\//\1/g "uncomment line 
        else 
            mark t
            call cursor(l:count-1,1) "set the cursor at the beginning of the 
                                     "line just before the current line
            if search('^\s*$','c',line("'t")) == 0 "to avoid commenting of empty lines
                call cursor(l:count,1) "set the cursor back to the original line
                :.s/\(\s*\)\(.*\)\(\s*\)/\1\/\* \2 \*\/\3/g  "comment line
            endif
        endif
        let l:count = l:count + 1
    endwhile
    call cursor(a:lastline + 1, 0) "set cursor at the line right after the
                                   "comment block 
    noh 
endfunction
"erstwhile toggle_comment
"nmap com :if search('\/\*.*\*\/','c',line("."))!=0<CR> :.s/\/\*\(.*\)\*\//\1/g<CR> :else<CR> :.s/\(\s*\)\(.*\)\(\s*\)/\1\/\*\2\*\/\3/g<CR> :endif<CR> :noh<CR> 


" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" From - http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


"****** C syntax file controls ******
""" allow C++ style comments
let c_cpp_comments = 1 
"unlet! c_cpp_comment " show eror on C++ style comments
""" Highlight any spaces before tabs, and any whitespace at the end of a line as an error.
let c_space_errors = 1
""" Do not highlight any whitespace at the end of a line as an error.
let c_no_trail_space_error = 1 " Only takes effect if c_space_errors is defined
""" Use this syntax file to highlight .h files
""" This variable should be defined otherwise .h files are highlighted as if they were C++.
let c_syntax_for_h  = 1
""" Highlight C94 language features extra to C89 as errors.
let c_C94_warn = 1
""" Highlight C99 language features extra to C89 and C94 as errors.
"let c_C99_warn = 1
""" Highlight C++ reserved words as errors.
let c_cpp_warn = 1 


"****** Doxygen comments highlighting ******
let g:load_doxygen_syntax=0

""" --Begin Tip
""" Toggle indent highlighting with
"""   ToggleBlockHL
""" --End Tip
