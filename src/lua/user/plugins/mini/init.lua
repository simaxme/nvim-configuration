local function setup()
  require("user.plugins.mini.ai")
  require("user.plugins.mini.cursorword")
  require("user.plugins.mini.indentscope")
  require("user.plugins.mini.surround")
end

return {
  'nvim-mini/mini.nvim',
  version = "0.16.0",
  config = setup
}
