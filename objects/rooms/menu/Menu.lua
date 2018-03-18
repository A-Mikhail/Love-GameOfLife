Menu = Object:extend()

function Menu:new()
    love.window.setTitle("Menu")
    love.graphics.setBackgroundColor(255, 255, 255)
end

function Menu:update(dt)
    local screenX = love.graphics.getWidth()
    local screenY = love.graphics.getHeight()
    
    local buttonWidth = screenX / 4
    local buttonHeight = screenY / 14

    suit.layout:reset((screenX / 2) - (buttonWidth / 2), 
                        screenY / 2 - (buttonHeight / 2))

    suit.layout:padding(10, 10)

    if suit.Button("Start the Life", suit.layout:row(buttonWidth, buttonHeight)).hit then
        current_room = Game()
    end

    if suit.Button("Quit the Game", suit.layout:row()).hit then
        love.event.quit()
    end
end

function Menu:draw()
    -- draw the gui
    suit.draw()
end

function love.keypressed(key)
    suit.keypressed(key)
end

function Menu:destroy()
    self.area:destroy()
    self.area = nil
end