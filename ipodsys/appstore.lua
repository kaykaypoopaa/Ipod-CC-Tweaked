local API_URL = "https://api.github.com/repos/kaykaypoopaa/Ipod-CC-Tweaked/contents/appstore"
local headers = { ["User-Agent"] = "CC-Tweaked-Search" }

print("Fetching app store contents...")
local response = http.get(API_URL, headers)

if not response then
    print("Failed to connect. Check http.whitelist in config.")
    return
end

local data = textutils.unserializeJSON(response.readAll())
response.close()

if type(data) ~= "table" then
    print("Error: GitHub returned unexpected data format.")
    return
end

-- YouTube-style suggestion display
local input = ""
while true do
    term.clear()
    term.setCursorPos(1,1)
    print("Search 'Ipod-CC-Tweaked/appstore': " .. input)
    print(string.rep("-", 40))
    
    local count = 0
    for _, item in ipairs(data) do
        -- Searches ALL items (files and folders)
        if item.name:lower():find(input:lower()) then
            -- Display type (Dir/File) and Name
            local itemType = (item.type == "dir") and "[Dir]" or "[File]"
            print(itemType .. " " .. item.name)
            count = count + 1
        end
        if count >= 5 then break end -- Limit suggestions
    end
    
    local event, char = os.pullEvent()
    if event == "char" then
        input = input .. char
    elseif event == "key" and char == keys.backspace then
        input = input:sub(1, -2)
    elseif event == "key" and char == keys.enter then
        for _, text in ipairs(data) do
            if text.name:lower() == input:lower() then
                shell.run("wget https://raw.githubusercontent.com/kaykaypoopaa/Ipod-CC-Tweaked/refs/heads/main/appstore/" .. text.name)
            end
        end
        break -- Stop search when you press enter
    end
end
