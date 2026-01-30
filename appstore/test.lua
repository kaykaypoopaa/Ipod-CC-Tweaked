local owner = "kaykaypoopaa"
local repo = "Ipod-CC-Tweaked"
local folder = "appstore"

local function searchGitHub(query)
    local url = "https://api.github.com"..owner.."/"..repo.."/contents/"..folder
    -- GitHub REQUIRES this header table or it returns an error
    local response = http.get(url, {["User-Agent"] = "CC-Tweaked"})
    
    if not response then return {"Error: Connection Failed"} end
    
    local data = textutils.unserializeJSON(response.readAll())
    response.close()
    
    local matches = {}
    for _, item in ipairs(data) do
        -- The "Search" part: check if item name contains your query
        if item.name:lower():find(query:lower()) then
            table.insert(matches, item.name)
        end
    end
    return matches
end

-- Simple Search UI
local input = ""
while true do
    term.clear()
    term.setCursorPos(1,1)
    print("GitHub App Search: " .. input)
    print(string.rep("-", 20))
    
    if #input > 0 then
        local results = searchGitHub(input)
        for i, name in ipairs(results) do
            print(i .. ". " .. name)
            if i >= 5 then break end
        end
    end
    
    local event, char = os.pullEvent()
    if event == "char" then
        input = input .. char
    elseif event == "key" and char == keys.backspace then
        input = input:sub(1, -2)
    end
end
