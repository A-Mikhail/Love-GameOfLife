require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area, pos, table, opts)
    Cell.super.new(self, area, pos, table, opts)

    self.position = pos 
    self.grid = table
    self.h = cellSize
    self.w = cellSize

    input:bind('f4', function() self:die() end)

    timer:every(2, function() self.h = self.h / 2 
        self.w = self.w / 2 
        timer:after(1, function() self.h = self.h * 2 self.w = self.w * 2 end) 
    end)
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()
    love.graphics.setColor(222, 0, 122)
    love.graphics.rectangle("fill", self.grid[self.position][2], self.grid[self.position][3], self.h, self.w)    
end

function Cell:die()
    self.dead = true
end

function Cell:destroy()
    Cell.super.destroy(self)
end