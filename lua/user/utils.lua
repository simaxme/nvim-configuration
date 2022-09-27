local utils = {}

function utils.split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end

function utils.echo(str)
    vim.cmd([[echo ']] .. str .. [[']])
end
function utils.error(str)
    vim.cmd([[echoerr ']] .. str .. [[']])
end

function utils.getCWD()
    return vim.api.nvim_eval("getcwd()")
end

function utils.fileExists(path)
    local f = io.open(path, "r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

function utils.stringStartsWith(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end
function utils.stringEndsWithWith(String, End)
    return string.sub(String, string.len(String) - string.len(End) + 1, string.len(String)) == End
end

function utils.isDir(path)
    local f = io.open(path, "r")
    local _, _, code = f:read(1)
    f:close()
    return code == 21
end

return utils
