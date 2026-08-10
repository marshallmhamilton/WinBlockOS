local Terminal = {
    TextboxList = {},
    Connections = {},
    Position = 0
}

local function createLine(text)
    Terminal.Position = 0
    local strings = require("cc.strings").split("\n")
    for _, string in pairs(strings) do
        --nothing for now
    end
end

function Terminal.Open()
    createLine("Bash")


end

function Terminal.Close()
    
end

return Terminal