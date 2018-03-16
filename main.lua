Object  = require 'libraries/classic/classic'
Timer   = require 'libraries/hump/timer'
Input   = require 'libraries/boipushy/input'
suit    = require 'libraries/suit'

function love.load()
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)

    -- begin the game with a menu room
    current_room = Menu()

    input = Input()
    
    input:bind('left', 'left')
    input:bind('right', 'right')
    input:bind('up', 'up')
    input:bind('down', 'down')
end

function love.update(dt)
    if current_room then current_room:update(dt) end
end

function love.draw()
    if current_room then current_room:draw() end
end

function addRoom(room_type, room_name, ...)
    local room = _G[room_type](room_name, ...)
    rooms[room_name] = room
    return room
end

function gotoRoom(room_type, room_name, ...)
    if current_room and rooms[room_name] then 
        if current_room.deactivate then current_room:deactivate() end
        current_room = rooms[room_name]
        if current_room.activate then current_room:activate() end
    else current_room = addRoom(room_type, room_name, ...) end
end

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item

        if love.filesystem.isFile(file) then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end

function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end