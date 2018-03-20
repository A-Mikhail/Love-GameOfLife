Grid = Object:extend()

function Grid:new()
    -- generate the grid
    grid = {}

    local cellNum = 0
    -- cells by default are dead or empty
    local live = false
    cellSize = 8

    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            cellNum = cellNum + 1
            table.insert(grid, {["x"] = x, ["y"] = y, ["cellNum"] = cellNum, ["live"] = live})
        end
    end
end

function Grid:resize()
    self:new()
    print("grid is resized")
end

function Grid:destroy()
    grid = nil
end