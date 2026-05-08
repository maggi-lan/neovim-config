vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(ev)
    vim.keymap.set("n", "<C-p>", "<cmd>MarkdownPreviewToggle<CR>", {
      buffer = ev.buf,
      desc = "Toggle Markdown Preview",
    })
  end,
})
