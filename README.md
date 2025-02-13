Tools for writing and debugging neovim lua plugins


# Usage

Logs in the default log folder if the plugin is initialised with empty arguments.
To check the path do `:echo stdpath("log")`

The file in which it logs is `debug-tools.log`


```lua
local logger = require("debug-tools").logger
logger:info("some log message")
```
