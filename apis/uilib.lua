-- uilib.lua
local uilib = {}

-- Internal storage so the library "remembers" your settings
uilib.mon = term
uilib.buttonList = {}

-- 1. Setup the monitor
function uilib.setup(target)
    uilib.mon = target
end

-- 2. Add a button to the internal list
function uilib.addButton(x, y, width, height, label, color, action)
    table.insert(uilib.buttonList, {
        xMin = x, xMax = x + width - 1,
        yMin = y, yMax = y + height - 1,
        label = label,
        color = color,
        action = action
    })
end

-- 3. Draw everything in the list
function uilib.drawAll()
    uilib.mon.setBackgroundColor(colors.black)
    uilib.mon.clear()
    
    for _, b in ipairs(uilib.buttonList) do
        uilib.mon.setBackgroundColor(b.color)
        
        -- Draw the button shape
        for i = b.yMin, b.yMax do
            uilib.mon.setCursorPos(b.xMin, i)
            uilib.mon.write(string.rep(" ", b.xMax - b.xMin + 1))
        end
        
        -- Draw the text
        uilib.mon.setCursorPos(b.xMin + 1, b.yMin + 1)
        uilib.mon.setTextColor(colors.white)
        uilib.mon.write(b.label)
    end
end

--4. Clicking stuff...
local function uilib.clickAction

-- CRITICAL: This allows 'local uilib = require("uilib")' to work
return uilib
