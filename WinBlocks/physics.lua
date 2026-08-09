local physics = {}

function physics.runVelocity(obj,delta)
    obj.Position.x = math.floor(obj.Position.x + (obj.Velocity.x * delta))
    obj.Position.y = math.floor(obj.Position.y + (obj.Velocity.y * delta))
end

return physics