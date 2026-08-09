local physics = {}

function physics.runVelocity(obj,delta)
    obj.Position.x = obj.Position.x + (obj.Velocity.x * delta)
    obj.Position.y = obj.Position.y + (obj.velocity.y * delta)
end

return physics