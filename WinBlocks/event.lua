_G.Event,_G.Connection = {}, {}


function _G.Connection.new(thread)
    local self = setmetatable({})
    self.Thread = thread
    return self
end

function _G.Connection:Disconnect()
    self.Thread = nil
end

function _G.Connection:Call(...)
    self.Thread(...)
end

function _G.Event.new()
    local self = setmetatable({})
    
    self.Connections = {}
    self.TimesFired = 0

    return self
end

function _G.Event:Connect(thread)
    local connection = _G.Connection(thread)
    table.insert(self.Connections,connection)
    return connection
end

function _G.Event:Fire(...)
    for _, connection in pairs(self.Connections) do
        coroutine.wrap(connection.Call)(connection,...)
    end
end



