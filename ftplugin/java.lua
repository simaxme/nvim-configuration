local ssession = require('user.ssession.lib')
-- local java = require('user.java')

-- local version = java.findJavaVersion()

require('jdtls').start_or_attach{
  cmd = {
    '/home/simon/.config/nvim/scripts/java-lsp.sh',
    ssession.getCurrentCWDId(),
    "java"
  }
}

