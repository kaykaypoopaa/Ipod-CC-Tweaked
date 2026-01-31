local owner = "kaykaypoopaa"
local repo = "Ipod-CC-Tweaked"
local folder = "appstore"
local API_URL = "https://api.github.com"..owner.."/"..repo.."/contents/"..folder

term.clear()
term.setCursorPos(1,1)
print("Connecting to GitHub...")

-- Headers are MANDATORY for GitHub API
local headers = {
    ["User-Agent"] = "CC-Tweaked-Search",
    ["Accept"] = "application/vnd.github.v3+json"
}

-- Use assert to catch the specific 'Connection Failed' reason
local ok, response = pcall(function() 
    return assert(http.get(API_URL, headers)) 
end)

if not ok then
    print("Error Details: " .. tostring(response))
    print("\nPossible fix: Add 'api.github.com' to your [[http.rules]] in the config file.")
    return
end

local data = textutils.unserializeJSON(response.readAll())
response.close()

-- YouTube-style suggestion display
print("Search: ")
local input = ""
while true do
    local _, char = os.pullEvent("char")
    input = input .. char
    term.clearLine()
    term.write("> " .. input)
    
    -- Filter and show results
    local count = 0
    for _, item in ipairs(data) do
        if item.name:lower():find(input:lower()) then
            print("\n  - " .. item.name)
            count = count + 1
        end
        if count >= 3 then break end
    end
    term.setCursorPos(3 + #input, 2)
end
