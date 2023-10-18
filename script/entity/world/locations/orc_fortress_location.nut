this.orc_fortress_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "一座巨大的要塞，由巨大的铁木原木制成，上面覆盖着部落战争的绘画。从远处可以听到兽人在墙后发出的嗜血的呼喊声。";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.orc_fortress";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.CombatLocation.Template[0] = "tactical.orc_camp";
		this.m.CombatLocation.Fortification = this.Const.Tactical.FortificationType.None;
		this.m.CombatLocation.CutDownTrees = true;
		this.m.IsShowingDefenders = false;
		this.m.IsShowingBanner = true;
		this.m.IsDespawningDefenders = false;
		this.m.Resources = 500;
		this.m.NamedWeaponsList = this.Const.Items.NamedOrcWeapons;
		this.m.NamedShieldsList = this.Const.Items.NamedOrcShields;
	}

	function onSpawned()
	{
		this.m.Name = "军阀要塞";
		this.location.onSpawned();

		for( local i = 0; i < 16; i = ++i )
		{
			this.Const.World.Common.addTroop(this, this.Const.World.Spawn.Troops.OrcYoung, false);
		}

		for( local i = 0; i < 8; i = ++i )
		{
			this.Const.World.Common.addTroop(this, this.Const.World.Spawn.Troops.OrcBerserker, false);
		}

		for( local i = 0; i < 15; i = ++i )
		{
			this.Const.World.Common.addTroop(this, this.Const.World.Spawn.Troops.OrcWarrior, false);
		}

		for( local i = 0; i < 3; i = ++i )
		{
			this.Const.World.Common.addTroop(this, this.Const.World.Spawn.Troops.OrcWarlord, false);
		}
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropArmorParts(this.Math.rand(25, 50), _lootTable);
		this.dropMedicine(this.Math.rand(0, 6), _lootTable);
		this.dropFood(this.Math.rand(4, 8), [
			"strange_meat_item"
		], _lootTable);
		this.dropTreasure(this.Math.rand(3, 4), [
			"trade/furs_item",
			"trade/furs_item",
			"trade/uncut_gems_item",
			"trade/dies_item",
			"loot/white_pearls_item"
		], _lootTable);
		_lootTable.push(this.new("scripts/items/helmets/legendary/emperors_countenance"));
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("world_orc_camp_04");
	}

});

