local M = {}


function M.init()
    local loader = require("user.plugins.loader")
    loader.init()
    loader.load(require("user.plugins.packages"))
end


return M