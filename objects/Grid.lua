Grid = Object:extend()

function Grid:new()
    -- size in width and height of one cell
    cellSize = 4
    
    grid = {}

    for x = 0, screenX, cellSize do
        grid[x] = {}
        for y = 0, screenY, cellSize do
            grid[x][y] = love.math.random(0, 1)
        end
    end
end

function Grid:resize()
    -- self:new()
    -- print("grid is resized")
end

function Grid:destroy()
    grid = nil
end