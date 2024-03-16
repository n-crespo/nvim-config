return {
  event = "LazyFile",
  "preservim/vim-litecorrect",

  config = function()
    vim.cmd([[
    let user_dict = {
    \ 'maybe': ['mabye'],
    \ 'medieval': ['medival', 'mediaeval', 'medevil'],
    \ 'then': ['hten'],
    \ 'shouldn't: ['shouldnt'],
    \ }
    augroup litecorrect
    autocmd!
    autocmd filetype markdown call litecorrect#init(user_dict)
    augroup end
    ]])
  end,
}
