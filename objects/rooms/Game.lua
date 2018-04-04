Game = Object:extend()

function Game:new()
    self.area = Area(self)
    self.grid = Grid()

    -- create GO. Cell
    cellGO = self.area:addGameObject("Cell") 
    
    -- bind 'esc' button to change the room
    Input():bind("escape", function() gotoRoom("Menu") end)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    love.graphics.clear({1, 1, 1})
    self.area:draw()
end

function Game:resize()
    cellGO:destroy()

    gotoRoom("Game")
end

function Game:destroy()
    self.grid:destroy()
    self.area:destroy()
end