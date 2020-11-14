--[[
    PaddleAi Class
    Author: Ludovico Lazzeretti

    Used to control motion of the paddle based on position of the ball
]]

PaddleAi = Class{}

function PaddleAi:init(x, y, width, height)
    self.paddle = Paddle(x, y, width, height)
end

function PaddleAi:update(ball, dt)

    ball_center_y = ball.y + ball.height / 2
    paddle_center_y = self.paddle.y + self.paddle.height / 2

    if ball_center_y > paddle_center_y + self.paddle.height / 2 then
        self.paddle.dy = PADDLE_SPEED / 2
    elseif ball_center_y < paddle_center_y - self.paddle.height / 2 then
        self.paddle.dy = - PADDLE_SPEED / 2
    else
        self.paddle.dy = 0
    end

    self.paddle:update(dt)
end

function PaddleAi:render()
    self.paddle:render()
end