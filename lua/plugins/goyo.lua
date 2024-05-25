return {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  lazy = true,
  keys = {
    {
      "<leader>ug",
      "<cmd>Goyo<cr>",
      silent = true,
      desc = "Goyo",
    },
  },
  config = function()
    vim.cmd([[

    function! s:goyo_enter()
    Goyo 90
    setlocal nonu
    setlocal nornu
    setlocal scrolloff=999
    lua require("lualine").hide()
    endfunction

    function! s:goyo_leave()
    lua require("lualine").hide({unhide = true})
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    ]])
  end,
}
