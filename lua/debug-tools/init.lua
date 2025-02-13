local M = {}


M.hello = function ()
  print("Hello from debug tools")
end


M.logger = {
  --- @param log_file_path string
  --- @return nil
  _setup = function (self, log_file_path)
    self._log_file_path = log_file_path

    if not self._log_file_path then
      local standard_log_path = vim.fn.stdpath("log")

      if type(standard_log_path) == "table" then
        standard_log_path = standard_log_path[0]
      end

      self._log_file_path = vim.fs.joinpath(standard_log_path, "debug-tools.log")
    end

    self._log_file = io.open(self._log_file_path, "a")
  end,


  --- @param level "INFO"|"WARN"|"ERROR"
  --- @param msg string
  _log = function (self, level, msg)
    self._log_file:write(os.date("[%Y-%m-%d %H:%M:%S] [") .. level .. "] " .. msg .. "\n")
    self._log_file:flush()
  end,


  --- @param msg string
  --- @return nil
  info = function (self, msg)
    -- self:_log("II", msg)
    self._log(self, "INFO", msg)
  end
}


M.setup = function (opts)
  opts = opts or {}

  M.logger:_setup(opts.log_file_path)
end


M.cleanup = function ()
  -- if M._log_file then
  --   M._log_file:close()
  -- end
end


vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function ()
    M.cleanup()
  end
})


return M
