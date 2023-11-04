local git = require("user.git")
-- local java = require('user.java')

-- local version = java.findJavaVersion()

if not git.isGitDirectory() then
    return
end

git.navigateToGitRoot()

local home = os.getenv("HOME")


local dataFolder = home .. "/.local/share/nvim"

require('jdtls').start_or_attach{
  cmd = {
    "bash",
    home .. '/.config/nvim/scripts/java-lsp.bash',
    dataFolder,
    "java"
  },

  settings = {
    java = {
      configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/Users/simon/.config/nvim/jdk/jdk-17.0.2.jdk/Contents/Home/",
          },
          {
            name = "JavaSE-18",
            path = "/Users/simon/.config/nvim/jdk/jdk-18.jdk/Contents/Home/",
          },
          -- {
          --   name = "JavaSE-21",
          --   path = "/Users/simon/.config/nvim/jdk/jdk-21.jdk/Contents/Home/",
          -- },
        }
      }
    }
  }
}

