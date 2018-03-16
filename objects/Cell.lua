require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area, x, y, opts)
    Cell.super.new(self, area, x, y, opts)

    -- 8 px 
    cellSize = 8

    self.h = cellSize 
    self.w = cellSize
end

function Cell:update(dt)
    Cell.super.update(self, dt)

    local speed = 8

    if input:down('left') then self.x = self.x - cellSize * dt * speed end
    if input:down('right') then self.x = self.x + cellSize * dt * speed end 
    if input:down('up') then self.y = self.y - cellSize * dt * speed end
    if input:down('down') then self.y = self.y + cellSize * dt * speed end
end

function Cell:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.h, self.w)
end