local lyaml = require('lyaml')

local input = io.read('a')
local doc = lyaml.load(input)
local refs = {}
for _index, entry in ipairs(doc) do
   -- entry has en, id, and ja
   ja = entry["ja"]
   if refs[ja] then
      error("duplicated entry") -- TODO: add more debug info
   end
   refs[ja] = entry["id"]
end
local output = lyaml.dump({refs})
print(output)
