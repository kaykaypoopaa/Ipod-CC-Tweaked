--THIS CODE IS NOT LABELED FOR INDIVIDUAL USE.
print("welcome to the ipod 1.0!")
local option = 1
local selecting = true

local sets = fs.open("settings.txt", "r")
sets.readLine()
sets.readLine()
local theme = sets.readLine()
if theme == "Dark" then
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
elseif theme == "Medium" then
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.gray)
elseif theme == "Light" then
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
end

local function ListenForKS()
    repeat
        local event, key, is_held = os.pullEvent(key)
        if key == 264 and selecting then
            option = option + 1
            if option > 4 then
                option = 1
            end
            sleep(0.5)
        elseif key == 265 and selecting then
            option = option - 1
            if option < 1 then
                option = 4
            end
            sleep(0.5)
        end
    until selecting == false
end

local function RenderSel()
    repeat
        if option == 1 and selecting then -- highlight option 1
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to ipod os 1.0")
            print("Selection:")
            term.blit("Music", "00000", "77777")
            print()
            print("Apps")
            print("Notepad")
            print("Settings")
        elseif option == 2 and selecting then -- highlight option 2
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to ipod os 1.0")
            print("Selection:")
            print("Music")
            term.blit("Apps", "0000", "7777")
            print()
            print("Notepad")
            print("Settings")
        elseif option == 3 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to ipod os 1.0")
            print("Selection:")
            print("Music")
            print("Apps")
            term.blit("Notepad", "0000000", "7777777")
            print()
            print("Settings")
        elseif option == 4 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to ipod os 1.0")
            print("Selection:")
            print("Music")
            print("Apps")
            print("Notepad")
            term.blit("Settings", "00000000", "77777777")
        end
        sleep(0.2)
    until selecting == false
end

local function EnterApplication()
    while true do
        sleep(0.1)
        local event, key, is_held = os.pullEvent(key)
        if key == 257 then
            sleep(0.5)
            selecting = false
            term.clear()
            term.setCursorPos(1,1)
            term.write("Opening ")
            sleep(0.5)
            if option == 1 then
                print("Music Program")
                shell.run("music.lua")
            elseif option == 2 then
                print("Application Menu")
                shell.run("appmenu.lua")
            elseif option == 3 then
                print("Notepad")
                shell.run("notepad.lua")
            elseif option == 4 then
                print("Settings App")
                shell.run("settings.lua")
            end
            os.reboot()
        end
    end
end

sleep(0.1)
parallel.waitForAll(ListenForKS, RenderSel, EnterApplication)
