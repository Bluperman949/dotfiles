local JDTLS_HOME = vim.fn.stdpath'data'..'/jdtls'
local PROJECT_PATH = vim.fs.root(0, {'.git', 'mvnw', 'gradlew'})

return {
  cmd = {
    '/usr/bin/java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx512M',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    vim.fn.glob('/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),

    '-configuration', JDTLS_HOME..'/.config',

    '-data', JDTLS_HOME..'/.workspace',
  },
  root_dir = PROJECT_PATH,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      import = { enabled = true },
      rename = { enabled = true },
    },
  },
  init_options = {
    bundles = {
      vim.fn.glob('~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1),
    },
  },
}
