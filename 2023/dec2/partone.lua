local LIMITS = {
  red = 12,
  green = 13,
  blue = 14,
}


local sum = 0

for line in io.lines("dec2/input.txt") do
  local startIndex = string.find(line, " ")
  local index, endIndex = string.find(line, ":")
  local game_id = string.sub(line, startIndex+1, endIndex-1)
  local possible = true

  line = line:sub(endIndex+2)
  local round_index = endIndex+3

  local got_num = false

  local buffer = {}
  local number = 0
  local colour = ""
  local justAfterSemiColon

  for c in line:gmatch"." do
    local to_num = tonumber(c)
    if c == "," or c == ";" then
      got_num = false
      got_letter = false
    
      local limit = LIMITS[colour]
      if (number > limit) then
        possible = false
        break
      end
      print(number,"<", limit, line)
      
      colour = ""
      buffer = {}
      if c == ";" then
        justAfterSemiColon = true
      end
    elseif justAfterSemiColon then
      justAfterSemiColon = false
    elseif c == " " then
      
    elseif (to_num == nil) then

      if (not got_num) then
        -- bad idea
        if (#buffer > 2) then 
          number = 99999999
        elseif (#buffer == 2) then
          number = buffer[1]*10 + buffer[2]*1
        else 
          number = buffer[1]
        end
      end

      got_num = true
      
      if (c ~= " ") then
        colour = colour..c
      end
    elseif (not got_num) then
      buffer[#buffer+1] = to_num
    end
  end
  print("Game "..game_id..": "..tostring(possible))

  if (possible) then
    sum = sum + game_id
  end
end

print(sum)

