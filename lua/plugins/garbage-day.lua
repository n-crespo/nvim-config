return {
  "zeioth/garbage-day.nvim",
  event = "BufEnter",
  opts = {
    grace_period = 60 * 7,
    stop_invisible = false,
    notifications = true,
  },
}