local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.85)
  local height = opts.height or math.floor(vim.o.lines * 0.65)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  vim.api.nvim_set_option_value('winhl', 'Normal:PopupNormal,FloatBorder:Normal', { win = win })
  return { buf = buf, win = win }
end

local function close_terminal()
  if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_close(state.floating.win, true)
    state.floating.win = nil
  end
end

local function open_terminal()
  if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
    return
  end

  state.floating = create_floating_window { buf = state.floating.buf }

  if vim.bo[state.floating.buf].buftype ~= "terminal" then
        vim.fn.jobstart(vim.o.shell, {term = true})
        vim.keymap.set('n', '<Esc>', close_terminal, {
            buffer = state.floating.buf,
            noremap = true,
            silent = true,
        })
  end

  vim.cmd("startinsert")
end

local function toggle_terminal()
  if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
    close_terminal()
  else
    open_terminal()
  end
end

vim.keymap.set('t', "<esc>", "<c-\\><c-n>")
vim.keymap.set('n', '<leader>t', toggle_terminal)
