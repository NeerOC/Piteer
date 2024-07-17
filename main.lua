local gui = require("gui")
local task_manager = require("core.task_manager")

local local_player, player_position

local function update_locals()
    local_player = get_local_player()
    player_position = local_player and local_player:get_position()
end

local function main_pulse()
    if not local_player then return end
    task_manager.execute_tasks()
end

local function render_pulse()
    if not local_player then return end
    local current_task = task_manager.get_current_task()
    if current_task then
        local px, py, pz = player_position:x(), player_position:y(), player_position:z()
        local draw_pos = vec3:new(px, py - 1, pz + 3)
        graphics.text_3d(current_task.name, draw_pos, 14, color_white(255))
    end
end

on_update(function()
    update_locals()
    main_pulse()
end)
on_render_menu(gui.render)
on_render(render_pulse)
