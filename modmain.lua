local modded_amount = GetModConfigData("ExtraDrop")

--[[
  todo: 
    - Skipar caso seja default
    - definir table de mobs >>> loot prime
    - null checker da loot table de cada mob
    - AddChanceLoot por iteracao
    - AddChanceLoot por qtd de player perto
    - idea: random pra cada qtd adicionada
]]

local function AddExtraLoot(inst)
  if inst.components.lootdropper ~= nil then
    for _ = 1, modded_amount do
      inst.components.lootdropper:AddChanceLoot("deerclops_eyeball", 1) -- todo: generalized approach next
    end
  end
end

-- for _ = 1, modded_amount do
-- for k,v in pairs(modcreature) do
AddPrefabPostInit("deerclops", AddExtraLoot)
-- end
--end

-- DiogoW comment: (thx LeonidasIV)
-- One can utilize lootsetupfn in scripts/lootdroper.lua file for on event loot changing