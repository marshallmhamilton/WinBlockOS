local Tick = {
    lastTick = 0,

}

function Tick.Delta()
    local now = os.clock()
    local last = Tick.lastTick
    Tick.lastTick = now
    return now - last
end


return Tick