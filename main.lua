updateFreq = .1
updateDiff = 0
max = 500
maxDiam = love.graphics.getHeight() / 2
debug = false

c = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())

function love.load() end

function love.update(dt)
    updateDiff = updateDiff + dt
    if (updateDiff > updateFreq) then
        updateDiff = 0
        c:renderTo(addCircle)
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)

    love.graphics.draw(c)

    if debug then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("DT: " .. tostring(love.timer.getDelta()), 10, 10)
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 20)
        love.graphics.print("updateFreq: " .. tostring(updateFreq), 10, 30)
    end
end

function addCircle()
    local r = love.math.random()
    local g = love.math.random()
    local b = love.math.random()
    local x = love.math.random(0, love.graphics.getWidth())
    local y = love.math.random(0, love.graphics.getHeight())
    size = love.math.random(1, maxDiam)

    love.graphics.setColor(r, g, b, 1)
    love.graphics.circle("fill", x, y, size / 2)
end

function love.keypressed(key, scancode, isrepeat)
    if key == 'd' and not isrepeat then debug = not debug end

    if key == 'escape' then
        love.event.push('quit')
    elseif key == 'r' and not isrepeat then
        c = love.graphics.newCanvas(love.graphics.getWidth(),
                                    love.graphics.getHeight())
    elseif key == 'up' then
        updateFreq = updateFreq + .1
    elseif key == 'down' then
        updateFreq = updateFreq - .1
        if updateFreq < 0 then updateFreq = 0 end
    end
end
