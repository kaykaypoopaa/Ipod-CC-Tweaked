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

local localversion = "1.0"
local file = shell.run("wget https://raw.githubusercontent.com/kaykaypoopaa/Ipod-CC-Tweaked/refs/heads/main/version.txt version.txt")
file.readLine()
if file >= localversion then
  print("Do you want to update? (y/n)")
  local updatereq = read()
elseif updatereq == y then
  shell.run(updater.lua)
elseif updatereq == n then
end
parallel.waitForAny(RunIpod, ListenForTerm)
