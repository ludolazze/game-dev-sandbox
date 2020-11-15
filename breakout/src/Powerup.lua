

POWERUP_TYPES =
{
    ['more-balls'] = 9
}

Powerup = Class{}

function Powerup:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16

    self.dy = 1
    self.type = POWERUP_TYPES['more-balls']
end

function Powerup:update(dt)
    self.y = self.y + self.dy
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], 
            gFrames['powerups'][POWERUP_TYPES['more-balls']],
            self.x, self.y)
end

function Powerup:activate(paddle, balls)

    if self.type == POWERUP_TYPES['more-balls'] then
        local ball = Ball(math.random(7))
        ball.x = paddle.x + (paddle.width / 2) - (ball.width / 2)
        ball.y = paddle.y - ball.height
        ball.dx = math.random(-200, 200)
        ball.dy = math.random(-50, -60)
        table.insert(balls, ball)

    end
end
