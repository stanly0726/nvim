---@class map_rhs
---@field cmd string
---@field opts table
---@field opts.remap boolean
---@field opts.silent boolean
---@field opts.expr boolean
---@field opts.nowait boolean
---@field opts.callback function
---@field opts.desc string
---@field opts.buffer boolean|number
local rhs_options = {}

---@return map_rhs
function rhs_options:new()
  local instance = {
    cmd = '',
    opts = {
      buffer = false,
      silent = false,
      expr = false,
      callback = nil,
    },
  }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

---@param cmd_string string
---@return map_rhs
function rhs_options:map_raw(cmd_string)
  self.cmd = cmd_string
  return self
end

---@param cmd_string string
---@return map_rhs
function rhs_options:map_cmd(cmd_string)
  self.cmd = (':%s<CR>'):format(cmd_string)
  return self
end

---@param cmd_string string
---@return map_rhs
function rhs_options:map_cmd_with_arg(cmd_string)
  self.cmd = (':%s<Space>'):format(cmd_string)
  return self
end

---@param cmd_string string
---@return map_rhs
function rhs_options:map_cmd_norange(cmd_string)
  self.cmd = (':<C-u>%s<CR>'):format(cmd_string)
  return self
end

---@param callback fun():nil
---@return map_rhs
function rhs_options:map_lua(callback)
  self.cmd = ''
  self.opts.callback = callback
  return self
end

---@return map_rhs
function rhs_options:with_silent()
  self.opts.silent = true
  return self
end

---@param desc_string string
---@return map_rhs
function rhs_options:with_desc(desc_string)
  self.opts.desc = desc_string
  return self
end

---@return map_rhs
function rhs_options:with_remap()
  self.opts.remap = true
  return self
end

---@return map_rhs
function rhs_options:with_expr()
  self.opts.expr = true
  return self
end

---@return map_rhs
function rhs_options:with_nowait()
  self.opts.nowait = true
  return self
end

---@param num number
---@return map_rhs
function rhs_options:with_buffer(num)
  self.opts.buffer = num
  return self
end

local bind = {}

---@param cmd_string string
---@return map_rhs
function bind.map_raw(cmd_string)
  local ro = rhs_options:new()
  return ro:map_raw(cmd_string)
end

---@param cmd_string string
---@return map_rhs
function bind.map_cmd(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd(cmd_string)
end

---@param cmd_string string
---@return map_rhs
function bind.map_cmd_norange(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd_norange(cmd_string)
end

---@param cmd_string string
---@return map_rhs
function bind.map_cmd_with_arg(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd_with_arg(cmd_string)
end

---@param callback fun():nil
---@return map_rhs
function bind.map_lua(callback)
  local ro = rhs_options:new()
  return ro:map_lua(callback)
end

---@param cmd_string string
---@return string escaped_string
function bind.escape_termcode(cmd_string)
  return vim.api.nvim_replace_termcodes(cmd_string, true, true, true)
end

---@param mapping table<string, map_rhs>
function bind.load_mapping(mapping)
  for key, value in pairs(mapping) do
    local modes, lhs = key:match('([^|]*)|?(.*)')
    if type(value) ~= 'table' then
      vim.notify(
        ('keymap: expected map_rhs table for key %q, got %s'):format(key, type(value)),
        vim.log.levels.ERROR
      )
    elseif not lhs or lhs == '' then
      vim.notify(
        ('keymap: missing lhs in format %q — expected "mode|lhs"'):format(key),
        vim.log.levels.ERROR
      )
    else
      local rhs = value.cmd
      local opts = value.opts

      -- create mapping for each mode
      for mode in modes:gmatch('.') do
        vim.keymap.set(mode, lhs, rhs, opts)
      end
    end
  end
end

return bind
