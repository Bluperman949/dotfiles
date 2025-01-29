---@type function
local au = vim.api.nvim_create_autocmd
local uau = function(event, callback)
  return au('User', { pattern = event, callback = callback })
end

local function oil_callback(args)
  if args.data.err then return end
  for _,action in ipairs(args.data.actions) do
    if action.type == 'create' then
      if action.url:match'[.]java$' then
        print('CREATED JAVA FILE')
      end
    end
  end
end

local function open_callback(args)
  vim.print('JDTLS attaching :: '
           ..vim.fn.fnamemodify(args.match, ':t')
           ..' @ '..JAVA_PROJ_NAME)
  require'jdtls'.start_or_attach(require'my.jdtls-config')
end

local function try_init_project()
  local project_path = vim.fs.root(vim.env.PWD, {'mvnw', 'gradlew'})
  if not project_path then return end
  JAVA_PROJ_PATH = project_path
  JAVA_PROJ_NAME = vim.fn.fnamemodify(JAVA_PROJ_PATH, ':t')

  vim.print('JAVA PROJECT: '..JAVA_PROJ_NAME)
  -- vim.cmd('cd '..JAVA_PROJ_PATH)

  require'lazy'.load{plugins={'nvim-jdtls'}}

  au({'BufReadPost', 'BufNewFile'}, {callback = open_callback})
  uau('OilActionsPost', oil_callback)
end

uau('VeryLazy', try_init_project)
