require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area, pos, table, opts)
    Cell.super.new(self, area, pos, table, opts)

    -- 8 px 
    cellSize = 8

    self.position = pos 
    self.grid = table
    self.h = cellSize
    self.w = cellSize

    input:bind('f4', function() self:die() end)
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()
    print(self.position)
    love.graphics.setColor(222, 0, 122)
    love.graphics.rectangle("fill", self.grid[self.position][2], self.grid[self.position][3], self.h, self.w)
end

function Cell:die()
    self.dead = true

    for i = 1, love.math.random(8, 12) do
        self.area:addGameObject("DieParticle", self.x, self.y)
    end
end

function Cell:destroy()
    Cell.super.destroy(self)
end