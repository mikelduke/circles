updateFreq = .1
updateDiff = 0
max = 500
maxDiam = love.graphics.getHeight() / 2

c = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())

function love.load() end

function love.update(dt)
    if love.keyboard.isDown('escape') then love.event.push('quit') end

    updateDiff = updateDiff + dt
    if (updateDiff > updateFreq) then
        updateDiff = 0
        c:renderTo(addCircle)
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)

    love.graphics.draw(c)
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
