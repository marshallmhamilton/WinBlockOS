term.clear()
term.setCursorPos(1,1)
_G.error = false

local width, height = term.getSize()

local text = "hello world"

while not _G.error do

    local e,p = os.pullEvent()

    --render loop
    term.clear()
    term.setCursorPos( (width - string.len(text))/2,height/2)
    term.write(text)
    sleep()
end


