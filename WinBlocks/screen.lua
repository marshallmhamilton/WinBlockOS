Screen = {
    Objects = {}
}

function Screen.DrawBottomSqaure(shape)

end

function Screen.Init()
    term.setGraphicsMode(2)
    table.insert(_G.Screen.Objects,_G.Text.new("hi"))
end

function Screen.RunScreen()
    local error = false

    local width, height = term.getSize()

    local text = "hello world"

    while not error do

        local e,p = os.pullEvent()

        --render loop
        term.clear()
        
        for index, object in pairs(_G.Screen.Objects) do
            object:Draw()
        end

    


    end
end
return Screen