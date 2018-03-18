require 'objects/GameObject'

DieParticle = GameObject:extend()

default_color = {222, 222, 222}

function DieParticle:new(area, x, y, opts)
    DieParticle.super.new(self, area, x, y, opts)

    self.color = opts.color or default_color
    self.r = love.math.random(0, 2 * math.pi)
    self.s = opts.s or love.math.random(2, 20)
    self.v = opts.v or love.math.random(75, 100)
    self.line_width = 1
    self.timer:tween(20, self, {s = 0, v = 0,
    line_width = 0}, 'linear', function() self.dead = true end)
end

function DieParticle:update()
end

function pushRotate(x, y, r)
    love.graphics.push()
    love.graphics.translate(x, y)
    love.graphics.rotate(r or 0)
    love.graphics.translate(-x, -y)
end

function DieParticle:draw()
    pushRotate(self.x, self.y, self.r)
    love.graphics.setLineWidth(self.line_width)
    love.graphics.setColor(self.color)
    love.graphics.line(self.x - self.s, self.y, self.x + self.s, self.y)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setLineWidth(1)
    love.graphics.pop()
end