-- HTML Renderer for CC: Tweaked
-- Supports basic HTML tags and styling

local HTMLRenderer = {}

-- Color mappings for CC: Tweaked
local colorMap = {
    black = colors.black,
    red = colors.red,
    green = colors.green,
    yellow = colors.yellow,
    blue = colors.blue,
    magenta = colors.magenta,
    cyan = colors.cyan,
    white = colors.white,
    gray = colors.gray,
    lightGray = colors.lightGray,
    lime = colors.lime,
    pink = colors.pink,
    orange = colors.orange,
    purple = colors.purple,
    brown = colors.brown,
    lightBlue = colors.lightBlue
}

-- Parse HTML into a simple DOM structure
function HTMLRenderer.parse(html)
    local elements = {}
    local pos = 1
    
    while pos <= #html do
        -- Find next tag
        local tagStart = html:find("<", pos, true)
        
        if not tagStart then
            -- No more tags, add remaining text
            local text = html:sub(pos):gsub("^%s+", ""):gsub("%s+$", "")
            if #text > 0 then
                table.insert(elements, {type = "text", content = text})
            end
            break
        end
        
        -- Add text before tag
        if tagStart > pos then
            local text = html:sub(pos, tagStart - 1):gsub("^%s+", ""):gsub("%s+$", "")
            if #text > 0 then
                table.insert(elements, {type = "text", content = text})
            end
        end
        
        -- Find tag end
        local tagEnd = html:find(">", tagStart, true)
        if not tagEnd then break end
        
        local tagContent = html:sub(tagStart + 1, tagEnd - 1)
        
        -- Check if closing tag
        if tagContent:sub(1, 1) == "/" then
            local tagName = tagContent:sub(2):lower()
            table.insert(elements, {type = "closeTag", tag = tagName})
        else
            -- Parse opening tag and attributes
            local spacePos = tagContent:find(" ")
            local tagName, attrs
            
            if spacePos then
                tagName = tagContent:sub(1, spacePos - 1):lower()
                attrs = tagContent:sub(spacePos + 1)
            else
                tagName = tagContent:lower()
                attrs = ""
            end
            
            -- Parse attributes
            local attributes = {}
            for key, value in attrs:gmatch('(%w+)="([^"]*)"') do
                attributes[key:lower()] = value
            end
            
            table.insert(elements, {type = "openTag", tag = tagName, attrs = attributes})
        end
        
        pos = tagEnd + 1
    end
    
    return elements
end

-- Render parsed elements to terminal
function HTMLRenderer.render(elements, output)
    output = output or term
    local x, y = 1, 1
    local maxX, maxY = output.getSize()
    
    local styleStack = {{
        color = colors.white,
        bgColor = colors.black,
        bold = false
    }}
    
    local function getCurrentStyle()
        return styleStack[#styleStack]
    end
    
    local function pushStyle(changes)
        local current = getCurrentStyle()
        local newStyle = {
            color = changes.color or current.color,
            bgColor = changes.bgColor or current.bgColor,
            bold = changes.bold ~= nil and changes.bold or current.bold
        }
        table.insert(styleStack, newStyle)
    end
    
    local function popStyle()
        if #styleStack > 1 then
            table.remove(styleStack)
        end
    end
    
    local function applyStyle()
        local style = getCurrentStyle()
        output.setTextColor(style.color)
        output.setBackgroundColor(style.bgColor)
    end
    
    local function writeText(text)
        applyStyle()
        for char in text:gmatch(".") do
            if char == "\n" or x > maxX then
                x = 1
                y = y + 1
                if y > maxY then
                    output.scroll(1)
                    y = maxY
                end
                output.setCursorPos(x, y)
                if char == "\n" then
                    goto continue
                end
            end
            
            output.write(char)
            x = x + 1
            
            ::continue::
        end
    end
    
    output.setCursorPos(x, y)
    
    for _, elem in ipairs(elements) do
        if elem.type == "text" then
            writeText(elem.content)
            
        elseif elem.type == "openTag" then
            if elem.tag == "h1" or elem.tag == "h2" or elem.tag == "h3" then
                writeText("\n")
                pushStyle({color = colors.yellow, bold = true})
                
            elseif elem.tag == "p" then
                writeText("\n")
                
            elseif elem.tag == "br" then
                writeText("\n")
                
            elseif elem.tag == "b" or elem.tag == "strong" then
                pushStyle({color = colors.white, bold = true})
                
            elseif elem.tag == "i" or elem.tag == "em" then
                pushStyle({color = colors.lightGray})
                
            elseif elem.tag == "a" then
                pushStyle({color = colors.blue})
                
            elseif elem.tag == "span" then
                local style = {}
                if elem.attrs.color then
                    style.color = colorMap[elem.attrs.color] or colors.white
                end
                pushStyle(style)
                
            elseif elem.tag == "div" then
                writeText("\n")
            end
            
        elseif elem.type == "closeTag" then
            if elem.tag == "h1" or elem.tag == "h2" or elem.tag == "h3" then
                popStyle()
                writeText("\n")
                
            elseif elem.tag == "p" then
                writeText("\n")
                
            elseif elem.tag == "b" or elem.tag == "strong" or 
                   elem.tag == "i" or elem.tag == "em" or 
                   elem.tag == "a" or elem.tag == "span" then
                popStyle()
                
            elseif elem.tag == "div" then
                writeText("\n")
            end
        end
    end
    
    writeText("\n")
end

-- Main function to render HTML string
function HTMLRenderer.renderHTML(html, output)
    local elements = HTMLRenderer.parse(html)
    HTMLRenderer.render(elements, output)
end

-- Example usage
local exampleHTML = [[
<h1>Welcome to CC: Tweaked!</h1>
<p>This is a <b>basic HTML renderer</b> for ComputerCraft.</p>
<p>It supports:</p>
<p>- <span color="lime">Colored text</span></p>
<p>- <b>Bold formatting</b></p>
<p>- <i>Italic (shown as gray)</i></p>
<p>- <a>Links (shown in blue)</a></p>
<br>
<h2>Features</h2>
<p>You can render HTML content on monitors or terminals!</p>
]]

-- Run the example
term.clear()
term.setCursorPos(1, 1)
HTMLRenderer.renderHTML(exampleHTML)

return HTMLRenderer
