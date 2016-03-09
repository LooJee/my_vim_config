autocmd BufNewFile *.sh,*.cpp,*.[ch],*.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "# coding=utf-8")
        call append(line(".")+1, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "> File Name: ".expand("%"))
        call append(line(".")   +1, "> Author: Jerry Lu") 
        call append(line(".")+2, "> Mail: mynameislujie1992@gmail.com")
        call append(line(".")+3, "> Created Time: ".strftime("%c"))
        call append(line(".")+4, "************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
endfunc
autocmd BufNewFile * normal G

