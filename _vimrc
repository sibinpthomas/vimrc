" ----------------------------------------------------------------------------
" Configuring VIM options.
" ----------------------------------------------------------------------------
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
noh
se wildignore=*.o,*.obj,*.vcd,*.exe,*.dat,*.png
se nobackup writebackup
let s:vim_cstmztn_files_dir='D:\Vim_Files\'  " Create this folder at the given path if new system.
let &directory=s:vim_cstmztn_files_dir.'vim_backup'  " Create this sub-folder in the folder
let &backupdir=s:vim_cstmztn_files_dir.'vim_backup'  "   created in the above step
se nofoldenable
se foldmethod=syntax
se foldcolumn=3
se cmdheight=1
se clipboard=unnamed
set backspace=indent,eol,start
set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

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

" Setting options to mimic MS WIN like behaviour
source $VIMRUNTIME/mswin.vim
"behave mswin


" ----------------------------------------------------------------------------
" Setting up Vundle - The Vim Plugin Bundler, and various Vundle based VIM 
" plugins.
"
" Based on -
"   https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
" ----------------------------------------------------------------------------
let vundleAlreadyExists=1
let vundle_readme=expand(s:vim_cstmztn_files_dir.'bundle\Vundle.vim\README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    if isdirectory(expand(s:vim_cstmztn_files_dir.'bundle')) == 0
        call mkdir(expand(s:vim_cstmztn_files_dir.'bundle'), 'p')
    endif
    execute 'silent !git clone https://github.com/VundleVim/Vundle.vim.git "' . expand(s:vim_cstmztn_files_dir.'bundle\Vundle.vim') . '"'
    let vundleAlreadyExists=0
endif

" Setting runtimepath for Vundle use
let &rtp.=','.s:vim_cstmztn_files_dir.'bundle\Vundle.vim\'
call vundle#begin(expand(s:vim_cstmztn_files_dir.'bundle'))

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Bundles from GitHub repos:

" CCTree
Plugin 'hari-rangarajan/CCTree'

" Gundo
Plugin 'vim-scripts/Gundo'

" Jedi-Vim
Plugin 'davidhalter/jedi-vim'

" Mark
Plugin 'vim-scripts/Mark--Karkat'

" Multisearch
Plugin 'vim-scripts/multisearch.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Python-Mode
Plugin 'klen/python-mode'

" Source-Explorer
Plugin 'vim-scripts/SrcExpl'

" Taglist
Plugin 'vim-scripts/taglist.vim'

" Trinity
Plugin 'vim-scripts/Trinity'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Markdown
Plugin 'tpope/vim-markdown'

" Abolish
" To handle variants (case and lexical) of a word
Plugin 'tpope/vim-abolish'

" Vis
Plugin 'vim-scripts/vis'

" VisIncr
Plugin 'vim-scripts/VisIncr'

" Vissort
Plugin 'yaroot/vissort'

" PlantUML Syntax
Plugin 'aklt/plantuml-syntax'

" Diff sections of Vim buffers, including sections in same buffer
Plugin 'AndrewRadev/linediff.vim'

" Project workspace like feel
let g:proj_window_width = 30
let g:proj_flags = "imstv"
Plugin 'vim-scripts/project.tar.gz'

" This script implements transparent editing of gpg encrypted files
"" Tell the GnuPG plugin Symmetric encryption is desired.
"" (Uses password as opposed to public-private key)
let g:GPGPreferSymmetric=1

augroup GnuPGExtra
"" Set extra file options.
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
"" Automatically close unmodified files after inactivity.
    autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

function SetGPGOptions()
"" Set updatetime to 2 minutes.
    set updatetime=120000
"" Fold at markers.
    set foldmethod=marker
"" Automatically close all folds.
    set foldclose=all
"" Only open folds with insert commands.
    set foldopen=insert
endfunction
Plugin 'jamessan/vim-gnupg'

" Files which are necessary for my workflow such as -
"        - Man pages
"        - OS abstraction layer files
"        - Logger
Plugin 'sibinpthomas/vim_personal_xtra'

" All the Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


" Installing plugins the first time
if vundleAlreadyExists == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    execute 'PluginInstall'
endif


" ----------------------------------------------------------------------------
" Key mappings.
" ----------------------------------------------------------------------------
let g:lasttab = 1
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
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
nmap <F6> :noh<CR>
nmap <F7> :exe ':set wrap! go'.'-+'[&wrap]."=b"<CR>
smap << <C-G> < <C-G>
noremap <C-D> <C-A>
inoremap jj <Esc>
nmap zz o<Esc>
nmap vim :so $VIM\_vimrc<CR>
nmap ovim :tabe $VIM\_vimrc<CR>
nmap osal :ExploreOSAL<CR>

" Open OS Abstraction header file in new Tab.
let s:osal_files_dir=s:vim_cstmztn_files_dir.'bundle\vim_personal_xtra\platforms\'
let s:osal_files_inc_dir=s:osal_files_dir.'inc\'
let s:osal_files_src_dir=s:osal_files_dir.'src\'
let s:osal_src_files=s:osal_files_src_dir.'pltfm_auxiliary.c'

let s:osal_platform_dir=s:osal_files_dir.'cygwin\'
let s:osal_platform_inc_dir=s:osal_platform_dir.'inc\'

let s:null_os_platform_dir=s:osal_files_dir.'null_os\'
let s:null_os_platform_inc_dir=s:null_os_platform_dir.'inc\'

let g:pl_os_abst_hdr=s:osal_platform_inc_dir.'os_abstraction.h'
nmap opl :exe 'tabe '.g:pl_os_abst_hdr<CR>


" Cscope related mappings
"------------------------
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
"-----------------------------------------------------
" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
nmap <F10>   :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nmap <F11>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nmap <F12>  :TrinityToggleNERDTree<CR>


" ----------------------------------------------------------------------------
" Abbreviations.
" ----------------------------------------------------------------------------
" Finds name and path of current buffer
cabbr fecho echo expand("%:p")

" opens 'cs find 7' files in a new tab
cabbr tcs tabnew \| :cs find 7

" saves time for me
iabbr pri printf("");
iabbr hte the
iabbr teh the


" ----------------------------------------------------------------------------
" Auto Commands.
" ----------------------------------------------------------------------------
autocmd!
autocmd GUIEnter * :simalt ~x
autocmd BufEnter * silent! lcd %:p:h
autocmd TabLeave * let g:lasttab = tabpagenr()
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
" - Bram Moolenaar
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
autocmd BufEnter *.x86S se filetype=asm
autocmd BufEnter *.armS se filetype=asm
autocmd BufEnter * syntax keyword Type api_result_e API_RESULT API_SUCCESS API_FAILURE API_ON API_OFF API_TRUE API_FALSE
autocmd BufEnter * syntax keyword Type DECL_REGISTER DECL_CONST DECL_STATIC
autocmd BufEnter * syntax keyword Type CHAR UCHAR INT8 UINT8 INT16 UINT16 INT32 UINT32 INT64 UINT64
autocmd BufEnter * syntax keyword Type BOOLEAN BOOL BOOL_T bool UINT16_F INT16_F UINTMAX INTMAX
autocmd BufEnter * syntax keyword Type u8 s8 u16 s16 u32 s32 u64 s64 v_u8 v_s8 v_u16 v_s16 v_u32 v_s32 v_u64 v_s64
autocmd BufEnter * syntax keyword Type SOCKET SOCKET_HDL CBUF_HDL IMCH_HDL
autocmd BufEnter * syntax keyword Type sc_bv sc_logic sc_lv sc_int sc_uint sc_bigint sc_biguint
autocmd BufEnter * syntax keyword Special SC_MODULE SC_CTOR
autocmd BufEnter *.txt,*.md setl tw=0
autocmd BufEnter *.txt,*.md setl spell
autocmd BufEnter *.md nmap <F5> :MakeMarkdown<CR>
                               \:if findfile( expand("%:p:r").".html" ,expand("%:p:h") ) != ""<CR>
                               \    :silent! exe "!%:p:r.html"<CR> 
                               \:endif<CR> 
autocmd BufEnter *.tex nmap <F5> :MakeLatex<CR>
autocmd BufEnter *.pu nmap <F5> :MakePlantUML<CR>
                               \:if findfile( expand("%:p:r").".png", expand("%:p:h") ) != ""<CR> 
                               \    :silent! exe "!%:p:r.png"<CR> 
                               \:else<CR> 
                               \    :for line in readfile(expand("%:p"))<CR>
                               \        :let mlist = matchlist(line, '@startuml \([^ \t\r\n]*.png\)')<CR>
                               \        :if len(mlist) > 1<CR>
                               \            :silent! exe "!".mlist[1]<CR>
                               \            :break<CR>
                               \        :endif<CR>
                               \    :endfor<CR>
                               \:endif<CR>
                               \:redraw<CR>
                               " Remove 'break' to view all the generated images.
autocmd BufEnter *.tcl nmap <F5> :MakeTcl<CR>
autocmd BufEnter *.py nmap <F5> :MakePy<CR>
autocmd BufEnter *.py nmap g<F5> :MakeDebugPy<CR>
autocmd BufEnter *.py setlocal indentexpr=GetGooglePythonIndent(v:lnum)
autocmd BufEnter *.py setlocal foldmethod=indent
autocmd BufEnter *.c nmap <F9> :Makecompile<CR> :vert topleft cwin<CR> :vert resize 50<CR>

let s:if_find_exe_s="if findfile(expand(\"%:p:r\").\".exe\", expand(\"%:p:h\")) != \"\" |"
let s:else_open_qfix_s=
        \"else |".
             \"vert topleft cwin |".
             \"vert resize 50 |".
        \"endif"
let g:open_exe_or_qfix_s=
        \s:if_find_exe_s.
             \"exe \"!start cmd /c %:p:r.exe & pause\" |".
        \s:else_open_qfix_s
let g:open_gdb_or_qfix_s=
        \s:if_find_exe_s.
             \"exe \"!start gdb %:p:r.exe\" |".
        \s:else_open_qfix_s
autocmd BufEnter *.c nmap <F5>   :silent Makexec<CR>
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.c nmap a<F5>  :Makexecall<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR> 
autocmd BufEnter *.c nmap w<F5>  :Makexecweak<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.c nmap wa<F5> :Makexecallweak<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.c nmap 99<F5> :Makexec99<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.c nmap 11<F5> :Makexec11<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.c nmap g<F5>  :MakexecDebug<CR> 
                                \:silent execute g:open_gdb_or_qfix_s<CR>
autocmd BufEnter *.c nmap gw<F5> :MakexecweakDebug<CR> 
                                \:silent execute g:open_gdb_or_qfix_s<CR>

" Auto command to swap the literals on either side of the literal over which the
" mapped key (below) is pressed.
autocmd Filetype [^c]* nmap = :let mid_word=expand("<cWORD>")<CR> :exe '.s/\(".\{-}"\\|[^ \t{]\+\)\( *\)\('.mid_word.'\)\( *\)\(".\{-}"\\|[^ \t;]\+\)/\5\2\3\4\1/'<CR> :exe '/'.mid_word<CR> Nh :noh<CR>
" Auto command is different from the one above only with respect to the
" characters excluded from the description of a literal. For 'C' round braces are
" excluded in addition to the characters already in the exclusion list above.
autocmd Filetype c nmap = :let mid_word=expand("<cWORD>")<CR> :exe '.s/\(".\{-}"\\|[^ \t{(]\+\)\( *\)\('.mid_word.'\)\( *\)\(".\{-}"\\|[^ \t;)]\+\)/\5\2\3\4\1/'<CR> :exe '/'.mid_word<CR> Nh :noh<CR>
autocmd BufEnter *.c :retab
autocmd BufEnter *.h :retab
autocmd VimEnter *.c call LoadCscopeDB()
autocmd VimEnter *.h call LoadCscopeDB()
autocmd BufEnter *.cpp nmap <F5> :MakexecCPP<CR> 
                                \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.cpp nmap w<F5> :MakexecCPPweak<CR>
                                 \:silent execute g:open_exe_or_qfix_s<CR>
autocmd BufEnter *.cpp :retab
autocmd BufEnter COMMIT_EDITMSG setl spell
autocmd BufEnter COMMIT_EDITMSG setl tw=72 " Because http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html


" ----------------------------------------------------------------------------
" User defined Commands.
" ----------------------------------------------------------------------------

" C Programming related
"----------------------
let s:save_cfile_del_exe_s="w | silent exe \"!rm -f %:p:r.exe\""
let s:set_makeprg_gcc_s="set makeprg=gcc"

let s:comp_flags_full_s="\\ -ansi\\ -pedantic\\ -Wall\\ -Wextra\\ -Werror\\ -Wno-unused-parameter"
let s:debug_flags_s="\\ -g\\ -O0"
let s:c99_flags_s="\\ -std=c99"
let s:c11_flags_s="\\ -std=c11"

" Open OS Abstraction header file in new Tab.
let s:logger_dir=s:vim_cstmztn_files_dir.'bundle\vim_personal_xtra\utils\logger\'
let s:logger_inc_dir=s:logger_dir.'inc\'
let s:logger_src_file=s:logger_dir.'src\logger.c'

let s:preproc_s="\\ -DLOGGER\\ -DLOG_TO_STDOUT\\ -DLOGGER_LEVEL=0"
let s:all_inc_dir_s="\\ -I".s:osal_files_inc_dir." \\ -I".s:osal_platform_inc_dir." \\ -I".s:logger_inc_dir
let s:inp_cfile_s="\\ -o\\ %<\\ %\\ ".s:osal_src_files."\\ ".s:logger_src_file
let s:inp_cfile_preproc_inc_dir_s=s:inp_cfile_s.s:preproc_s.s:all_inc_dir_s

let s:inp_cfile_inc_dir_s="\\ -o\\ %<\\ %\\ ".s:osal_src_files."\\ ".s:logger_src_file
            \."\\ -I".s:osal_files_inc_dir." \\ -I".s:osal_platform_inc_dir." \\ -I".s:logger_inc_dir
let s:inp_all_files_s="\\ -o\\ %<\\ *.c"

" Save C file | Delete exe | Set makeprg to GCC
let s:scdesm_gcc=s:save_cfile_del_exe_s.' | '.s:set_makeprg_gcc_s

let s:makecompile_full_s="w | ".s:set_makeprg_gcc_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s

let     s:makexec_full_s=s:scdesm_gcc.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let     s:makexec_weak_s=s:scdesm_gcc.s:inp_cfile_preproc_inc_dir_s
let s:makexec_dbg_full_s=s:scdesm_gcc.s:debug_flags_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec_dbg_weak_s=s:scdesm_gcc.s:debug_flags_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec_all_full_s=s:scdesm_gcc.s:comp_flags_full_s.s:inp_all_files_s
let s:makexec_all_weak_s=s:scdesm_gcc.s:inp_all_files_s

let     s:makexec99_full_s=s:scdesm_gcc.s:c99_flags_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let     s:makexec99_weak_s=s:scdesm_gcc.s:c99_flags_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec99_dbg_full_s=s:scdesm_gcc.s:c99_flags_s.s:debug_flags_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec99_dbg_weak_s=s:scdesm_gcc.s:c99_flags_s.s:debug_flags_s.s:inp_cfile_preproc_inc_dir_s

let     s:makexec11_full_s=s:scdesm_gcc.s:c11_flags_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let     s:makexec11_weak_s=s:scdesm_gcc.s:c11_flags_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec11_dbg_full_s=s:scdesm_gcc.s:c11_flags_s.s:debug_flags_s.s:comp_flags_full_s.s:inp_cfile_preproc_inc_dir_s
let s:makexec11_dbg_weak_s=s:scdesm_gcc.s:c11_flags_s.s:debug_flags_s.s:inp_cfile_preproc_inc_dir_s

let s:call_make_s="make!"

command Makecompile :exe s:makecompile_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexec :exe s:makexec_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexecweak :exe s:makexec_weak_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecDebug :exe s:makexec_dbg_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecweakDebug :exe s:makexec_dbg_weak_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexecall :exe s:makexec_all_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexecallweak :exe s:makexec_all_weak_s.' '.<q-args>.' | '.s:call_make_s

command -nargs=? Makexec99 :exe s:makexec99_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexecweak99 :exe s:makexec99_weak_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecDebug99 :exe s:makexec99_dbg_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecweakDebug99 :exe s:makexec99_dbg_weak_s.' '.<q-args>.' | '.s:call_make_s

command -nargs=? Makexec11 :exe s:makexec11_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? Makexecweak11 :exe s:makexec11_weak_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecDebug11 :exe s:makexec11_dbg_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecweakDebug11 :exe s:makexec11_dbg_weak_s.' '.<q-args>.' | '.s:call_make_s

" Save C file | Delete preprocessed file | Set makeprg to GCC
let s:set_makeprg_armcc_s="set makeprg=armcc"
let s:save_cfile_del_preproc_s="w | silent exe \"!rm -f %:p:r.prepro.c\""
let s:save_cfile_del_x86asm_s="w | silent exe \"!rm -f %:p:r.x86S\""
let s:save_cfile_del_armasm_s="w | silent exe \"!rm -f %:p:r.armS\""
let s:preproc_flags_s="\\ -E\\ %\\ -o\\ %:p:r.prepro.c"
let s:x86asm_flags_s="\\ -o\\ %<.x86S\\ -S\\ %"
let s:armasm_flags_s="\\ -o\\ %<.armS\\ -S\\ %"
let s:inc_dir_s="\\ -I".s:osal_files_inc_dir." \\ -I".s:osal_platform_inc_dir." \\ -I".s:logger_inc_dir
let s:open_prepro_s="silent exe \"tabe\\ %:p:r.prepro.c\""
let s:open_x86asm_s="silent exe \"tabe\\ %:p:r.x86S\""
let s:open_armasm_s="silent exe \"tabe\\ %:p:r.armS\""
let       s:makepreproc_s=s:save_cfile_del_preproc_s.' | '.s:set_makeprg_gcc_s.s:preproc_flags_s.s:inc_dir_s
let   s:makeassemblygcc_s=s:save_cfile_del_x86asm_s.' | '.s:set_makeprg_gcc_s.s:x86asm_flags_s.s:inc_dir_s
let s:null_inc_dir_s="\\ -I".s:osal_files_inc_dir." \\ -I".s:null_os_platform_inc_dir." \\ -I".s:logger_inc_dir
let s:makeassemblyarmcc_s=s:save_cfile_del_armasm_s.' | '.s:set_makeprg_armcc_s.s:armasm_flags_s.s:null_inc_dir_s

command Makepreprocess :exe s:makepreproc_s.' '.<q-args>.' | '.s:call_make_s.' | '.s:open_prepro_s
command Makeassemblygcc :exe s:makeassemblygcc_s.' '.<q-args>.' | '.s:call_make_s.' | '.s:open_x86asm_s
command Makeassemblyarmcc :exe s:makeassemblyarmcc_s.' '.<q-args>.' | '.s:call_make_s.' | '.s:open_armasm_s

" C++ Programming related
"------------------------
let s:set_makeprg_gpp_s="set makeprg=g++"

let s:cpp_weak_flags_s="\\ -fpermissive"

" Save file | Delete exe | Set makeprg to G++
let s:sdsm_gpp=s:save_cfile_del_exe_s.' | '.s:set_makeprg_gpp_s

let s:makexecCpp_full_s=s:sdsm_gpp.s:comp_flags_full_s.s:inp_cfile_inc_dir_s
let s:makexecCpp_weak_s=s:sdsm_gpp.s:cpp_weak_flags_s.s:inp_cfile_inc_dir_s

command -nargs=? MakexecCPP :exe s:makexecCpp_full_s.' '.<q-args>.' | '.s:call_make_s
command -nargs=? MakexecCPPweak :exe s:makexecCpp_weak_s.' '.<q-args>.' | '.s:call_make_s

" Other Make commands
"----------------------------
command -nargs=? MakeLatex :w | call CompileLatexFile(expand("%:r"))
command -nargs=? MakeTcl :w | :!tclsh %
command -nargs=? MakeMarkdown :w | :silent exe "!multimarkdown % -o %:p:r.html"
command -nargs=? MakePlantUML :w | :silent !plantuml.jar %
command -nargs=? MakePy :w | :silent !start cmd /c % & pause
command -nargs=? MakeDebugPy :w | :silent !start python -u -m pdb %
command -nargs=? MakeDisassemblePy :w | :!python -m dis %
command -nargs=? Make :w | :se makeprg=make | :make! <args>

" Cscope related commands
"------------------------
command CSC :exe "cs kill -1" |
            \:if findfile("../test/Makefile") != "" |
            \:   let s:lmake = &makeprg |
            \:   let &makeprg = 'make' |
            \:   if expand("%:p:h:t") ==# "test" |
            \:      exe delete("./cscope.out") |
            \:      make cscope_test |
            \:      if findfile("./cscope.out") != "" |
            \:         exe "cs add ./cscope.out %:p:h" |
            \:         exe "CCTreeLoadDB ./cscope.out" |
            \:      endif |
            \:   else |
            \:      lcd ../test |
            \:      exe delete("../cscope.out") |
            \:      make cscope |
            \:      if findfile("../cscope.out") != "" |
            \:         exe "cs add ../cscope.out %:p:h:h" |
            \:         exe "CCTreeLoadDB ../cscope.out" |
            \:      endif |
            \:      lcd %:h |
            \:   endif |
            \:   let &makeprg = s:lmake |
            \:endif |
            \:if cscope_connection() == 0 |
            \:   exe delete("cscope.out") |
            \:   let s:lmake = &makeprg |
            \:   let &makeprg = 'cscope' |
            \:   make -b -R |
            \:   let &makeprg = s:lmake |
            \:   exe "cs add cscope.out" |
            \:   exe "CCTreeLoadDB cscope.out" |
            \:endif |
command CSCf :if cscope_connection()==1 | exe "cs kill 0" | exe delete("cscope.out") | :endif | :silent exe "!cscope -i %" | :cs add cscope.out | :CCTreeLoadDB cscope.out

" Miscellaneous
"--------------
command -nargs=1 Man :exe 'tabe '.s:vim_cstmztn_files_dir.'bundle\\vim_personal_xtra\\man_pages\\man3\\<args>.txt'
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command Vimtips :exe 'tabe '.s:vim_cstmztn_files_dir.'bundle\\vim_personal_xtra\\Vim_Tips.txt'
command ExploreOSAL :exe "tabe ".s:osal_files_dir


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"
" Setting syntax on has to come after all the user-defined commands 
" definitions. Can't place along with the configuring of other Vim
" options upfront because it doesn't work - need to figure out why (TODO).
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" ----------------------------------------------------------------------------
" User defined Functions.
" ----------------------------------------------------------------------------

" Load CSCOPE database on entry into 'C' filetype buffer
"-------------------------------------------------------
function! LoadCscopeDB()
    if has("cscope") && executable("cscope")
        se csprg=cscope
        set csto=0
        set cst
        set nocsverb
        se cscopequickfix=s0,c0,d0,i0,t0,e0

        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
            silent CCTreeLoadDB cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
            silent CCTreeLoadDB $CSCOPE_DB
        endif

        set csverb
    endif
endfunc


" Compile *.tex file to generate *.pdf
"-------------------------------------
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


" Search for visually selected text
" From an idea by Michael Naumann, J�rgen Kr�mer
"-----------------------------------------------
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


" if hlsearch is on  then simply turn it off
" if hlsearch is off then highlight word under cursor only
"---------------------------------------------------------
function! SetSearchReg()
    if &hlsearch == 0
        let @/ = expand('<cword>')
    endif
endfunc

" map hls to toggle the highlight search mode
nnoremap <silent> hls :call SetSearchReg()<CR>:set invhls<CR>


" Finds the next line (from current line) with more than 80 columns
"------------------------------------------------------------------
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

" Map 'col' to find the next line over 80 columns in width.
nmap col :call Column80_line()<CR>


" Indent Python in the Google way.
"---------------------------------
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


" Function to comment lines, in the given range, if they are uncommented.
" If the lines are already commented then the function uncomments them.
"----------------------------------------------------------------------
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
"nmap com :if search('\/\*.*\*\/','c',line(".")) != 0<CR> :.s/\/\*\(.*\)\*\//\1/g<CR> :else<CR> :.s/\(\s*\)\(.*\)\(\s*\)/\1\/\*\2\*\/\3/g<CR> :endif<CR> :noh<CR> 

" map 'com' to toggle commenting of the given number of lines
nmap com :call Toggle_comment_func()<CR> 
vmap com :call Toggle_comment_func()<CR> 


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
"-------------------------------------------------------------
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

" Move to same level of indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>

" Move to lower level of indentation.
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


" Function to add provided number to the below defined global variable.
" From - http://vim.wikia.com/wiki/Sum_numbers
" Usage :
" :let g:S=0
" :%s/pattern\zs\(\d\+\)\ze/\=Sum(submatch(1))/g
" :echo g:S
"----------------------------------------------------------------------
let g:S = 0  " Make sure to reset this variable before using the Sum() function
function! Sum(number)
  let g:S = g:S + a:number
  return a:number
endfunction


" ----------------------------------------------------------------------------
"  Plugin Configuration
" ----------------------------------------------------------------------------

" C syntax file controls
"-----------------------
""" allow C++ style comments
let c_cpp_comments = 1 
"unlet! c_cpp_comment " show error on C++ style comments
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


" Doxygen comments highlighting
"------------------------------
let g:load_doxygen_syntax=0
