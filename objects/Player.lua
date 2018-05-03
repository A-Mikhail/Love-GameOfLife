Player = GameObject:extend()

function Player:new(area, x, y, opts)
    Player.super.new(self, area, x, y, opts)

    self.x = x
    self.y = y

    self.speed = 50

    input:bind("w", "up")
    input:bind("a", "left")
    input:bind("s", "down")
    input:bind("d", "right")
end

function Player:update(dt)
    Player.super.update(self, dt)

    if input:down("up") then
        self.y = self.y - self.speed * dt        
    elseif input:down("left") then
        self.x = self.x - self.speed * dt
    elseif input:down("down") then 
        self.y = self.y + self.speed * dt
    elseif input:down("right") then
        self.x = self.x + self.speed * dt
    end
end

function Player:draw()
    Player.super.draw(self)

    love.graphics.setColor(0.5, 0, 0)
    love.graphics.circle("fill", self.x, self.y, 20)
end

function Player:destroy()
    Player.super.destroy(self)
end 
