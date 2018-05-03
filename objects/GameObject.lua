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
    self.id = self.UUID()
end

function GameObject:update(dt)

    if self.x > love.graphics.getWidth() then 
        self.x = self.x % love.graphics.getWidth() 
    end
    if self.x < 0 then 
        self.x = love.graphics.getWidth() 
    end

    if self.y > love.graphics.getHeight() then 
        self.y = self.y % love.graphics.getHeight() 
    end
    if self.y < 0 then 
        self.y = love.graphics.getHeight() 
    end
end

function GameObject:draw()
    -- Print generated ids at top of the circles:    
    -- love.graphics.setColor(0, 0, 0)
    -- love.graphics.print("ID: "..tostring(self.id), self.x - self.x/2, self.y - 40)
end

function GameObject:destroy()
end

function GameObject.UUID()
    local fn = function(x)
        math.randomseed(love.timer.getTime())

        local r = math.random(16) - 1
        r = (x == "x") and (r + 1) or (r % 4) + 9
        return ("0123456789abcdef"):sub(r, r)
    end

    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end
