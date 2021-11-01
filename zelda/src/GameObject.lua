--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    -- whether an object can be consumed
    self.consumable = def.consumable

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end
    self.onConsume = function() end
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    local frame = self.frame

    if self.states then
        frame = self.states[self.state].frame
    end

    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][frame],
    self.x + adjacentOffsetX, self.y + adjacentOffsetY)

end