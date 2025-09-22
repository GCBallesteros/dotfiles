-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})

-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = vim.api.nvim_create_augroup("gmr_cmdheight_1_on_cmdlineenter", { clear = true }),
  desc = "Don't hide the status line when typing a command",
  command = ":set cmdheight=1",
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vim.api.nvim_create_augroup("gmr_cmdheight_0_on_cmdlineleave", { clear = true }),
  desc = "Hide cmdline when not typing a command",
  command = ":set cmdheight=0",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("gmr_hide_message_after_write", { clear = true }),
  desc = "Get rid of message after writing a file",
  pattern = { "*" },
  command = "redrawstatus",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    -- Skip non-file buffers
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype ~= "" then
      vim.wo.winbar = ""
      return
    end

    -- Get path relative to current working directory
    local full_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
    if full_path == "" then
      vim.wo.winbar = ""
      return
    end

    -- Limit to last 3 path components
    local parts = vim.split(full_path, "/")
    local max_parts = 3
    local truncated_path = table.concat(vim.list_slice(parts, #parts - max_parts + 1, #parts), "/")

    vim.wo.winbar = " " .. truncated_path
  end,
})
