local function setup()
  require("user.plugins.mini.ai")
  require("user.plugins.mini.cursorword")
  require("user.plugins.mini.git")
  require("user.plugins.mini.indentscope")
  require("user.plugins.mini.surround")
  -- require("user.plugins.mini.animate")
end

return {
  'echasnovski/mini.nvim',
  version = false,
  config = setup
}
