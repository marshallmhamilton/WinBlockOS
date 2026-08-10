term.clear()
term.setCursorPos(1,1)


_G.Config = {}

_G.Config.Display = require("WinBlocks.configs.display")


_G.GuiObjects = {}

_G.GuiObjects.Box = require("WinBlocks.guiobjects.box")



_G.Textbox = require("WinBlocks.textbox")
_G.Event,_G.Connection = require("WinBlocks.event")
_G.Screen = require("WinBlocks.screen")
_G.Shape = require("WinBlocks.shape")
_G.Tick = require("WinBlocks.tick")
_G.Input = require("WinBlocks.input")


_G.Screen.Init()
parallel.waitForAny(_G.Input.Inputloop,_G.Screen.RunScreen)



