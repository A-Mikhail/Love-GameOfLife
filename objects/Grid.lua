Grid = Object:extend()

function Grid:new()
    local screenX = love.graphics.getWidth()
    local screenY = love.graphics.getHeight()

    -- generate the grid
    grid = {}

    self.grid = grid

    local cellNum = 0
    cellSize = 8
        
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            cellNum = cellNum + 1
            table.insert(grid, {cellNum, x, y})
        end
    end
end

function Grid:update()
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
end

function Grid:draw()
end

function Grid:destroy()
    self.grid = {}
end