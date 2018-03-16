Game = Object:extend()

local screenX = love.graphics.getWidth()
local screenY = love.graphics.getHeight()

function Game:new()
    self.area = Area(self)
    self.main_canvas = love.graphics.newCanvas(screenX, screenY)
    
    love.window.setTitle("Game")

    -- create the cell at the center of the screen
    self.cell = self.area:addGameObject("Cell", screenX / 2, screenY / 2)

    input:bind('f3', function() self.cell.dead = true self.cell = nil end)
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
end