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
    '/usr/share/java/jdtls/plugins/'
    ..'org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',

    '-configuration', JDTLS_HOME..'/.config',

    '-data', JDTLS_HOME..'/.workspace',
    -- '-data', PROJECT_PATH,
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
    bundles = {}
  },
}
