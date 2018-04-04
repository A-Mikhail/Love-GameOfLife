require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area)
    Cell.super.new(self, area)

    -- create temp grid
    local tempGrid = {}

    self.area = area
    self.count = 0
    self.grid = grid
    self.tempGrid = tempGrid
    self.cellSize = cellSize
    self.tick = tick
    self.cellCanvas = love.graphics.newCanvas(screenX, screenY)

    Timer.every(self.tick, function() 
        self:evolve()
    end)
    
    -- draw initial generation
    self:drawCell()
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()  
    love.graphics.setColor(1, 1, 1, 1)
    
    love.graphics.setBlendMode('alpha', 'premultiplied')
    love.graphics.draw(self.cellCanvas)
    love.graphics.setBlendMode('alpha')
end

function Cell:destroy()
    self.grid = {}
    self.tempGrid = {}
    
    Cell.super.destroy(self)
end

function Cell:drawCell()
    self.cellCanvas:renderTo(function()
        -- go through each cell
        for x = 0, screenX, self.cellSize do
            for y = 0, screenY, self.cellSize do
                -- cell is alive 
                if self.grid[x][y] == 1 then  
                    love.graphics.setColor(0.4, 1, 0.741)
                    love.graphics.rectangle("fill", x, y, self.cellSize, self.cellSize)
                else
                    -- cell is dead
                    love.graphics.setColor(1, 1, 1)
                    love.graphics.rectangle("fill", x, y, self.cellSize, self.cellSize)
                end
            end
        end
    end)
end

function Cell:countNeighbors(x, y)  
    -- count live neighbors of the cell (x,y)
    if self.tempGrid[x][y] == 0 then 
        self.count = 0
    else
        self.count = -1
    end

    -- check neighbours of the cell by going through
    -- borders of the cell
    for dx = -self.cellSize, self.cellSize, self.cellSize do 
        for dy = -self.cellSize, self.cellSize, self.cellSize do

            local i = x + dx
            local j = y + dy
               
            -- if neighbour cell is alive then count it
            if i >= 0 and i < screenX 
            and j >= 0 and j < screenY 
            and self.tempGrid[i][j] == 1 then
                self.count = self.count + 1
            end            
        end 
    end
    
    return self.count
end

function Cell:evolve()
    -- make temporary array
    for x = 0, screenX, self.cellSize do
        self.tempGrid[x] = {}
        for y = 0, screenY, self.cellSize do
            self.tempGrid[x][y] = self.grid[x][y]
        end
    end

    -- go through the universe
    for x = 0, screenX, self.cellSize do
        for y = 0, screenY, self.cellSize do
            neighbors = self:countNeighbors(x, y)
            
            if neighbors < 2 or neighbors > 3 then
                self.grid[x][y] = 0
            end

            if neighbors == 3 then
                self.grid[x][y] = 1
            end
        end
    end

    -- apply changes
    self:drawCell()
end