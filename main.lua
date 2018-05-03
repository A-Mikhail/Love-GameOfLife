Object  = require "libraries/classic/classic"
Input   = require "libraries/boipushy/input"
suit    = require "libraries/suit"

-- Individual classes
require "objects/Area"
require "objects/GameObject"

-- Rooms classes
require "objects/rooms/Menu"
require "objects/rooms/Game"

-- Game object classes
require "objects/Player"

function love.load()
    -- global room variable
    current_room = nil
    
    input = Input()
    
    screenWidth  = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    gotoRoom("Menu")
end

function love.update(dt)
    if current_room then
        current_room:update(dt) 
    end
end

function love.resize(w, h)
    screenWidth     = w
    screenHeight    = h
end

function love.draw()
    if current_room then 
        current_room:draw()
        suit:draw() 
    end
end

function love.keypressed(key)
    suit.keypressed(key)
end

function gotoRoom(room_type, ...)
    if current_room and current_room.destroy then 
        current_room:destroy() 
    end

    current_room = _G[room_type](...)    
end
