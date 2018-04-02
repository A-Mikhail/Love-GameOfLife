Grid = Object:extend()

function Grid:new()   
    grid = {}

    self.cellSize = cellSize
    self.screenX  = screenX
    self.screenY  = screenY

    for x = 0, self.screenX, self.cellSize do
        grid[x] = {}
        for y = 0, self.screenY, self.cellSize do
            grid[x][y] = love.math.random(0, 1)
        end
    end
end

function Grid:destroy()
    grid = nil
end