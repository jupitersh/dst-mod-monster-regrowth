local battle = "󰀘"
local grave = "󰀊"
local ghost ="󰀉"

local prefabs = {
	"wasphive",
	"houndmound",
	"pighouse",
	"mermhouse",
	"spiderden",
	"tallbirdnest",
	"tentacle",
	"beefalo",
	"lightninggoat",
	"knight",
	"bishop",
	"rook",
	"catcoonden",
}

local tilefns = {}
tilefns.wasphive = function(tile) return (tile == GROUND.GRASS) end
tilefns.houndmound = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.pighouse = function(tile) return (tile == GROUND.GRASS or tile == GROUND.FOREST or tile == GROUND.DECIDUOUS) end
tilefns.mermhouse = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.spiderden = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.tallbirdnest = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT) end
tilefns.tentacle = function(tile) return (tile == GROUND.MARSH) end
tilefns.beefalo = function(tile) return (tile == GROUND.SAVANNA) end
tilefns.lightninggoat = function(tile) return (tile == GROUND.DIRT or tile == GROUND.DESERT_DIRT) end
tilefns.knight = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.bishop = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.rook = function(tile) return (tile == GROUND.ROCKY or tile == GROUND.FOREST or tile == GROUND.MARSH or tile == GROUND.GRASS or tile == GROUND.SAVANNA or tile == GROUND.DIRT or tile == GROUND.DECIDUOUS or tile == GROUND.DESERT_DIRT) end
tilefns.catcoonden = function(tile) return (tile == GROUND.DECIDUOUS) end


function c_countprefabsonground(prefab, noprint)
	local count = 0
	for k, v in pairs(Ents) do
		local owner = v.components.inventoryitem and v.components.inventoryitem.owner
		if owner == nil then
			if v.prefab == prefab then
				count = count + 1
			end
		end
	end
	if not noprint then
		print("There are ", count, prefab.."s in the world's ground.")
	end
	return count
end

local function TrySpawn(strfab)
	local pt = Vector3(math.random(-1000, 1000), 0, math.random(-1000, 1000))
	local tile = TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
	local canspawn = tile ~= GROUND.IMPASSABLE and tile ~= GROUND.INVALID and tile ~= 255
	local tilecheck = tilefns[strfab]
	canspawn = canspawn and tilecheck(tile)
	if canspawn then
		print(strfab, "spawned!")
		local b = SpawnPrefab(strfab)
		b.Transform:SetPosition(pt:Get())
	else
		TrySpawn(strfab)
	end
end

local function wasphive_spawner()
		local min_num = TUNING.MG.wasphive
		local count = c_countprefabsonground("wasphive", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("wasphive")
			end
		end
end

local function houndmound_spawner()
		local min_num = TUNING.MG.houndmound
		local count = c_countprefabsonground("houndmound", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("houndmound")
			end
		end
end

local function pighouse_spawner()
		local min_num = TUNING.MG.pighouse
		local count = c_countprefabsonground("pighouse", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("pighouse")
			end
		end
end

local function mermhouse_spawner()
		local min_num = TUNING.MG.mermhouse
		local count = c_countprefabsonground("mermhouse", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("mermhouse")
			end
		end
end

local function spiderden_spawner()
		local min_num = TUNING.MG.spiderden
		local count = c_countprefabsonground("spiderden", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("spiderden")
			end
		end
end

local function tallbirdnest_spawner()
		local min_num = TUNING.MG.tallbirdnest
		local count = c_countprefabsonground("tallbirdnest", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("tallbirdnest")
			end
		end
end

local function tentacle_spawner()
		local min_num = TUNING.MG.tentacle
		local count = c_countprefabsonground("tentacle", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("tentacle")
			end
		end
end

local function beefalo_spawner()
		local min_num = TUNING.MG.beefalo
		local count = c_countprefabsonground("beefalo", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("beefalo")
			end
		end
end

local function lightninggoat_spawner()
		local min_num = TUNING.MG.lightninggoat
		local count = c_countprefabsonground("lightninggoat", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("lightninggoat")
			end
		end
end

local function knight_spawner()
		local min_num = TUNING.MG.knight
		local count = c_countprefabsonground("knight", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("knight")
			end
		end
end

local function bishop_spawner()
		local min_num = TUNING.MG.bishop
		local count = c_countprefabsonground("bishop", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("bishop")
			end
		end
end

local function rook_spawner()
		local min_num = TUNING.MG.rook
		local count = c_countprefabsonground("rook", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("rook")
			end
		end
end

local function catcoonden_spawner()
		local min_num = TUNING.MG.catcoonden
		local count = c_countprefabsonground("catcoonden", true)
		local numtospawn = min_num - count
		if numtospawn > 0 then
			for i = 1, numtospawn, 1 do
				TrySpawn("catcoonden")
			end
		end
end

local MonsterSpawner = Class(function(self, inst)
	self.inst = inst

	inst:ListenForEvent("cycleschanged", function()
		local count_50days = TheWorld.state.cycles/50
		if math.floor(count_50days) == count_50days then --try spawn prefabs every 50 days
			wasphive_spawner()
			houndmound_spawner()
			pighouse_spawner()
			mermhouse_spawner()
			spiderden_spawner()
			tallbirdnest_spawner()
			tentacle_spawner()
			beefalo_spawner()
			lightninggoat_spawner()
			knight_spawner()
			bishop_spawner()
			rook_spawner()
			catcoonden_spawner()
		else
			print("!!!Monster Regrowth: It's Not the Time!!!")
		end
	end)
end)

return MonsterSpawner