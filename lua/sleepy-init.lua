local M = {}

function M.sleepy_log(msg)
    local bufnr = vim.fn.bufnr("*sleepy-log*")

    if vim.api.nvim_buf_get_option(bufnr, "modifiable") then
        vim.cmd("call append(line('$'), '" .. vim.fn.escape(msg, "'") .. "')")
    else
        print("Buffer is not modifiable. Cannot log message: " .. msg)
    end
end

function M.create_sleepy_log_buffer()
  local log_buffer = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_lines(log_buffer, 0, -1, false, { "[ Sleepy-Nvim\'s Log ]"})
  vim.api.nvim_buf_set_name(log_buffer, "*sleepy-log*")
end

function M.neovide_init()
  if vim.g.neovide then
    local isWayland = vim.fn.empty(vim.fn.getenv("WAYLAND_DISPLAY")) == 0

    if isWayland then
      M.sleepy_log("(Neovide is running under Wayland)")
    else
     M.sleepy_log("Neovide is running under Xorg")
    end
  end
end

-- if anything has to be ran as init add it here
function M.init()
  M.create_sleepy_log_buffer()
  M.neovide_init()
  M.sleepy_log("Loading Sleepy-Init...")

  vim.g.loaded_netrw       = 1
  vim.g.loaded_netrwPlugin = 1
end

M.init()
return M
