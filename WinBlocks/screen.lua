local Screen = {
    Objects = {}
}

function Screen.DrawBottomSqaure(shape)

end

function Screen.Init()
    term.setGraphicsMode(1)
   
    table.insert(Screen.Objects,_G.Textbox.new("hi",{x=10,y=10},1))
end

function Screen.RunScreen()
    local error = false

    while not error do

        
        
        --render loop
        term.clear()
        
        for index, object in pairs(Screen.Objects) do
            object:draw()
        end
        local e,p = os.pullEvent()


    end
end
return Screen