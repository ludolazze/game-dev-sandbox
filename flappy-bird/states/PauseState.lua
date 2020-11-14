--[[
    PauseState Class
    Author: Ludovico Lazzeretti

    Used to store current state for pause command.
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.pause_img = love.graphics.newImage("pause2.png")
end

function PauseState:enter(params)
    self.state = params.state
    sounds["music"]:pause()
    sounds["pause"]:play()
end

function PauseState:update(dt)
    -- go back to play if pause key is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            state = self.state
        })
        sounds["music"]:play()
    end
end

function PauseState:render()
    self.state:render()
    love.graphics.draw(self.pause_img, VIRTUAL_WIDTH / 2 - self.pause_img:getWidth() / 2, VIRTUAL_HEIGHT / 2 - self.pause_img:getHeight() / 2)
end