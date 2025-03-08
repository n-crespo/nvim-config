return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = {
    auto_insert_mode = false,
    question_header = "   " .. (vim.env.USER or "User"):gsub("^%l", string.upper) .. "  ",
    answer_header = "   gpt-4o:github_models  ",
    window = { width = 0.4 },
    model = "gpt-4o:github_models",
  },
}
