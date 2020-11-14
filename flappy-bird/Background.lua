--[[
    Background Class
    Author: Ludovico Lazzeretti

    The Backgrond class represents the background and floor. Can be used to update
    the motion of the background (to give sense of scene motion) and to render the scene background.
]]

Background = Class{}

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60
local BACKGROUND_LOOPING_POINT = 413

function Background:init(closeSpeed, farSpeed)
    self.closeSpeed = closeSpeed
    self.farSpeed = farSpeed
    self.background = love.graphics.newImage('background.png')
    self.backgroundScroll = 0
    self.ground = love.graphics.newImage('ground.png')
    self.groundScroll = 0
end

function Background:update(dt)
    -- scroll our background and ground, looping back to 0 after a certain amount
    self.backgroundScroll = (self.backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    self.groundScroll = (self.groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
end

function Background:render_back()
    love.graphics.draw(self.background, -self.backgroundScroll, 0)
end


function Background:render_front()
    love.graphics.draw(self.ground, -self.groundScroll, VIRTUAL_HEIGHT - 16)
end
