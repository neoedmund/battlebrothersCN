this.large_steppe_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"沃伦费斯特",
			"克劳赫菲斯特",
			"埃尔拉赫要塞",
			"特莱滕要塞",
			"通费斯特",
			"罗滕菲斯特",
			"太阳堡垒",
			"锡格费斯特",
			"苏德菲斯特",
			"苏德费斯特",
			"斯特劳希费斯特",
			"玛德菲斯特",
			"卡格费斯特",
			"多尼恩堡",
			"格尔布费斯特",
			"光明节",
			"海伦堡",
			"格兰兹费斯特",
			"斯特拉尔费斯特",
			"国王要塞",
			"坚骨",
			"德费斯特",
			"沙暴要塞",
			"格尔布费尔斯特",
			"罗斯坦费斯特",
			"戈德费斯特",
			"锋齿堡",
			"布兰德费斯特",
			"防尘",
			"奥德费斯特",
			"鹰巢要塞"
		]);
		this.m.DraftList = [
			"apprentice_background",
			"beggar_background",
			"bowyer_background",
			"brawler_background",
			"caravan_hand_background",
			"caravan_hand_background",
			"caravan_hand_background",
			"gambler_background",
			"gravedigger_background",
			"hunter_background",
			"hunter_background",
			"juggler_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"flagellant_background",
			"ratcatcher_background",
			"refugee_background",
			"servant_background",
			"tailor_background",
			"vagabond_background",
			"witchhunter_background",
			"adventurous_noble_background",
			"adventurous_noble_background",
			"adventurous_noble_background",
			"bastard_background",
			"deserter_background",
			"deserter_background",
			"raider_background",
			"raider_background",
			"retired_soldier_background",
			"retired_soldier_background",
			"sellsword_background",
			"sellsword_background",
			"sellsword_background",
			"swordmaster_background",
			"hedge_knight_background",
			"paladin_background"
		];

		if (this.Const.DLC.Desert)
		{
			this.m.DraftList.push("eunuch_southern_background");
		}

		this.m.UIDescription = "一座雄伟的城堡耸立在周围草原之上";
		this.m.Description = "这座雄伟的城堡高耸于周围草原之上，是该地区的权力中心。它拥有庞大的驻军，为旅行者和雇佣兵提供各种有价值的服务。";
		this.m.UIBackgroundCenter = "ui/settlements/stronghold_03";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_03_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_03_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_cobblestone";
		this.m.UISprite = "ui/settlement_sprites/stronghold_03.png";
		this.m.Sprite = "world_stronghold_03";
		this.m.Lighting = "world_stronghold_03_light";
		this.m.Rumors = this.Const.Strings.RumorsSteppeSettlement;
		this.m.Culture = this.Const.World.Culture.Neutral;
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
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));

		if (this.Math.rand(1, 100) <= 50 || this.Const.World.Buildings.Fletchers == 0)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
		}
		else
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
		}

		if (this.Math.rand(1, 100) <= 70)
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
			], [], 5, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Hills
			], [], 1, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 5, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Hills
			], [], 1, true);
		}

		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fletchers_hut_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Hills
		], []);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Hills
		], []);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Hills
		], []);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/workshop_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Hills
		], []);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/goat_herd_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Hills
		], []);
	}

});

