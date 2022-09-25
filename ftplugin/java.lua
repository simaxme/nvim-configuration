local ssession = require('user.ssession.lib')


require('jdtls').start_or_attach{
  cmd = {
    '/home/simon/.config/nvim/scripts/java-lsp.sh',
    ssession.getCurrentCWDId()
  }
}

