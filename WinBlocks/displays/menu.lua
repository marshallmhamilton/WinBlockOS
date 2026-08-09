local Menu = {}

function Menu.Open()
    local screen = _G.Screen
    local topbar = _G.GuiObjects.Box.new({x=screen.Width,y=9},{x=0,y=0},7)
    local time = _G.Textbox.new("Loading",{x=0,y=0},1,topbar)

    screen.OnFrame:Connect(function()
        time.String = os.date("%I:%M %p")
    end)

    table.insert(screen.Objects,topbar)
    table.insert(screen.Objects, time)
    
end

return Menu