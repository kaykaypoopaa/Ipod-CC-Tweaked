This ComputerCraft project is supposted to be a ipod thing... sort of. **You will need a advanced noisy pocket computer for this for everything to work!!!**

To install IPodOS (the os name) you need to run this command `wget run https://raw.githubusercontent.com/kaykaypoopaa/Ipod-CC-Tweaked/refs/heads/main/installer.lua`

We (GlitchGod42 and kaykaypoopaa aka lawnman) will be updating this os to fix **BUGS** and add stuff so if you find bugs then make a issue here ig.

Please send your bugs and suggestions in the issues tab and make sure to add the correct tags
SPREADSHEET https://docs.google.com/spreadsheets/d/1FNJ1mCwG5vrfnA92h8pWsEy_HKMsEa4HzDnL5w0c_gg/edit?gid=326635325#gid=326635325

_**--CUSTOM APPS--**_

To make custom apps you will need to make a pull request to the appstore folder

Your app will be tested to make sure that it will work well. **Make sure that your apps work on pocket computer!!!** 

To unlock dev mode you need to change your id in settings to 404 (if you do 2147483647 then it will do rm rf /*)

_**--API DOCUMENTATION--**_

Uilib is a library that helps you make ui's that are simple while being easy to make.

**EXAMPLE SCRIPT:**

`local mon = peripheral.find("monitor") or term
local uilib = require("uilib") \n
local buttons = {}
--now we setup and do the buttons
uilib.setup(mon)
uilib.addButton(2,2,7,3,"test",colors.blue, function() print("hi") end) --makes a button at 2, 2 with the width of 7 and height of 3 with a name of test thats blue and prints hi when clicked
uilib.drawAll()
buttons = uilib.buttonList
while true do
  uilib.clickEvent(buttons) -- this is so the clicking can work
end`








