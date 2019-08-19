
Bird = Class{}

local GRAVITY = 20

function Bird:init()
    self.image = love.graphics.newImage('bird.png')
    self.x = VIRTUAL_WIDTH / 2 - 100
    self.y = VIRTUAL_HEIGHT / 2 - 10

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.dy = 0
end

function Bird:collides(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end

    return false
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed('space') then
        self.dy = -5
        sounds['jump']:play()
    end

    if love.mouse.isDown(1) then
        if ctrpressed == 0 then
            self.dy = -5
            sounds['jump']:getVolume(1)
            sounds['jump']:play()
        end
        ctrpressed = 1
    end

    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end

function love.mousereleased( x, y, button)
    if button == 1 then
        ctrpressed = 0
    end
end