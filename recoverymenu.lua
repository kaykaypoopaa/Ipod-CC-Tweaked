--ive used the ipodmenu twice for this to work so W lawnman -GlitchGod42
print("welcome to the ipod 1.0!")
local option = 1
local selecting = true

local function ListenForKS()
    repeat
        local event, key, is_held = os.pullEvent(key)
        if key == keys.down and selecting then
            option = option + 1
            if option > 4 then
                option = 1
            end
            sleep(0.5)
        elseif key == keys.up and selecting then
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
            print("THE RECOVERY MENU")
            print("Selection:")
            term.blit("IPodOS", "000000", "777777")
            print()
            print("Craft-OS")
            print("Factory Reset")
            print("Reinstaller")
        elseif option == 2 and selecting then -- highlight option 2
            term.clear()
            term.setCursorPos(1,1)
            print("THE RECOVERY MENU")
            print("Selection:")
            print("IPodOS")
            term.blit("Craft-OS", "00000000", "77777777")
            print()
            print("Factory Reset")
            print("Reinstaller")
        elseif option == 3 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("THE RECOVERY MENU")
            print("Selection:")
            print("IPodOS")
            print("Craft-OS")
            term.blit("Factory Reset", "0000000000000", "7777777777777")
            print()
            print("Reinstaller")
        elseif option == 4 and selecting then
            term.clear()
            term.setCursorPos(1,1)
            print("THE RECOVERY MENU")
            print("Selection:")
            print("IPodOS")
            print("Craft-OS")
            print("Factory Reset")
            term.blit("Reinstaller", "00000000000", "77777777777")
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
                print("IPodOS Program")
                shell.run("ipodsys/ipodmenu.lua")
            elseif option == 2 then
                print("Craft-OS")
                shell.run("")
            elseif option == 3 then
                print("Factory Reset")
                shell.run("freset.lua")
            elseif option == 4 then
                print("Reinstaller")
                shell.run("reinstaller.lua")
            end
            os.reboot()
        end
    end
end

sleep(0.1)
parallel.waitForAll(ListenForKS, RenderSel, EnterApplication)

