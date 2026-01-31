--THIS CODE IS NOT LABELED FOR INDIVIDUAL USE.
print("this is the app menu")
local option = 1
local selecting = true

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
            print("Welcome to the app selector!")
            print("Selection:")
            term.blit("Calculator", "0000000000", "7777777777")
            print()
            print("Custom Apps")
            print("App Store")
            print("Snake")
        elseif option == 2 and selecting then -- highlight option 2
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to the app selector!")
            print("Selection:")
            print("Calculator")
            term.blit("Custom Apps", "00000000000", "77777777777")
            print()
            print("App Store")
            print("Snake")
        elseif option == 3 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to the app selector!")
            print("Selection:")
            print("Calculator")
            print("Custom Apps")
            term.blit("App Store", "000000000", "777777777")
            print()
            print("Snake")
        elseif option == 4 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("Welcome to the app selector!")
            print("Selection:")
            print("Calculator")
            print("Custom Apps")
            print("App Store")
            term.blit("Snake", "00000", "77777")
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
                print("Calculator")
                shell.run("calc.lua")
            elseif option == 2 then
                print("Notes")
                shell.run("notes.lua")
            elseif option == 3 then
                print("Custom App Browser")
                shell.run("cab.lua")
            elseif option == 4 then
                print("Snake")
                shell.run("snake.lua")
            end
            os.reboot()
        end
    end
end

sleep(0.1)
parallel.waitForAll(ListenForKS, RenderSel, EnterApplication)
