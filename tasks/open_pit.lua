-- tasks/open_pit.lua
local utils = require "core.utils"
local ids   = require "data.ids"

local task  = {
    name = "Open Pit Task",
    shouldExecute = function()
        return utils.player_in_zone("Scos_Cerrigar")
    end,
    Execute = function()
        -- Implement functions to interact with Pit Obelisk
    end
}

return task
