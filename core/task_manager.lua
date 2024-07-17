local task_manager = {}
local tasks = {}
local current_task = nil

function task_manager.register_task(task)
    table.insert(tasks, task)
end

function task_manager.execute_tasks()
    for _, task in ipairs(tasks) do
        if task.shouldExecute() then
            current_task = task
            task.Execute()
            break -- Execute only one task per pulse
        end
    end
    if not current_task then
        current_task = { name = "Idle" } -- Default state when no task is active
    end
end

function task_manager.get_current_task()
    return current_task or { name = "Idle" }
end

-- Load all tasks
local task_files = { "open_pit", "town_salvage" }
for _, file in ipairs(task_files) do
    local task = require("tasks." .. file)
    task_manager.register_task(task)
end

return task_manager
