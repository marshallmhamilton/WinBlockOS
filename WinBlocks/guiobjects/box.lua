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

    self.Clickable = true

    self.Button = false
    self.Draggable = false
    self.InitialDragPos = nil
    self.OnClick = _G.Event.new()
    self.OnMove = _G.Event.new()
    

    return self
end

function Box:SetInitalDragPos(clickpos)
    --assuming click is inside bounds
    local x = clickpos.x - self.Position.x
    local y = clickpos.y - self.Position.y
    self.InitialDragPos = {x=x,y=y}
end

function Box:Drag(position)
    
    self.Position.x = position.x - self.InitialDragPos.x 
    self.Position.y = position.y - self.InitialDragPos.y
    write("here5\n")
    self.OnMove:Fire()
    
end

function Box:Center()
    self.Position.x = math.floor(_G.Screen.Width/2) - math.floor(self.Size.x/2)
    self.Position.y = math.floor(_G.Screen.Height/2) - math.floor(self.Size.y/2)
end

function Box:MakeButton()
    self.Button = true
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