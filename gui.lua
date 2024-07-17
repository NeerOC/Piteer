local gui = {}
local plugin_label = "piteer"

local function create_checkbox(key)
    return checkbox:new(false, get_hash(plugin_label .. "_" .. key))
end

gui.elements = {
    main_tree = tree_node:new(0),
    main_toggle = create_checkbox("main_toggle"),
    -- Add more GUI elements here
}

function gui.render()
    if not gui.elements.main_tree:push("Piteer") then return end

    gui.elements.main_toggle:render("Enable", "Enable the bot")
    if gui.elements.main_toggle:get() then
        -- Render additional options when enabled
    end

    gui.elements.main_tree:pop()
end

return gui
