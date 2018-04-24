Menu = Object:extend()

function Menu:new()
    -- Set our background color 
    -- of the room to the white    
    love.graphics.setBackgroundColor(1,1,1)
    
    self.screenWidth     = love.graphics.getWidth()
    self.screenHeight    = love.graphics.getHeight()

    input:unbind("f1")
end

function Menu:update()
end

function Menu:draw()
    -- Set color of the circle to the blue
    -- RGB (66, 134, 244)
    love.graphics.setColor(0.258, 0.525, 0.956)
    love.graphics.circle("fill", self.screenWidth / 2, self.screenHeight / 2, 100)
end

function Menu:destroy()
end
