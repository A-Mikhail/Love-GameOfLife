Menu = Object:extend()

function Menu:new()
    -- Set our background color 
    -- of the room to the white    
    love.graphics.setBackgroundColor(1,1,1)
end

function Menu:update()
    local buttonWidth  = screenWidth / 4
    local buttonHeight = screenHeight / 14
    
    -- Reset or define start point
    suit.layout:reset((screenWidth / 2) - (buttonWidth / 2), screenHeight / 2.5)

    -- Put extra pixels between cells in y direction
    suit.layout:padding(0, 20)  

    if suit.Button("Start", suit.layout:row(buttonWidth, buttonHeight)).hit then
        gotoRoom("Game")
    end

    if suit.Button("Quit", suit.layout:row()).hit then
        love.event.quit()
    end
end

function Menu:draw()
end

function Menu:destroy()
end
