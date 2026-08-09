Event,Connection = {}, {}
Event.__index, Connection.__index = Event, Connection

function Connection.new(thread)
    local self = setmetatable({})
    self.Thread = thread
    return self
end

function Connection:Disconnect()
    self.Thread = nil
end

function Connection:Call(...)
    self.Thread(...)
end

function Event.new()
    local self = setmetatable({})
    
    self.Connections = {}
    self.TimesFired = 0

    return self
end

function Event:Connect(thread)
    local connection = Connection(thread)
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