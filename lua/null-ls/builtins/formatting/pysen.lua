local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
    name = "pysen",
    meta = {
        url = "https://github.com/pfnet/pysen",
        description = "Python linting made easy.",
    },
    method = FORMATTING,
    filetypes = { "python" },
    generator_opts = {
        command = "pysen",
        args = {
            "run_files",
            "format",
            "$FILENAME",
        },
        to_stdin = false,
        cwd = h.cache.by_bufnr(function(params)
            return u.root_pattern(
                "pysen.toml",
                "pyproject.toml",
                "setup.cfg"
            )(params.bufname)
        end),
    },
    factory = h.formatter_factory,
})
