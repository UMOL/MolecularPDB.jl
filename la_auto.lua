local la = require("module_la_shortcut")
local M = la.create_target()
M.LA_SETUP = {SHOW_HEADER = false}

function M:t()
    la.chdir("test")
    return la.shell("julia",
        "--color=yes",
        la.path("runtests.jl"))
end

return M