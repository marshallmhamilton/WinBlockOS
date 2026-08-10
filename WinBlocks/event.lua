local Event,Connection = {}, {}
Event.__index, Connection.__index = Event, Connection

function Connection.new(thread)
    local self = setmetatable({},Connection)
    self.Thread = thread
    self.Connected = true
    return self
end

function Connection:Disconnect()
    self.Thread = nil
    self.Connected = false
end

function Connection:Call(...)
    if self.Connected then
        self.Thread(...)
    end
end

function Event.new()
    local self = setmetatable({},Event)
    
    self.Connections = {}
    self.TimesFired = 0

    return self
end

function Event:Connect(thread)
    local connection = Connection.new(thread)
    table.insert(self.Connections,connection)
    return connection
end

function Event:Fire(...)
    for _, connection in pairs(self.Connections) do
        coroutine.wrap(connection.Call)(connection,...)
    end
    self.TimesFired = self.TimesFired + 1
end

return Event, Connection