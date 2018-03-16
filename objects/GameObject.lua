GameObject = Object:extend()

function GameObject:new(area, x, y, opts)
    local opts = opts or {}
    if opts then 
        for k, v in pairs(opts) do 
            self[k] = v 
        end
    end
    
    self.area = area
    self.x = x 
    self.y = y
    self.id = Utils:UUID()
    self.dead = false
    self.timer = Timer()
end

function GameObject:update(dt)
    if self.timer then self.timer:update(dt) end
    
    if self.x > love.graphics.getWidth() then self.x = self.x % love.graphics.getWidth() end
    if self.x < 0 then self.x = love.graphics.getWidth() end

    if self.y > love.graphics.getHeight() then self.y = self.y % love.graphics.getHeight() end
    if self.y < 0 then self.y = love.graphics.getHeight() end
end

function GameObject:draw()
end