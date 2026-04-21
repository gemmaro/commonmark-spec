local lyaml = require('lyaml')

local input = io.read('a')
local doc = lyaml.load(input)
local refs = {}
for key, value in pairs(doc) do
   table.insert(refs, {id = value, en = key, ja = key})
end
local output = lyaml.dump({refs})
print(output)
