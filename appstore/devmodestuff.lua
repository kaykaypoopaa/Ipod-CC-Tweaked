print("dev mode stuff")
local file = fs.open("settings.txt", "r")
local dmc = file.readLine()
if dmc == "" then
    print("you need to enable dev mode by setting your id to 404")
    sleep(0.5)
    os.shutdown()
end
print("1. Go into CraftOS")
print("2. Reboot into recovery menu")
local stc = read()
if stc == "" then

elseif stc == "1" then
shell.exit()
elseif stc == "2" then
shell.run("rename startup.lua startup2.lua")
shell.run("rename recoverymenu.lua startup.lua")
end


