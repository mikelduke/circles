updateFreq = 0
updateDiff = 0
circles = {}
max = 500

function love.load() end

function love.update(dt)
    if love.keyboard.isDown('escape') then love.event.push('quit') end

    if (#circles > max) then
        for k, v in pairs(circles) do circles[k] = nil end
    end

    updateDiff = updateDiff + dt
    if (updateDiff > updateFreq) then
        updateDiff = 0
        addCircle()
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    for i, s in ipairs(circles) do love.graphics.draw(s.image, s.x, s.y) end
end

function addCircle()
    local circle = {
        image = getShape(love.math.random(1, 300), {
            r = love.math.random(),
            g = love.math.random(),
            b = love.math.random()
        }),
        x = love.math.random(0, love.graphics.getWidth()),
        y = love.math.random(0, love.graphics.getHeight())
    }
    table.insert(circles, circle)
end

function getShape(size, color)
    local shape = love.graphics.newCanvas(size, size)
    love.graphics.setCanvas(shape)
    love.graphics.setColor(color.r, color.g, color.b, 255)

    local mode = "fill"
    love.graphics.circle(mode, size / 2, size / 2, size / 2)

    love.graphics.setCanvas()
    return shape
end
