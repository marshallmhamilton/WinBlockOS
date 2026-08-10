local Screen = {
    Objects = {},
    Width = 0, 
    Height = 0,
    OnFrame = _G.Event.new(),
    SelectedObject = nil
}

function Screen.LoadDisplay(display)
    Screen.Objects = {}

    display.Open(Screen)

end

function Screen.Init()
    term.setGraphicsMode(2)
    Screen.Width, Screen.Height = term.getSize(2)
    
    Screen.LoadDisplay(require("WinBlocks.displays.loadingscreen"))
    


end

function Screen.RunScreen()
    _G.error = false

    _G.Input.MouseButton1:Connect(function(x,y)
        
        local selected = nil
        local clickpos = {x=x,y=y}
        for i=1, #Screen.Objects do
            local object = Screen.Objects[i]
            
            if object.Clickable and _G.Input.GetIfClicked(object,clickpos) then
                write("here\n")
                selected = object
            end
        end
        if selected then 
            if selected.Button then 

                selected.OnClick:Fire() 

            end
            if selected.Draggable then
                selected:SetInitalDragPos({x=x,y=y})
            end
        end
        write("here2\n")
        Screen.SelectedObject = selected
        
    end)

    _G.Input.MouseDrag:Connect(function (btn,x,y)
        write("here3\n")
        if btn == 1  and Screen.SelectedObject and Screen.SelectedObject.Draggable and Screen.SelectedObject.InitialDragPos  then
            write("here4\n")
            Screen.SelectedObject:Drag({x=x,y=y})
        end
        
    end)

    local delta = 0
    local frames = 0

    while not _G.error do
        frames = frames + 1
        
        delta = _G.Tick.Delta()
        

        for index, object in pairs(Screen.Objects) do
            if object.Moves then object:Move() end
        end



        term.setFrozen(true)
        term.clear()
            
           

        for i=1, #Screen.Objects do
            local object = Screen.Objects[i]
            object:Draw()
        end
        term.setFrozen(false)

        Screen.OnFrame:Fire(frames)
        sleep(_G.Config.Display.RefreshRate)
        
        
        
        
        

    end
end
return Screen