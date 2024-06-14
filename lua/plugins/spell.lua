-- super nice spell checking plugin, auto corrects words while typing and
-- extends functionality of builtin spell checker
return {
  "preservim/vim-litecorrect",
  ft = { "markdown" },
  config = function()
    vim.cmd([[
    let user_dict = {
    \ 'maybe': ['mabye'],
    \ 'medieval': ['medival', 'mediaeval', 'medevil'],
    \ 'then': ['hten'],
    \ "shouldn\'t": ['shouldnt'],
    \ }
    augroup litecorrect
      autocmd!
      autocmd filetype markdown call litecorrect#init(user_dict)
      " autocmd FileType rmd, rmarkdown call litecorrect#init(user_dict)
    augroup end
    ]])
  end,
}
