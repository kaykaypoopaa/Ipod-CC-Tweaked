print("Welcome to the calculator")
sleep(0.4)
term.clear()
term.setCursorPos(1, 1)
print("Enter first number")
local a = read()
term.clear()
term.setCursorPos(1, 1)
print("Enter operator")
local op = read()
term.clear()
term.setCursorPos(1, 1)
print("Enter second number")
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
sleep(3)
end
read()
