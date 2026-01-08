function SetColor()
  vim.o.background = "dark"
  vim.cmd("colorscheme gruvbox")

  -- Core transparency
  vim.api.nvim_set_hl(0, "Normal",      { bg = nil })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })

  -- Completion menu
  vim.api.nvim_set_hl(0, "Pmenu",       { bg = nil })
end

SetColor()
