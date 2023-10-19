vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "TelescopePrompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

-- THESE don't work
-- vim.api.nvim_create_autocmd("Python Run", {
--   pattern = "python",
--   callback = function(event)
--     vim.keymap.set(
--       "n",
--       "<leader>rp",
--       [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python4 <C-\><C-n>"#pi<CR> ]],
--       { silent = true, desc = "Run [P]ython File", buffer = event.buf }
--     )
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("Java Run", {
--   pattern = "java",
--   callback = function(event)
--     vim.keymap.set(
--       "n",
--       "<leader>rj",
--       [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
--       { silent = true, desc = "Run [J]ava File", buffer = event.buf }
--     )
--   end,
--
--   vim.api.nvim_create_autocmd("Cpp Run", {
--     pattern = "markdown",
--     callback = function(event)
--       vim.keymap.set(
--         "n",
--         "<leader>rc",
--         [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
--         { desc = "Run [C]++ File", silent = true, buffer = event.buf }
--       )
--     end,
--   }),
-- })
