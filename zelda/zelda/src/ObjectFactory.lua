function createObject(room, type, x, y)

    if type == "heart" then
        local heart = GameObject(GAME_OBJECT_DEFS['heart'],
            x, y)

        heart.onConsume = function(player)
            player:heal(2)
            gSounds['heart_pickup']:play()
        end

        return heart
    else
        if type == "switch" then
            local switch = GameObject(GAME_OBJECT_DEFS['switch'], x, y)

            -- define a function for the switch that will open all doors in the room
            switch.onCollide = function()
                if switch.state == 'unpressed' then
                    switch.state = 'pressed'

                    -- open every door in the room if we press the switch
                    for k, doorway in pairs(room.doorways) do
                        doorway.open = true
                    end

                    gSounds['door']:play()
                end
            end

            return switch
        else
            return nil
        end
    end
end
