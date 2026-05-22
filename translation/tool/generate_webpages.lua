local lcmark = require("lcmark")

local file = io.open("translation/src/template.html", "r")
local template = file:read("a")
file:close()

-- index

local lang = "en"
local title = "Translations for the CommonMark Spec"
local file = io.open("translation/src/index.html", "r")
local body = file:read("a")
file:close()
local html = template:gsub("%$lang%$", lang)
   :gsub("%$title%$", title)
   :gsub("%$body%$", body)
local file = io.open("translation/tmp/index.html", "w")
file:write(html)
file:close()

-- readme

local lang = "ja"
local title = "Translation for the commonmark-spec readme"
local file = io.open("translation/build/ja/README.md", "r")
local body = lcmark.convert(file:read("a"), "html", {})
file:close()
local html = template:gsub("%$lang%$", lang)
   :gsub("%$title%$", title)
   :gsub("%$body%$", body)
local file = io.open("translation/tmp/readme.ja.html", "w")
file:write(html)
file:close()
