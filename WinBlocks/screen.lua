_G.Screen = {
    Objects = {}
}

function _G.Screen.DrawBottomSqaure(shape)

end

function _G.Screen.Init()
    term.setGraphicsMode(2)
    table.insert(_G.Screen.Objects,_G.Text.new("hi"))
end

function _G.Screen.RunScreen()
    _G.error = false

    local width, height = term.getSize()

    local text = "hello world"

    while not _G.error do

        local e,p = os.pullEvent()

        --render loop
        term.clear()
        
        for index, object in pairs(_G.Screen.Objects) do
            object:Draw()
        end

    


    end
end