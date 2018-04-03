About = Object:extend()

function About:new()
    self.area = Area(self)

    mediumFont  = love.graphics.newFont("font/GothamBook.ttf", 14)
    largeFont   = love.graphics.newFont("font/GothamBook.ttf", 24)

    mediumFont:setFilter("nearest", "nearest")
    largeFont:setFilter("nearest", "nearest")

    -- bind 'esc' button to change the room
    Input():bind("escape", function() gotoRoom("Menu") end)
end

function About:update(dt)
    local blockWidth = screenX - 100
    local blockHeight = screenY / 8

    Suit.layout:reset((screenX / 2) - blockWidth / 2, 0)

    Suit.Label("About", {font = largeFont}, Suit.layout:row(blockWidth, blockHeight))
    Suit.Label("The framework 'LÖVE' was my aspiration to write the 'game' you see now. Unfortunately, some of the ideas weren't implemented in the game, mostly because of my lack of experience with the Lua and framework of course. Still, the game even with bugs and glitch is finished; which I think is great!", {font = mediumFont, align = "left"}, Suit.layout:row())
    Suit.Label("The framework experience I have was written in my web-page: https://mikhailadamenko.design in a form of tutorials, fill free to read and gave comments!", {font = mediumFont, align = "left"}, Suit.layout:row())

    Suit.Label("License", {font = largeFont}, Suit.layout:row())
    Suit.Label("The code of the following program: https://github.com/A-Mikhail/Love-GameOfLife you may use as you want, feel free to change, delete, and do what you want with it.", {font = mediumFont, align = "left"}, Suit.layout:row())

    Suit.Label("Info", {font = largeFont}, Suit.layout:row())
    Suit.Label("Mikhail Adamenko, 2018, mikhail.adamenko@protonmail.com", {font = mediumFont, align = "center"}, Suit.layout:row())

    if Suit.Button("Back to menu", {font = mediumFont}, Suit.layout:row(200, 40)).hit then
        gotoRoom("Menu")
    end
end

function About:draw()
    love.graphics.setBackgroundColor(1, 1, 1)
end

function About:resize()
    -- do nothing
end

function About:destroy()
    self.area:destroy()
end