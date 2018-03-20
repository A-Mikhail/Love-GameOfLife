Game = Object:extend()

function Game:new()
    self.area = Area(self)
    self.grid = Grid()

    self.main_canvas = love.graphics.newCanvas(screenX, screenY)
    
    -- create 10 cells
    for i = 1, 10 do 
        self.area:addGameObject("Cell", love.math.random(1, #grid), grid)
    end

    -- create 15 gliders 
    for i = 1, 15 do
        self.area:addGameObject("Beehive", love.math.random(1, #grid), grid)
    end
    
    -- bind 'esc' button to change the room
    input:bind("escape", function() gotoRoom("Menu") end)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    love.graphics.setCanvas(self.main_canvas)
    love.graphics.clear()
        self.area:draw()
    love.graphics.setCanvas()

    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.main_canvas, 0, 0, 0)
    love.graphics.setBlendMode('alpha')
end

function Game:resize()
    -- self.grid:resize()
    -- self.area:resize()
end

function Game:destroy()
    self.area:destroy()
    self.grid:destroy()
    self.area = nil
end