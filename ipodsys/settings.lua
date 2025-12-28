--THIS CODE IS NOT LABELED FOR INDIVIDUAL USE.
print("welcome to settings")
local file = fs.open("settings.txt","r")
local username = file.readLine()
local id = file.readLine()
local theme = file.readLine()
print("1. Username: " .. username)
print("2. Ipod ID: " .. id)
print("3. Theme: " .. theme)
file.close()
print()
print("Would you like to change one of these? if yes then choose one, if no please leave it blank")
local settingtochange = read()
if settingtochange == "" then

elseif settingtochange == "1" then
    local user = read()
    local change1 = fs.open("settings.txt","w")
    change1.write(user .. "\n" .. id .. "\n" .. theme)
    change1.close()
elseif settingtochange == "2" then
    local newid = read()
    local change2 = fs.open("settings.txt","w")
    change2.write(username .. "\n" .. newid .. "\n" .. theme)
    change2.close()
elseif settingtochange == "3" then
    local teme = read()
    local change3 = fs.open("settings.txt","w")
    change3.write(username .. "\n" .. id .. "\n" .. teme)
    change3.close()
end
