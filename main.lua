function love.load()
    love.window.setTitle("Game of Life!")
end

dtotal = 0

function love.update(dt)
    dtotal = dtotal + dt

    if dtotal >= 1 then
        dtotal = dtotal - 1
        print("a second has passed")    
    end
end

function love.draw()
    love.graphics.print("Current FPS:"..tostring(love.timer.getFPS()), 10, 10)
end
