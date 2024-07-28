local modded  = GetModConfigData("ExtraDrop")
local player_tag = {"player"}

-- TODO: Entender como usar essa funcao para calcular corretamenta o numero de players
local function SetLootSetupFn(lootdropper)
  local inst = lootdropper.inst
end

local function GetNumberOfNearbyPLayers(inst)
  local x,y,z = inst.Transform:GetWorldPosition()
  -- shoutout to DiogoW for helping me to figure this out
  local num_player = GLOBAL.TheSim:CountEntities(x,y,z, 50, player_tag)

  return num_player
end

local function AddExtraLoot(inst)
  if inst.components.lootdropper ~= nil then
    -- todo: generalized approach next
    inst.components.lootdropper:AddChanceLoot("deerclops_eyeball", 1)
  end
end

local function AddMobCustomLoot(inst)

  if GLOBAL.TheWorld.ismastersim then

    local num_player = GetNumberOfNearbyPLayers(inst)

    if num_player > 1 then
      -- if num_player = 1 then normal loot in applied
      for _ = 1, (num_player-1) do
        -- adding extra rare loot for the players around
          AddExtraLoot(inst)
      end
    end
  end
end

AddPrefabPostInit("deerclops", AddMobCustomLoot)