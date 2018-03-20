require "objects/Cell"

Beehive = Cell:extend()

function Beehive:new(area, position, table)
    Beehive.super.new(self, area, position, table)

    self.position = position
    self.x = self.grid[self.position].x
    self.y = self.grid[self.position].y
end

function Beehive:update(dt)
    Beehive.super.update(self, dt)
end

function Beehive:destroy()
    Beehive.super.destroy(self)
end