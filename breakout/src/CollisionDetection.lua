CollisionDetection = Class{}


-- ABB collision detection
function CollisionDetection:check(lhs, rhs)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if lhs.x > rhs.x + rhs.width or rhs.x > lhs.x + lhs.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if lhs.y > rhs.y + rhs.height or rhs.y > lhs.y + lhs.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end