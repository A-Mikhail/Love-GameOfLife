Rules = Object:extend()

function Rules:new()
    local top       = { ["y"] = self.y - self.h, ["x"] = self.x }
    local bottom    = { ["y"] = self.y + self.h, ["x"] = self.x }
    local left      = { ["x"] = self.x - self.w, ["y"] = self.y }
    local right     = { ["x"] = self.x + self.w, ["y"] = self.y }
    
    local topLeft       = { ["x"] = self.x - self.h, ["y"] = self.y - self.h } 
    local bottomLeft    = { ["x"] = self.x - self.h, ["y"] = self.y + self.h }
    local topRight      = { ["x"] = self.x + self.h, ["y"] = self.y - self.h }
    local bottomRight   = { ["x"] = self.x + self.h, ["y"] = self.y + self.h }

    local neighbours = { top, bottom, left, right, 
                        topLeft, bottomLeft, topRight, bottomRight }
    sum = 0

    for k, v in _.cycle(self.grid) do    
        for i = 1, #neighbours do
            if v.x == neighbours[i].x
                and v.y == neighbours[i].y 
                and v.live == true then
                    sum = sum + 1
            end
        end

        -- kill the cell if the sum of the neighbours is 0 or 1
        if sum <= 1 then
            self.dead = true
            print("dead")
        end

        print(sum)
    end
end

function Rules:update(dt)
end

function Rules:destroy()
    self:destroy(self)
end