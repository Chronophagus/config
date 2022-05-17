vim.cmd([[
  augroup user_utils
    autocmd!
    autocmd BufWritePre * lua require("default.utils").trim_trailing_whitespaces()
  augroup end
]])
