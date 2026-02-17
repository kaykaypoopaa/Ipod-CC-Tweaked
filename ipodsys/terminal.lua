--this is on the same level of turboshit code as cab.lua
--also lawnman get the fuck out of here
printmode = ""--prepare printing
print("Terminal")
print("this terminal is very unfinished")
sleep(0.25)
while true do
    local command = read() --read the command
    if command == "" then
    
    elseif command == "programs" then--print the programs
    print("clear dir exit id")
    print("lua ls label print")
    print("reboot shutdown")
    elseif command == "id" then
        shell.run("id")
    elseif command == "reboot" then
        os.reboot()
    elseif command == "shutdown" then
        os.shutdown()
    elseif command == "motd" then
        shell.run("motd")
    elseif command == "dir" then
        shell.run("dir")
    elseif command == "ls" then
        shell.run("ls")
    elseif command == "print" and printmode == "" then--check if printmode is off and that command is print
        print("Printing enabled")
        printmode = "true"
    elseif command == "print" and printmode == "true" then--same but the opposite
        print("Printing disabled")
        printmode = ""
    elseif command ~= "" and printmode == "true" then--this is the printing code
        print("\n".. command)
    elseif command == "clear" then
        shell.run("clear")
    elseif command == "exit" then
        break
    elseif command == "lua" then
        shell.run("lua")
    elseif command == "label" then
        shell.run(command)
    elseif command > "label set " then
        shell.run(command)
    elseif command == "label get" then
        shell.run(command)
    elseif command == "label clear" then
        shell.run(command)
    end
end
