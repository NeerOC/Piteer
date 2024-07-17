local utils = {}

function utils.distance_to(target)
    local player_pos = get_player_position()
    local target_pos

    if target.get_position then
        target_pos = target:get_position()
    elseif target.x then
        target_pos = target
    end

    return player_pos:dist_to(target_pos)
end

---@param identifier string|number string or number of the aura to check for
---@param count? number stacks of the buff to require (optional)
function utils.player_has_aura(identifier, count)
    local buffs = get_local_player():get_buffs()
    local found = 0

    for _, buff in pairs(buffs) do
        if (type(identifier) == "string" and buff:name() == identifier) or
            (type(identifier) == "number" and buff.name_hash == identifier) then
            found = found + 1
            if not count or found >= count then
                return true
            end
        end
    end

    return false
end

---Returns wether the player is on the quest provided or not
---@param quest_id integer
---@return boolean
function utils.player_on_quest(quest_id)
    local quests = get_quests()
    for _, quest in pairs(quests) do
        if quest:get_id() == quest_id then
            return true
        end
    end

    return false
end

---Returns wether the player is in the zone name specified
---@param zname string
function utils.player_in_zone(zname)
    return get_current_world():get_current_zone_name() == zname
end

return utils
