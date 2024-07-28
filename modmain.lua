local modded  = GetModConfigData("ExtraDrop")
local player_tag = {"player"}


local function GetNumberOfNearbyPLayers(inst)
  local x,y,z = inst.Transform:GetWorldPosition()
  -- shoutout to DiogoW for helping me to figure this out
  local num_player = GLOBAL.TheSim:CountEntities(x,y,z, 25, player_tag)

  return num_player
end


local function AddExtraLoot(inst)
  if inst.components.lootdropper ~= nil then
    -- todo: generalized approach next
    inst.components.lootdropper:AddChanceLoot("deerclops_eyeball", 1)
  end
end


local function SetupLootFn(lootdropper)
  -- return a local instance of lootdropper, necessary for dynamic loot allocation (thx DiogoW)
  local inst = lootdropper.inst

  -- Calculate number of player nearby mob`s death position
  local num_player = GetNumberOfNearbyPLayers(inst)

  if num_player > 1 then

    -- if num_player = 1 then normal loot in applied
    for _ = 1, (num_player-1) do
      -- adding extra rare loot for the players around
        AddExtraLoot(inst)
    end

  end

end


local function AddMobCustomLoot(inst)

  if GLOBAL.TheWorld.ismastersim then
    -- Take a look into components.lootdropper.GenerateLoot() method
    inst.components.lootdropper:SetLootSetupFn(SetupLootFn)

  end

end

AddPrefabPostInit("deerclops", AddMobCustomLoot)