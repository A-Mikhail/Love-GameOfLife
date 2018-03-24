require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area)
    Cell.super.new(self, area)

    self.grid = grid
    
    -- from global grid
    self.h = cellSize
    self.w = cellSize

    self.cellCanvas = love.graphics.newCanvas()
    
    timer.every(1, function() self:evolve() end)

    love.graphics.setCanvas(self.cellCanvas)
    love.graphics.clear()
    love.graphics.setBlendMode("alpha")
    self:drawCell()
    love.graphics.setCanvas()
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()
    love.graphics.setColor(255, 255, 255, 255)
    
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.cellCanvas)
    love.graphics.setBlendMode('alpha')
end

function Cell:drawCell()
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            if self.grid[x][y] == 1 then
                love.graphics.setColor(180, 0, 0)
                love.graphics.rectangle("fill", x, y, self.w, self.h)
            else
                love.graphics.setColor(255, 255, 255)
                love.graphics.rectangle("fill", x, y, self.w, self.h)
            end
        end
    end
end

function Cell:destroy()
    Cell.super.destroy(self)
end

function Cell:countNeighbors(row, column)  
    count = 0

    for x = -cellSize, cellSize, cellSize do 
        for y = -cellSize, cellSize, cellSize do
            
            i = row + x
            j = column + y

            if i >= 0 and i < screenX 
                and j >= 0 and j < screenY 
                and x and y ~= 0 
                and self.grid[i][j] == 1 
            then
                count = count + 1
            end
        end 
    end

    return count
end

function Cell:evolve()
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            neighbors = self:countNeighbors(x, y)
            
            if self.grid[x][y] == 1 then
                if neighbors == 2 or neighbors == 3 then 
                    self.grid[x][y] = 1
                else 
                    self.grid[x][y] = 0
                end
            else
                if neighbors == 3 then
                    self.grid[x][y] = 1
                else
                    self.grid[x][y] = 0
                end
            end
        
        end
    end

    love.graphics.setCanvas(self.cellCanvas)
    love.graphics.clear()
    love.graphics.setBlendMode("alpha")
    self:drawCell()
    love.graphics.setCanvas()
end