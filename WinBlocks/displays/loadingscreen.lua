local LoadingScreen = {
    Connections = {

    }
}

function LoadingScreen.Open(screen)
    
    local title = _G.Textbox.new("WinBlock",{x =screen.Width/2 - 3.5*7*2,y=40},2)
    local belowtitle = _G.Textbox.new("OS",{x =screen.Width/2 - 3.5*2*4,y=55},4)

    local infotext = _G.Textbox.new("Press Enter to continue...",{x=0,y=screen.Height-8},1)

    table.insert(screen.Objects,title)
    table.insert(screen.Objects,belowtitle)
    table.insert(screen.Objects,infotext)

    local count = 5
    local enterloop = screen.OnFrame:Connect(function()
        if count <= 7 then
            infotext.String = "Press Enter to continue"
        else
            infotext.String = "Press Enter to continue..."
        end
        count = count + 1
        if count == 15 then count = 1 end
    end)

    local inputwait = _G.Input.KeyDown:Connect(function(key,held)
        

        if key == 28 then
            LoadingScreen.Close()
            _G.Screen.LoadDisplay(_G.Displays.Menu)
        end
    end)

    table.insert(LoadingScreen.Connections,enterloop)
    table.insert(LoadingScreen.Connections,inputwait)

end


function LoadingScreen.Close()
    for _, connection in pairs(LoadingScreen.Connections) do
        connection:Disconnect()
    end
end

return LoadingScreen