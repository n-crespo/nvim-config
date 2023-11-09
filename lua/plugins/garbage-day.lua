return {
  "zeioth/garbage-day.nvim",
  enabled = false,
  event = "BufEnter",
  opts = {
    grace_period = 60 * 7,
    stop_invisible = false,
    notifications = true,
  },
}
