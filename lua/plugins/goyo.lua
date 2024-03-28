return {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  keys = {
    {
      "<leader>ug",
      "<cmd>Goyo 85<cr>",
      silent = true,
      desc = "Goyo",
    },
  },
  config = function()
    vim.cmd([[

    function! s:goyo_enter()
    set scrolloff=999
    echo 'hello'
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
