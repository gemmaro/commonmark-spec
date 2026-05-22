local lyaml = require('lyaml')

local input = io.read('a')
local doc = lyaml.load(input)
local refs = {}
for _index, entry in ipairs(doc) do
   -- entry has en, id, and target_language
   target = entry["target_language"]
   if refs[target] then
      error("duplicated entry") -- TODO: add more debug info
   end
   refs[target] = entry["id"]
end
local output = lyaml.dump({refs})
print(output)
