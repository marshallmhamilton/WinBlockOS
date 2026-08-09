_G.term = term
_G.os = os

term.clear()
term.setCursorPos(1,1)



_G.Event = require("WinBlocks.event")
_G.Screen =require("WinBlocks.screen")
_G.Shape = require("WinBlocks.shape")
_G.Text = require("WinBlocks.text")

_G.Screen.Init()
_G.Screen.RunScreen()


