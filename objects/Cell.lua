require 'objects/GameObject'

Cell = GameObject:extend()

function Cell:new(area)
    Cell.super.new(self, area) -- create object

    self.grid = grid -- point to the grid
    -- from global grid
    self.h = cellSize -- size of 1 cell - height
    self.w = cellSize -- soze of the cell - width
    
    self.cellCanvas = love.graphics.newCanvas() -- create canvas
    
    self.generation = 0 -- generation counter
    self.count = 0

    -- evolve every 1 second
    timer.every(0.3, function() 
        self.generation = self.generation + 1 -- each call +1 to gen. 
        self:evolve(self.generation) -- make evolution
    end)

    -- -- blinker
    -- self.grid[8][8] = 1
    -- self.grid[12][8] = 1
    -- self.grid[16][8] = 1

    -- draw initial generation (0)
    self:drawCell()
end

function Cell:update(dt)
    Cell.super.update(self, dt)
end

function Cell:draw()    
    love.graphics.setBlendMode("alpha", "premultiplied")
        love.graphics.draw(self.cellCanvas)
    love.graphics.setBlendMode('alpha')
end

function Cell:drawCell()
    love.graphics.setCanvas(self.cellCanvas)

    -- go through each cell
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            -- if cell is alive 
            if self.grid[x][y] == 1 then
                -- set color to blue   
                love.graphics.setColor(173,	216, 230)
                -- draw rectangle
                love.graphics.rectangle("fill", x, y, self.w, self.h)
            else
                -- if cell is dead
                -- set color to white
                love.graphics.setColor(255, 255, 255)
                -- draw
                love.graphics.rectangle("fill", x, y, self.w, self.h)
            end
        end
    end

    love.graphics.setCanvas()
end

function Cell:destroy()
    Cell.super.destroy(self)
end

function Cell:countNeighbors(x, y)  
    -- count live neighbors of the cell (x,y)
    if self.grid2[x][y] == 0 then 
        self.count = 0
    else
        self.count = -1
    end

        -- check neighbours of the cell by going through
    -- borders of the cell, excluding itself
    for dx = -cellSize, cellSize, cellSize do 
        for dy = -cellSize, cellSize, cellSize do

            -- if neigbor cells is equal to zero
            -- then its our original cell
            -- exclude it

        
                local i = (x + dx) % screenX -- make 'x' universe unbounded
                local j = (y + dy) % screenY -- make 'y' universe unbounded
                
                -- if neighbour cell is alive then count it
                if self.grid2[i][j] == 1 then
                    self.count = self.count + 1
                end
           
            
        end 
    end
    
    -- return number of the live neighbors
    return self.count
end

function Cell:evolve(generation)
    -- evolve whole universe
    grid2 = {}

    self.grid2 = grid2

    for x = 0, screenX, cellSize do
        self.grid2[x] = {}
        for y = 0, screenY, cellSize do
            self.grid2[x][y] = self.grid[x][y]
        end
    end
    -- go through the universe
    for x = 0, screenX, cellSize do
        for y = 0, screenY, cellSize do
            
            -- send cell to count its neighbors cell
            neighbors = self:countNeighbors(x, y)
     

                if neighbors < 2 or neighbors > 3 then
                    -- else its alive and neighbors
                    -- is not 3 or 2 then the cell
                    -- will die
                    self.grid[x][y] = 0
                end

                -- and neighbors of the cell is 3
                if neighbors == 3 then
                    -- make cell alive
                    self.grid[x][y] = 1
                end
  

        end
    end

    -- apply changes
    self:drawCell()
end