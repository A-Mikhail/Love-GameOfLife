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

    if input:down('left') then print('left') self.x = self.x - cellSize end
    if input:down('right') then self.x = self.x + cellSize end 
    if input:down('up') then self.y = self.y + cellSize end
    if input:down('bottom') then self.y = self.y - cellSize end
end

function Cell:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.h, self.w)
end