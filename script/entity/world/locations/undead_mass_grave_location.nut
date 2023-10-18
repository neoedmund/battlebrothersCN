this.undead_mass_grave_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "一场残酷的战争、一场疫情或其他灾难留下的悲惨遗骸。 幸存者们挖了一个大洞并把所有的尸体堆在一起，以便快速清理掉它们。";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.undead_mass_grave";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.CombatLocation.Template[0] = "tactical.ruins";
		this.m.CombatLocation.Fortification = this.Const.Tactical.FortificationType.None;
		this.m.CombatLocation.CutDownTrees = false;
		this.m.CombatLocation.ForceLineBattle = true;
		this.m.CombatLocation.AdditionalRadius = 5;
		this.setDefenderSpawnList(this.Const.World.Spawn.UndeadArmy);
		this.m.NamedWeaponsList = this.Const.Items.NamedUndeadWeapons;
		this.m.NamedShieldsList = this.Const.Items.NamedUndeadShields;
		this.m.Resources = 200;
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.MassGrave);
		this.location.onSpawned();
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropMoney(this.Math.rand(200, 500), _lootTable);
		this.dropArmorParts(this.Math.rand(0, 40), _lootTable);
		this.dropAmmo(this.Math.rand(0, 20), _lootTable);
		local treasure = [
			"loot/silverware_item",
			"loot/silver_bowl_item",
			"loot/signet_ring_item",
			"loot/golden_chalice_item",
			"loot/ancient_gold_coins_item"
		];

		if (this.Const.DLC.Unhold)
		{
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.push("armor_upgrades/metal_plating_upgrade");
			treasure.push("armor_upgrades/metal_pauldrons_upgrade");
			treasure.push("armor_upgrades/mail_patch_upgrade");
			treasure.push("armor_upgrades/leather_shoulderguards_upgrade");
			treasure.push("armor_upgrades/leather_neckguard_upgrade");
			treasure.push("armor_upgrades/joint_cover_upgrade");
			treasure.push("armor_upgrades/heraldic_plates_upgrade");
			treasure.push("armor_upgrades/double_mail_upgrade");
		}

		this.dropTreasure(this.Math.rand(0, 1), treasure, _lootTable);
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		local isSouthern = this.getTile().Type == this.Const.World.TerrainType.Desert || this.getTile().Type == this.Const.World.TerrainType.Steppe || this.getTile().Type == this.Const.World.TerrainType.Oasis || this.getTile().TacticalType == this.Const.World.TerrainTacticalType.DesertHills;

		if (isSouthern && this.Const.DLC.Desert)
		{
			body.setBrush("world_mass_grave_02");
			this.m.CombatLocation.Template[0] = "tactical.southern_ruins";
		}
		else
		{
			body.setBrush("world_mass_grave_01");
		}
	}

});

