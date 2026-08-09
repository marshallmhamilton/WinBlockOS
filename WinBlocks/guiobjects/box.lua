local Box = {}
Box.__index = Box

function Box.new(size,pos,color, parent)
    local self = setmetatable({},Box)

    self.Size = size
    self.Position = pos
    self.Color = color
    self.Velocity = {0,0}
    self.Moves = false
    self.Parent = parent or nil

    self.OnClick = _G.Event.new()
    self.OnMove = _G.Event.new()
    

    return self
end

function Box:SetVelocity(v)
    self.Moves = true
    self.Velocity = v
end

function Box:Move()
    
    self.Moves = true
    self.OnMove:Fire()
    self.Position.x = self.Position.x + self.Velocity.x
    self.Position.y = self.Position.y + self.Velocity.y
    
end

function Box:SetMoves(bool)
    self.Moves = bool
end

function Box:Draw()
    _G.Shape.DrawBox(self.Position,self.Size,self.Color)
end

return Box