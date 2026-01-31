--0. Variables
local path = "applist.txt"
--1. Listing stuff
if fs.exists(path) then
    local file = fs.open(path, "r")
    local contents = file.readAll()
    file.close()
    print(contents)
else
    local file = fs.open(path, "w")
    file.write("No apps listed.")
    file.close()
end
--2. App Launching

