local Screen = {
    Objects = {}
}

function Screen.DrawBottomSqaure(shape)

end

function Screen.Init()
    term.setGraphicsMode(2)
    for index, thing in pairs(_G.Textbox) do
        write(index)
    end
    table.insert(Screen.Objects,_G.Textbox.new("hi",nil,nil))
end

function Screen.RunScreen()
    local error = false

    local width, height = term.getSize()

    local text = "hello world"

    while not error do

        

        --render loop
        term.clear()
        
        for index, object in pairs(Screen.Objects) do
            object:draw()
        end

    


    end
end
return Screen