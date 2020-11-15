


POWERUP_MORE_BALLS = 9
POWERUP_LARGER_PADDLE = 2
POWERUP_SMALLER_PADDLE = 1
POWERUP_LASER_BALL = 7

POWERUP_TYPES =
{
    POWERUP_MORE_BALLS,
    POWERUP_LARGER_PADDLE,
    POWERUP_SMALLER_PADDLE,
    POWERUP_LASER_BALL
}

Powerup = Class{}

function Powerup:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16

    self.dy = 1
    self.type = POWERUP_MORE_BALLS
end

function Powerup:update(dt)
    self.y = self.y + self.dy
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], 
            gFrames['powerups'][self.type],
            self.x, self.y)
end

function Powerup:activate(paddle, balls)

    if self.type == POWERUP_MORE_BALLS then
        for i = 0, 1 do
            local ball = Ball(math.random(7))
            ball.x = paddle.x + (paddle.width / 2) - (ball.width / 2)
            ball.y = paddle.y - ball.height
            ball.dx = math.random(-200, 200)
            ball.dy = math.random(-50, -60)
            table.insert(balls, ball)
        end
    elseif self.type == POWERUP_LARGER_PADDLE then
        paddle:makeBigger()
    elseif self.type == POWERUP_SMALLER_PADDLE then 
        paddle:makeSmaller()
    elseif self.type == POWERUP_LASER_BALL then
        local ball = Ball(math.random(7))
        ball.x = paddle.x + (paddle.width / 2) - (ball.width / 2)
        ball.y = paddle.y - ball.height
        ball.dx = math.random(-200, 200)
        ball.dy = math.random(-50, -60)
        ball.laser = true
        table.insert(balls, ball)
    end
end
