this.large_snow_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"桐德堡",
			"洪堡",
			"格林博格",
			"赫勒堡",
			"卡尔克堡",
			"吕德斯堡",
			"洪斯堡",
			"松马斯堡",
			"布拉明堡",
			"瓦尔德堡",
			"诺尔堡",
			"伯克堡",
			"雷神堡",
			"唐堡",
			"海尔维克堡垒",
			"托尔瓦堡",
			"斯科尔博格",
			"艾兹维克堡",
			"哈尔斯堡",
			"格尔堡",
			"冈伯格",
			"阿森堡",
			"哈马堡",
			"斯内克堡",
			"格罗讷堡",
			"兰博尔格",
			"维内堡",
			"洪堡",
			"瓦尔堡",
			"昆斯堡",
			"扎尔斯堡"
		]);
		this.m.DraftList = [
			"apprentice_background",
			"brawler_background",
			"daytaler_background",
			"gravedigger_background",
			"graverobber_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"ratcatcher_background",
			"refugee_background",
			"servant_background",
			"vagabond_background",
			"vagabond_background",
			"wildman_background",
			"wildman_background",
			"wildman_background",
			"witchhunter_background",
			"witchhunter_background",
			"adventurous_noble_background",
			"deserter_background",
			"deserter_background",
			"disowned_noble_background",
			"disowned_noble_background",
			"hedge_knight_background",
			"hedge_knight_background",
			"raider_background",
			"raider_background",
			"raider_background",
			"retired_soldier_background",
			"retired_soldier_background",
			"sellsword_background",
			"squire_background",
			"cripple_background",
			"paladin_background"
		];

		if (this.Const.DLC.Unhold)
		{
			this.m.DraftList.push("beast_hunter_background");
		}

		this.m.UIDescription = "这座大城堡在无尽的雪上显得很宽";
		this.m.Description = "这个宏大的城堡俯瞰着无尽的雪野，是抵御来自极北的威胁的坚固堡垒。随着多年来人们涌入城堡，其周围的许多房屋和作坊现在也为周边地区的旅行者、雇佣兵和冒险家提供庇护和补给。";
		this.m.UIBackgroundCenter = "ui/settlements/stronghold_03_snow";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_03_left_snow";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_03_right_snow";
		this.m.UIRampPathway = "ui/settlements/ramp_01_cobblestone";
		this.m.UISprite = "ui/settlement_sprites/stronghold_03.png";
		this.m.Sprite = "world_stronghold_03";
		this.m.Lighting = "world_stronghold_03_light";
		this.m.Rumors = this.Const.Strings.RumorsSnowSettlement;
		this.m.Culture = this.Const.World.Culture.Northern;
		this.m.IsMilitary = true;
		this.m.Size = 3;
		this.m.HousesType = 3;
		this.m.HousesMin = 3;
		this.m.HousesMax = 4;
		this.m.AttachedLocationsMax = 5;
	}

	function onBuild()
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));

		if (this.Math.rand(1, 100) <= 60)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));
		}
		else
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
		}

		if (this.Math.rand(1, 100) <= 40)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
		}

		if (this.Math.rand(1, 100) <= 40)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/trapper_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 2);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/trapper_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 2);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Hills
		]);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [
			this.Const.World.TerrainType.Tundra
		]);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/hunters_cabin_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [], 0, false, true);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fletchers_hut_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [], 0, false, true);
	}

});

