Menu = Object:extend()

function Menu:new()
    self.area = Area(self)

    -- make background invisible
    suit.theme.color.normal     = {fg = {0, 0, 0}, bg = {0,0,0,0}}
    suit.theme.color.hovered    = {fg = {0, 0, 0}, bg = {0,0,0,0}}
    suit.theme.color.active     = {fg = {150,155,155}, bg = {0,0,0,0}}
end

function Menu:update(dt)
    local buttonWidth = screenX / 4
    local buttonHeight = screenY / 14

    suit.layout:reset((screenX / 2) - (buttonWidth / 2), 
                        screenY / 2.5 - (buttonHeight / 2))

    -- put 10 extra pixels between cells in each direction
    suit.layout:padding(10, 10)              

    suit.Label("Conway's Game of Life", suit.layout:row(buttonWidth, buttonHeight))

    if suit.Button("Start Game", suit.layout:row()).hit then
        gotoRoom("Game")
    end

    if suit.Button("Exit Game", suit.layout:row()).hit then
        love.event.quit()
    end
end

function Menu:draw()
    -- draw the gui
    suit.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
end

function Menu:resize()
    -- do nothing
end

function Menu:destroy()
    self.area:destroy()
    self.area = nil
end

function love.keypressed(key)
    suit.keypressed(key)
end