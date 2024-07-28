local modded  = GetModConfigData("ExtraDrop")
local player_tag = {"player"}

local function SetLootSetupFn(lootdropper)
  local inst = lootdropper.inst
end

local function AddExtraLoot(inst)
  if inst.components.lootdropper ~= nil then
    -- todo: generalized approach next
    inst.components.lootdropper:AddChanceLoot("deerclops_eyeball", 1)
  end
end

local function AddMobCustomLoot(inst)

  if GLOBAL.TheWorld.ismastersim then

    local x,y,z = inst.Transform:GetWorldPosition()
    -- shoutout to DiogoW for helping me to figure this out
    local num_player = GLOBAL.TheSim:CountEntities(x,y,z, 30, player_tag)

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