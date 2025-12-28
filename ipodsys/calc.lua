print("welcome to the calculator")
sleep(0.2)
term.clear()
term.setCursorPos(1, 1)
print("enter first number")
local a = read()
term.clear()
term.setCursorPos(1, 1)
print("enter operator")
local op = read()
term.clear()
term.setCursorPos(1, 1)
print("enter second number")
local b = read()
term.clear()
term.setCursorPos(1, 1)
if op == "+" then
print(a + b)
elseif op == "-" then
print(a - b)
elseif op == "*" then
print(a * b)
elseif op == "/" then
print(a / b)
end
