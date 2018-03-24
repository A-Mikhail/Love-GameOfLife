GameObject = Object:extend()

function GameObject:new(area, x, y)
    self.area = area
    self.x = x
    self.y = y
    self.id = Utils:UUID()
    self.dead = false
    self.timer = timer
end

function GameObject:update(dt)
    if self.timer then self.timer.update(dt) end
end

function GameObject:draw()
end

function GameObject:destroy()
    self.timer = {}
end