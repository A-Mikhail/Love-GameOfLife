Object = require "libraries/classic/classic"

require "objects/Text"

function love.load()
    -- call object into the main file    
    sentence = Text()
    
    -- print greeting to a terminal
    -- sentence:sayHello("Mikhail")
    -- sentence:sayHello("Josh")
end

function love.update(dt)
end

function love.draw()
    love.graphics.setColor(1,1,1)
    
    -- print greeting to the screen
    love.graphics.print(sentence:sayHello("Mikhail"), 10, 10)
    love.graphics.print(sentence:sayHello("Josh"), 10, 30)
end
