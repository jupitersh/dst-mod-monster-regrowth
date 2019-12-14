name = "Monster Regrowth"
description = ""
author = ""
version = "1.1"

forumthread = ""

api_version = 10

all_clients_require_mod = false
client_only_mod = false
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

----------------------
-- General settings --
----------------------

countoption = {}

for i=0,100 do
	countoption[#countoption + 1] = {
		description = i*5,
		data = i*5,
	}
end

configuration_options = {}

local function AddCount(name, label, df)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = countoption,
		default = df,
	}
end

AddCount("wasphive", "Wasphive", 20)
AddCount("houndmound", "Houndmound", 20)
AddCount("pighouse", "Pighouse", 20)
AddCount("mermhouse", "Mermhouse", 20)
AddCount("spiderden", "Spiderden", 50)
AddCount("tallbirdnest", "Tallbirdnest", 20)
AddCount("tentacle", "Tentacle", 300)
AddCount("beefalo", "Beefalo", 15)
AddCount("lightninggoat", "Lightninggoat", 10)
AddCount("knight", "Knight", 15)
AddCount("bishop", "Bishop", 15)
AddCount("rook", "Rook", 15)
AddCount("catcoonden", "Catcoon Den", 10)