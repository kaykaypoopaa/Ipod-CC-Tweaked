-- THIS CODE IS NOT LABELED FOR INDIVIDUAL USE.
local function RunIpod()
  shell.run("cd ipodsys")
  shell.run("ipodmenu.lua")
end

local function ListenForTerm()
  while true do
    local event = os.pullEventRaw()
    if event == "terminate" then
      os.shutdown()
    end
  end
end

parallel.waitForAny(RunIpod, ListenForTerm)
