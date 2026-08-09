local Screen = {
    Objects = {},
    Width = 0, 
    Height = 0,
    OnFrame = _G.Event.new()
}

function Screen.LoadDisplay(display)
    Screen.Objects = {}

    display.Open()

end

function Screen.Init()
    term.setGraphicsMode(2)
    Screen.Width, Screen.Height = term.getSize(2)

    Screen.LoadDisplay(require("WinBlocks.displays.menu"))
end

function Screen.RunScreen()
    _G.error = false
    local delta = 0
    local frames = 0
    while not _G.error do
        frames = frames + 1
        
        delta = _G.Tick.Delta()
        

        
        for index, object in pairs(Screen.Objects) do
            if object.Moves then object:Move() end
        end

        term.clear()
            
           

        for i=1, #Screen.Objects do
            local object = Screen.Objects[i]
            object:Draw()
        end
        Screen.OnFrame:Fire(frames)
        sleep(_G.Config.Display.RefreshRate)
        
        
        
        
        

    end
end
return Screen