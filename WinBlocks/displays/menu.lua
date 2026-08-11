local Menu = {
    Connections = {}

}

function Menu.Open(screen)
    local topbar = _G.GuiObjects.Box.new({x=screen.Width,y=9},{x=0,y=0},7)

    local time = _G.Textbox.new("Loading",{x=0,y=0},1,topbar)
    time:CenterToParent()

    local button = _G.GuiObjects.Box.new({x=90,y=30},{x=0,y=0},7)
    button:Center()
    button.Draggable = true

    local play = _G.Textbox.new("Open Terminal",{x=0,y=0},1,button) 
    play:CenterToParent()

    local timeconnection = screen.OnFrame:Connect(function()
        time.String = os.date("%I:%M %p")
        time:CenterToParent()
    end)

    local buttonConnection = button.OnClick:Connect(function()
        Menu.Close()
        screen.LoadDisplay(_G.Displays.Loading)
    end)

    table.insert(Menu.Connections,timeconnection)
    table.insert(Menu.Connections,buttonConnection)
    table.insert(screen.Objects,topbar)
    table.insert(screen.Objects,button)
    table.insert(screen.Objects, time)
    table.insert(screen.Objects,play)
    
end

function Menu.Close()
    for _, connection in pairs(Menu.Connections) do
        connection:Disconnect()
    end
end

return Menu