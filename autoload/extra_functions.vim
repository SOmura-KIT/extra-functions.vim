" extrafunctions.vim
" Last Change: 2022-11-15
" Ver: 1.0
" Maintainer: SOmura-KIT <c1100921@planet.kanazawa-it.ac.jp>

let s:save_cpo = &cpo
set cpo&vim

" 指定行の削除
function! extra_functions#delete_line(target_line) abort
    " target_line の型判定
    let current_line = line('.')
    let current_col = col('.')

    if a:target_line > line('$')
        return 0
    endif

    " 削除
    call cursor(a:target_line, 1)
    normal dd

    " カーソル位置を戻す
    if current_line < a:target_line
        call cursor(current_line, current_col)
    elseif current_line > a:target_line
        call cursor(current_line - 1, current_col)
    endif

    return 1
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
