local Screen = {
    Objects = {},
    Width = 0, 
    Height = 0
}

function Screen.Init()
    term.setGraphicsMode(2)
    Screen.Text = _G.Textbox.new("Hello World",{x=10,y=10},1)
    Screen.Text.Velocity = {x=100,y=0}
    Screen.Text.Moves = true
    table.insert(Screen.Objects,Screen.Text)
    Screen.Width, Screen.Height = term.getSize(2)
end

function Screen.RunScreen()
    local error = false
    -- refresh loop
    local delta = 0
    while not error do
        
        delta = _G.Tick.Delta()
        
        term.setFrozen(true)
        if delta >= (1/20) then
             --doing calculations
            

            

            for _, object in pairs(Screen.Objects) do
                if object.Moves then _G.Physics.runVelocity(object,delta) end
            end

            
            -- drawing frame
            term.clear()
            
            for _, object in pairs(Screen.Objects) do
                object:draw()
            end
            term.setFrozen(false)
        end
        sleep()
       
        

    end
end
return Screen