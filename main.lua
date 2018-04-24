Object = require "libraries/classic/classic"
Input  = require "libraries/boipushy/input"

require "objects/rooms/Menu"

function love.load()
    -- global room variable
    current_room = nil
    
    input = Input()

    input:bind("f1", function()
        gotoRoom("Menu")
        print("The Menu room created!")  
    end)

    input:bind("escape", function()
        love.event.quit()    
    end)
end

function love.update(dt)
    if current_room then 
        current_room:update(dt) 
    end
end

function love.draw()
    if current_room then 
        current_room:draw() 
    end
end

function gotoRoom(room_type, ...)
    current_room = _G[room_type](...)

    if current_room and current_room.destroy then 
        current_room:destroy() 
    end
end
