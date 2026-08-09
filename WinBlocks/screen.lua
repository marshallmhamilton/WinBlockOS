local Screen = {
    Objects = {},
    Width = 0, 
    Height = 0
}

function Screen.DrawBottomSqaure(shape)

end

function Screen.Init()
    term.setGraphicsMode(2)
    Screen.Text = _G.Textbox.new("hi",{x=10,y=10},1)
    table.insert(Screen.Objects,Screen.Text)
    Screen.Width, Screen.Height = term.getSize(2)
end

function Screen.RunScreen()
    local error = false

    while not error do

        
        
        --render loop
        term.clear()
        
        for index, object in pairs(Screen.Objects) do
            object:draw()
        end
        sleep(0.1)
        Screen.Text.Position.x = Screen.Text.Position.x + 1
        if Screen.Text.Position.x > Screen.Width then
            Screen.Text.Position.x = 0
        end

        
        

    end
end
return Screen