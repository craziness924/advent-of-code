io.input("dec1/input.txt")

local numbersDic = {
  one = 1,
  two = 2,
  three = 3,
  four = 4,
  five = 5,
  six = 6,
  seven = 7,
  eight = 8,
  nine = 9,
} 

local numbersArr = {
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine"
}

local sum = 0

while true do
  local s = io.read("*line")
  if (s == nil) then 
    break 
  end
  
  local rewritten = ""
  -- first replace any digits with their corresponding word
  for k, v in ipairs(numbersArr) do
    s = s:gsub(k, v)
  end
  
  -- now iterate through the string, if a word starts the string then add its digit to the new rewritten string
  for i=1, s:len() do
    local substr = s.sub(s, i)
    for k, v in pairs(numbersDic) do
      local startIndex, _ = string.find(substr, k)
      if (startIndex == 1) then
        rewritten = rewritten..v
      end
    end
  end
  
  -- finally, we can re-use our solution from part one
  local digits = {}
  for char in rewritten:gmatch"." do
    local to_num = tonumber(char)
    if (to_num ~= nil) then
      digits[#digits+1] = to_num
    end
  end
  
  sum = sum + (digits[1]*10+digits[#digits]*1)
  
end

io.close()

print(sum)

-- graveyard of bad ideas follow

  -- now calculate it on the new string
  --[[
  local digits = {}
  for char in b:gmatch"." do
    word = word..char
    if (numbersDic[word] ~= nil) then
      digits[#digits+1] = numbersDic[word]
      
      local word_copy = word
      word = ""
      if (potentialOverlaps[word_copy]) then
        word = word..char
      end 
    end
  end
  print (digits[1]*10+digits[#digits]*1)
  sum = sum + (digits[1]*10+digits[#digits]*1)
  print(sum) ]]

--[[
      s = s:gsub(word, "")
      if (potentialOverlaps[word] ~= nil) then
        s = char..s
      end
      s = numbers[word]..s
      word = ""
      word = word..char
]]