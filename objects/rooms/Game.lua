Game = Object:extend()

function Game:new()
    self.area = Area(self)
    
    self.player = self.area:addGameObject("Player", 100, 100)
end

function Game:update(dt)
    self.area:update(dt)
end

function Game:draw()
    self.area:draw()
end

function Game:destroy() 
    self.area:destroy()
    self.area = nil
end

