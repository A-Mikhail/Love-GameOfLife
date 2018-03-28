Game = Object:extend()

function Game:new()
    self.area = Area(self)
    self.grid = Grid()

    self.main_canvas = love.graphics.newCanvas()

    self.area:addGameObject("Cell") 

    -- bind 'esc' button to change the room
    input:bind("escape", function() gotoRoom("Menu") end)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    love.graphics.setColor(255, 255, 255, 255)

    love.graphics.setCanvas(self.main_canvas)
        self.area:draw()
    love.graphics.setCanvas()

    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.main_canvas, 0, 0, 0)
    love.graphics.setBlendMode('alpha')

    -- Show FPS
    -- love.graphics.setColor(0,0,0)
    -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()), 10, 10)
end

function Game:resize()
    -- self.grid:resize()
    -- self.area:resize()
end

function Game:destroy()
    self.area:destroy()
    self.grid:destroy()
end