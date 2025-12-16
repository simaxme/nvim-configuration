vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(information)
    local bufnr = information.buf
    local filetype = vim.fn.getbufvar(bufnr, "&filetype")

    if filetype == "java" or filetype == "typescript" or filetype == "html" or filetype == "css" or filetype == "scss" or filetype == "htmlangular" then
      local root_folder = vim.fs.root(bufnr, ".prettierrc")

      if root_folder == nil then return end

      local buffer_path = vim.api.nvim_buf_get_name(0)

      local binary = root_folder .. "/node_modules/.bin/prettier"

      if vim.fn.filereadable(binary) == 0 then
        vim.notify("Prettier binary not readbable/found!")
        return
      end

      local output = vim.system({ binary, buffer_path, "--check" }, {
        text = true,
        cwd = root_folder
      }):wait()

      if output.code == 1 then
        vim.system({ binary, buffer_path, "--write" }, {
          text = true,
          cwd = root_folder
        }):wait()
        vim.cmd("checktime")
      end
    end
  end
})
