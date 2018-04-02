Game = Object:extend()

function Game:new()
    self.area = Area(self)
    self.grid = Grid()

    -- create GO. Cell
    self.area:addGameObject("Cell") 
    
    -- bind 'esc' button to change the room
    Input():bind("escape", function() gotoRoom("Menu") end)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    self.area:draw()
end

function Game:destroy()
    self.area:destroy()
    self.grid:destroy()
end