" adapted from $VIMRUNTIME/ftplugin/help.vim

" collect #+ headers for an outline.
" each header may be indented with 0-3 spaces,
" starts with at least one #, followed by at least one space, then text as title.

" turn a header into TOC format; every # turns into 2 spaces
" "# Title" -> "Title"
" "## Introduction" -> "  Introduction"
" "###  Acknowledgement" -> "    Acknowledgement"
function s:fmt_line(line) abort
  let captures = matchlist(a:line, '\v^\s*(#+)\s+(.*)')
  let hashes = len(captures[1])
  let indent = repeat('  ', hashes - 1)
  let title = captures[2]
  return indent .. title
endfunction

function s:show_toc() abort
  let bufname = bufname('%')
  let info = getloclist(0, {'winid': 1})
  if !empty(info) && getwinvar(info.winid, 'qf_toc') ==# bufname
    lopen
    return
  endif
  call setloclist(0, range(1, line('$'))
        \->filter({ _, lnum -> getline(lnum) =~ '\v^\s{0,3}#+\s+.*$' })
        \->map({ _, lnum -> {'bufnr': bufnr('%'), 'lnum': lnum,
        \ 'text': s:fmt_line(getline(lnum))} }))
  call setloclist(0, [], 'a', {'title': 'Markdown TOC'})
  lopen
  let w:qf_toc = bufname
endfunction

nnoremap <silent> <buffer> gO <CMD>call <SID>show_toc()<CR>
