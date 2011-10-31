syn match FileName "\/.*\.\(h\|c\):\(0\|1\|2\|3\|4\|5\|6\|7\|8\|9\).*:" contains=Linenum
syn match Linenum ":\(0\|1\|2\|3\|4\|5\|6\|7\|8\|9\).*:" contained

hi FileName term=NONE cterm=NONE gui=NONE ctermfg=Red guifg=Red
hi Linenum term=NONE cterm=NONE gui=NONE ctermfg=Green guifg=Green
hi searchKEY term=NONE cterm=NONE gui=NONE ctermfg=Yellow guifg=Yellow
