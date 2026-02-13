--this is some real turboshit code but if it works it works -GlitchGod42
--0. Variables
local sc = require("/apis/speedycoding")
local path = "applist.txt"
--1. Listing Stuff
sc.reset()
print("Which app do you want to launch?")
shell.run("dir ../ipodapps")
--2. App Launching
local launchapp = read()
sleep(0.3)
sc.reset()
print("Launching "..launchapp)
sleep(0.5)
shell.run("../ipodapps/"..launchapp)
