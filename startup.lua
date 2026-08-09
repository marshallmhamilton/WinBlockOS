_G.term = term
_G.os = os

term.clear()
term.setCursorPos(1,1)


_G.Textbox = require("WinBlocks.text")
_G.Event = require("WinBlocks.event")
_G.Screen = require("WinBlocks.screen")
_G.Shape = require("WinBlocks.shape")
for index, thing in pairs(_G.Textbox) do
    write(index)
end
_G.Screen.Init()
_G.Screen.RunScreen()


