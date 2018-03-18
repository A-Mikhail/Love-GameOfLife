Game = Object:extend()

function Game:new()
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()

    self.area = Area(self)
    self.main_canvas = love.graphics.newCanvas(screenX, screenY)
    
    love.window.setTitle("Game")

    -- generate the grid
    grid = {}

    local cellNum = 0
    cellSize = 8
    
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            cellNum = cellNum + 1
            table.insert(grid, {cellNum, x, y})
        end
    end

    -- create the cell at the center of the screen
    -- print(1, #grid, grid[2][2], grid[2][3])
    for i = 1, 10 do 
        self.area:addGameObject("Cell", love.math.random(1, #grid), grid)
    end

    -- bind 'esc' button to change the room
    input:bind("escape", function() current_room = Menu() end)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    love.graphics.setCanvas(self.main_canvas)
    love.graphics.clear()
        self.area:draw()
    love.graphics.setCanvas()

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.main_canvas, 0, 0, 0)
    love.graphics.setBlendMode('alpha')

    -- Draw grid
    for k, v in pairs(grid) do 
        love.graphics.rectangle("line", v[2], v[3], cellSize, cellSize)  
    end
end

function Game:destroy()
    self.area:destroy()
    self.area = nil
end