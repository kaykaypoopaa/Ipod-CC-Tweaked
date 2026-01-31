local mon = peripheral.find("monitor")
local uilib = require("uilib")
local buttons = {}

uilib.setup(mon)
uilib.addButton(2,2,7,3,"test",colors.blue, function() print("test") end)
uilib.drawAll()
buttons = uilib.buttonList
while true do
    uilib.clickEvent(buttons)
end
