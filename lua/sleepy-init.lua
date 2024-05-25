local M = {}

local status = false
M.log_length = 2
M.log_buf = vim.api.nvim_create_buf(true, true)
M.init_line = 1

function M.keep_looping_lenght()
  local log_lines = {}
  
  for i = 1, M.log_length do
    table.insert(log_lines, "")
  end

  return log_lines
end

function M.create_sleepy_log_buffer()
  vim.api.nvim_buf_set_lines(M.log_buf, 0, -1, false, { "[ Sleepy-Nvim's Log ]", unpack(M.keep_looping_lenght())})
  vim.api.nvim_buf_set_name(M.log_buf, "*sleepy-log*")
  vim.api.nvim_buf_set_option(M.log_buf, "modifiable", true)
  status = true
end

function M.sleepy_log(msg)
    if not status then
        M.create_sleepy_log_buffer()
    end

    local bufnr = vim.fn.bufnr("*sleepy-log*")

    if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
        local lines = {msg}
        vim.api.nvim_buf_set_text(bufnr, M.init_line, 0, M.init_line, 0, lines)
        M.log_length = M.log_length + 1
        print(M.log_length, M.init_line)
        M.init_line = M.init_line + 1
        print(M.init_line)
        M.keep_looping_lenght()
        vim.api.nvim_buf_set_lines(M.log_buf, 0, -1, false, { "[ Sleepy-Nvim's Log ]", unpack(M.keep_looping_lenght())}) 
    else
        print("Buffer is not valid or not loaded. Cannot log message: " .. msg)
    end
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
  M.sleepy_log("My turn!")
  M.sleepy_log("My turn!")
  vim.g.loaded_netrw       = 1
  vim.g.loaded_netrwPlugin = 1
end

M.init()
return M
