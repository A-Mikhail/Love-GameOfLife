Menu = Object:extend()

function Menu:new()
    self.area = Area(self)

    mediumFont  = love.graphics.newFont("font/GothamBook.ttf", 14)
    mediumFont:setFilter("nearest", "nearest")
end

function Menu:update(dt)
    local buttonWidth = screenX / 4
    local buttonHeight = screenY / 14

    Suit.layout:reset((screenX / 2) - (buttonWidth / 2), 
                        screenY / 3)

    -- put 10 extra pixels between cells in each direction
    Suit.layout:padding(0, 20)              

    if Suit.Button("Start Life", {font = mediumFont}, Suit.layout:row(buttonWidth, buttonHeight)).hit then
        gotoRoom("Game")
    end

    if Suit.Button("About", {font = mediumFont}, Suit.layout:row()).hit then
        gotoRoom("About")
    end

    if Suit.Button("Exit Game", {font = mediumFont}, Suit.layout:row()).hit then
        love.event.quit()
    end
end

function Menu:draw()
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    Suit.draw()
end

function Menu:destroy()
    self.area:destroy()
end