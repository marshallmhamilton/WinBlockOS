local Input = {
    KeyDown = _G.Event.new(),
    KeyUp = _G.Event.new(),

    MouseButton1 = _G.Event.new(),
    MouseButton2 = _G.Event.new(),

    MouseDrag = _G.Event.new(),

    Selected = nil,

    KeysDown = {}
}

function Input.GetIfClicked(object,clickpos)
    local objectboundsX = {object.Position.x, object.Position.x + object.Size.x}
    local objectboundsY = {object.Position.y, object.Position.y + object.Size.y}
    if  objectboundsX[1] <= clickpos.x and objectboundsX[2] >= clickpos.x
    and objectboundsY[1] <= clickpos.y and objectboundsY[2] >= clickpos.y then
        return true
    else
        return false
    end
end

function Input.Inputloop()
    while true do
        local event,param1,param2,param3 = os.pullEvent()
        
        if event == "key" then
            Input.KeyDown:Fire(param1,param2)
            Input.KeysDown[param1] = true
        elseif event == "key_up" then
            Input.KeyUp:Fire(param1,param2)
            Input.KeysDown[param1] = false
        elseif event == "mouse_click" then
            write(event.." "..param1)
            if param1 == 1 then
                
                Input.MouseButton1:Fire(param2,param3)
                
            elseif param1 == 2 then
                Input.MouseButton2:Fire(param2,param3)
            end
        elseif event == "mouse_drag" then
            Input.MouseDrag:Fire(param1,param2,param3)
        end

        
    end
end

return Input