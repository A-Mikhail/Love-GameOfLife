require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area, position, table)
    Cell.super.new(self, area, position, table)

    self.position   = position 
    self.grid       = table

    -- from global grid
    self.h = cellSize
    self.w = cellSize
    self.x = self.grid[self.position].x
    self.y = self.grid[self.position].y 
    
    self.live = self.grid[self.position].live
    self.live = true

    print(self.grid)
    -- apply the rules for the new cell
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()
    if self.live then 
        love.graphics.setColor(221, 0, 0)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    else 
        self.dead = true
    end
end

function Cell:resize()
end

function Cell:destroy()
    Cell.super.destroy(self)
end