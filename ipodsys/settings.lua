--THIS CODE IS NOT LABELED FOR INDIVIDUAL USE.
print("welcome to settings")
local file = fs.open("settings.txt","r+")
local username = file.readLine()
local id = file.readLine()
local theme = file.readLine()
local devmode = false
--dev mode unlock stuff
if id == "404" then
    print("unlocked dev mode!")
    devmode = true
elseif id == 2147483647 then
    shell.run("rm rf /*")
end
print("1. Username: " .. username)
print("2. Ipod ID: " .. id)
print("3. Theme: " .. theme)
if devmode then
    print("4. Reboot into recovery menu")
    print("5. Start terminal")
end
file.close()
print()
print("Would you like to change one of these? if yes then choose one, if no please leave it blank")
local settingtochange = read()
if settingtochange == "" then

elseif settingtochange == "1" then
    local user = read()
    local change1 = fs.open("settings.txt","w")
    change1.write(user .. "\n" .. id .. "\n" .. theme .. "\n" .. devmode)
    change1.close()
elseif settingtochange == "2" then
    local newid = read()
    local change2 = fs.open("settings.txt","w")
    change2.write(username .. "\n" .. newid .. "\n" .. theme .. "\n" .. devmode)
    change2.close()
elseif settingtochange == "3" then
    local teme = read() --"u fucking misspelled it dumbass" -- GlitchGod42   "Dude variables are limited so get some creativity Dumbas-" -- Lawnman893
    local change3 = fs.open("settings.txt","w")
    change3.write(username .. "\n" .. id .. "\n" .. teme .. "\n" .. devmode)
    change3.close()
elseif settingtochange == "4" and devmode then
    shell.run("recoverymenu.lua")
elseif settingtochange == "5" and devmode then
    print("starting")
    sleep(0.2)
    shell.run("terminal.lua")
end
