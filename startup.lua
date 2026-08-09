_G.term = term
_G.os = os

term.clear()
term.setCursorPos(1,1)

require("WinBlocks.event")
require("WinBlocks.screen")
require("WinBlocks.shape")
require("WinBlocks.text")

_G.Screen.Init()
_G.Screen.RunScreen()


