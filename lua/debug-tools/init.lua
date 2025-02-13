local M = {}


M.hello = function ()
  print("Hello from debug tools")
end


M.setup = function (opts)
  opts = opts or {}
  print("Nvim debug tools setup complete with options: ", vim.inspect(opts))
end


return M
