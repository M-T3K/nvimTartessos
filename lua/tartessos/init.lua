local M = {}

---Change tartessos option (vim.g.tartessos_config.option)
---It can't be changed directly by modifying that field due to a Neovim lua bug with global variables (tartessos_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
    local cfg = vim.g.tartessos_config
    cfg[opt] = value
    vim.g.tartessos_config = cfg
end

---Apply the colorscheme (same as ':colorscheme tartessos')
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "tartessos"
    require('tartessos.highlights').setup()
    require('tartessos.terminal').setup()
end

local default_config = {
    -- Main options --
    transparent = false,     -- don't set background
    term_colors = true,      -- if true enable the terminal
    ending_tildes = false,    -- show the end-of-buffer tildes
    cmp_itemkind_reverse = false,    -- reverse item kind highlights in cmp menu

    -- Changing Formats --
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- center bar (c) transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Related --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl for diagnostics
        background = true,    -- use background color for virtual text
    },
}

---Setup tartessos.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if not vim.g.tartessos_config or not vim.g.tartessos_config.loaded then    -- if it's the first time setup() is called
        vim.g.tartessos_config = vim.tbl_deep_extend('keep', vim.g.tartessos_config or {}, default_config)
        M.set_options('loaded', true)
    end
    if opts then
        vim.g.tartessos_config = vim.tbl_deep_extend('force', vim.g.tartessos_config, opts)
    end
end

function M.load()
  vim.api.nvim_command('colorscheme tartessos')
end

return M
