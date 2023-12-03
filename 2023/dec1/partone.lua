local input = io.input("dec1/input.txt")
local sum = 0

while true do
  local s = io.read("*line")
  if (s == nil) then break end
  local digits = {}
  
  for char in s:gmatch"." do
    local to_num = tonumber(char)
    if (to_num ~= nil) then
      digits[#digits+1] = to_num
    end
  end
  
  sum = sum + (digits[1]*10+digits[#digits]*1)
end

print(sum)