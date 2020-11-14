--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}


local BRONZE_SCORE = 1
local SILVER_SCORE = 5
local GOLD_SCORE = 10

function ScoreState:init()
    self.bronze_img = love.graphics.newImage('bronze_medal.png')
    self.silver_img = love.graphics.newImage('silver_medal.png')
    self.gold_img = love.graphics.newImage('gold_medal.png')
end

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')

    local img_to_show = nil
    if self.score >= GOLD_SCORE then
        img_to_show = self.gold_img
    elseif self.score >= SILVER_SCORE then
        img_to_show = self.silver_img
    elseif self.score >= BRONZE_SCORE then
        img_to_show = self.bronze_img
    end

    if img_to_show then
        love.graphics.draw(img_to_show, VIRTUAL_WIDTH / 2, 150 + img_to_show:getHeight(), 0,
                            1, 1, img_to_show:getWidth() / 2, img_to_show:getHeight() / 2)
    end

end