this.waterwheel_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "旁边有石头房子的小水磨。 好像有某种强大的人物住在这里。";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.waterwheel";
		this.m.LocationType = this.Const.World.LocationType.Unique;
		this.m.IsShowingDefenders = true;
		this.m.IsShowingBanner = false;
		this.m.VisibilityMult = 0.9;
		this.m.Resources = 500;
		this.m.OnEnter = "event.location.waterwheel_enter";
	}

	function onSpawned()
	{
		this.m.Name = "水磨";
		this.location.onSpawned();
		this.Const.World.Common.addTroop(this, {
			Type = this.Const.World.Spawn.Troops.ZombieBoss
		}, false);

		for( local i = 0; i < 2; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard
			}, false);
		}

		for( local i = 0; i < 9; i = ++i )
		{
			this.Const.World.Common.addTroop(this, {
				Type = this.Const.World.Spawn.Troops.ZombieBetrayer
			}, false);
		}
	}

	function onDiscovered()
	{
		this.location.onDiscovered();
		this.World.Flags.increment("LegendaryLocationsDiscovered", 1);

		if (this.World.Flags.get("LegendaryLocationsDiscovered") >= 10)
		{
			this.updateAchievement("FamedExplorer", 1, 1);
		}
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("world_water_mill");
	}

	function onDeserialize( _in )
	{
		this.location.onDeserialize(_in);
	}

});

