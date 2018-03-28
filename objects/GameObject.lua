GameObject = Object:extend()

function GameObject:new(area)
    self.area = area
    self.id = Utils:UUID()
    self.timer = timer
end

function GameObject:update(dt)
    if self.timer then self.timer.update(dt) end
end

function GameObject:destroy()
    self.timer.clear()
end