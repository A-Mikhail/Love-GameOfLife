Object      = require "libraries/classic/classic"
Input       = require "libraries/boipushy/input"
Timer       = require "libraries/hump/timer"
Suit        = require "libraries/suit"

function love.load()
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)
    
    -- global screenX and Y
    screenX = love.graphics.getPixelWidth()
    screenY = love.graphics.getPixelHeight()
    
    cellSize = 4
    tick = 0.3
     
    Suit.theme.color.normal     = {fg = {0.274, 0.45, 0.36}, bg = {0.4, 1, 0.741}}
    Suit.theme.color.hovered    = {fg = {1, 1, 1}, bg = {0.4, 0.658, 1}}
    Suit.theme.color.active     = {fg = {1, 1, 1}, bg = {0.27, 0.435, 0.65}}

    -- begin the game with a menu room
    rooms = {}
    current_room = nil

    gotoRoom("Menu")

    Input():bind('f1', function()
        print("Before collection: " .. collectgarbage("count") / 1024)
        collectgarbage()
        print("After collection: " .. collectgarbage("count") / 1024)
        print("Object count: ")
        local counts = type_count()
        for k, v in pairs(counts) do print (k, v) end
        print("--------------------------------------")
    end)
end

function love.update(dt)
    if current_room then 
        current_room:update(dt) 
    end
end

function love.draw()
    if current_room then 
        Suit.draw()
        current_room:draw() 
    end
end

-- redraw window on resize
function love.resize()
    screenX = love.graphics.getPixelWidth()
    screenY = love.graphics.getPixelHeight()

    if current_room then 
        current_room:resize()
    end
end

function gotoRoom(room_type, ...)
    if current_room and current_room.destroy then 
        current_room:destroy() 
    end

    current_room = _G[room_type](...)

    -- set title of the room
    love.window.setTitle("Game of life - "..room_type)
end

-------------- Require objests class -----------------------

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item

        if love.filesystem.getInfo(file, "file") then
            table.insert(file_list, file)
        elseif love.filesystem.getInfo(file, "directory") then
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

function love.keypressed(key)
    Suit.keypressed(key)
end

-- Leak detection
function count_all(f)
    local seen = {}
    local count_table

    count_table = function(t)
        if seen[t] then return end

        f(t)
        seen[t] = true

        for k, v in pairs(t) do
            if type(v) == "table" then
                count_table(v)
            elseif type(v) == "userdata" then
                    f(v)
            end
        end
    end
    count_table(_G)
end

function type_count()
    local counts = {}
    local enumerate = function (o)
        local t = type_name(o)
        counts[t] = (counts[t] or 0) + 1
    end

    count_all(enumerate)

    return counts
end

global_type_table = nil
function type_name(o)
    if global_type_table == nil then
        global_type_table = {}
            for k,v in pairs(_G) do
                global_type_table[v] = k
            end
        global_type_table[0] = "table"
    end
    return global_type_table[getmetatable(o) or 0] or "Unknown"
end