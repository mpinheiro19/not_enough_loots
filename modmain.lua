local modded_amount = GetModConfigData("ExtraDrop")
-- Para debugging
local numPlayers = modded_amount

local function AddExtraLoot(inst)
  if inst.components.lootdropper ~= nil then
    inst.components.lootdropper:AddChanceLoot("deerclops_eyeball", 1) -- todo: generalized approach next
  end
end

local function SetupLootFn(inst)
  -- Checa pelos players proximos e adiciona o loot, usando AddChanceLoot por exemplo.

  -- TODO: Calcular dinamicamente numPlayers no momento de setar o Loot
  -- TODO: Checa se Deerclops morreu antes de adicionar o loot
  for _ = 1, numPlayers do
    AddExtraLoot(inst)
  end
end

AddPrefabPostInit("deerclops", SetupLootFn)