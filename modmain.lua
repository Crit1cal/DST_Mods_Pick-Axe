PrefabFiles = {

	"pickaxe",
}

Assets = {
	Asset( "ATLAS", "images/pickaxe.xml" ),
	Asset("IMAGE", "images/pickaxe.tex"), 
	Asset("ANIM", "anim/pickaxe.zip"),
	Asset("ANIM", "anim/swap_pickaxe.zip"),
}

local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local TheWorld = GLOBAL.TheWorld
local ACTIONS=GLOBAL.ACTIONS
local FUELTYPE=GLOBAL.FUELTYPE
local SpawnPrefab=GLOBAL.SpawnPrefab
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS



 AddPrefabPostInit("pickaxe",function(inst)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)
    inst.components.weapon:SetRange(1.1,1.1)
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(250)
    inst.components.finiteuses:SetUses(250)  
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.CHOP, 2)
    inst.components.tool:SetAction(ACTIONS.MINE, 2)
    if inst.components.equippable then inst.components.equippable.walkspeedmult =1.25 end
	local function onattack(weapon, attacker, target)
	if attacker then
	    if attacker.components.health then
		    attacker.components.health:DoDelta(0)
		end
	end
	if attacker then
	    if attacker.components.sanity then
		    attacker.components.sanity:DoDelta(0)
		end
	end
    end
    inst.components.weapon:SetOnAttack(onattack)
end)



AddRecipe("pickaxe", {Ingredient("flint", 6),Ingredient("twigs", 4),Ingredient("rope", 2)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/pickaxe.xml", "pickaxe.tex" )
STRINGS.NAMES.PICKAXE="Pick Axe"
STRINGS.CHARACTERS.GENERIC.PICKAXE ="IT IS PICK AXE!!!"
STRINGS.RECIPE_PICKAXE= "Pick Axe"
STRINGS.RECIPE_DESC.PICKAXE= "not a pickaxe or axe"

