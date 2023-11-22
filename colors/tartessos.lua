for k in pairs(package.loaded) do
    if k:match(".*tartessos.*") then package.loaded[k] = nil end
end

require('tartessos').setup()
require('tartessos').colorscheme()
