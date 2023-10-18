this.anatomists_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.anatomists";
		this.m.Name = "解剖学家";
		this.m.Description = "[p=c][img]gfx/ui/events/event_181.png[/img][/p][p]在他们无法抑制的求知欲驱动下，解剖学家们已经花费了数年时间用于剖析大陆上的各种邪崇异兽。然而，随着社会大众对他们的研究手段愈发排斥，他们最终找上了你，希望能够成立一家佣兵战团，以便为他们提供源源不断的新鲜样本。\n\n[color=#bcad8c]解剖学家：[/color] 以三名解剖学家开始游戏，启动资金相当充裕。\n[color=#bcad8c]研究者：[/color] 研究你所击倒的敌人的遗骸，并从中提取出用于强化你战团成员的宝贵知识和特殊药剂。\n[color=#bcad8c]并非战士：[/color] 你的所有战团成员将永远无法达到自信士气。[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 70;
		this.m.IsFixedLook = true;
	}

	function isValid()
	{
		return this.Const.DLC.Paladins;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"anatomist_background"
		]);
		bros[0].getBackground().m.RawDescription = "{队长？我称呼你队长可以吗？啊，当然可以。什么？不，我们没有用另外一个名字称呼你。您是一位出色的领袖，先生，我们不会冒险称呼您为一位跟我们同辈愚蠢的佣兵，或是说我们与拥有您这般技能的人做生意是在寻求什么样式的贸易。不，先生，我们不会。我们不是来自地狱的孩子，先生。}";
		bros[0].setPlaceInFormation(3);
		bros[0].m.Talents = [];
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = 1;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.RangedSkill] = 2;
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.equip(this.new("scripts/items/helmets/undertaker_hat"));
		items.equip(this.new("scripts/items/armor/undertaker_apron"));
		bros[1].setStartValuesEx([
			"anatomist_background"
		]);
		bros[1].getBackground().m.RawDescription = "{尽管别人犹豫不决，但我毫不犹豫地称呼您为队长。毕竟，您就是队长。一个无赖。一个雇佣兵之类的人，是吗？我认为，只有那些畏惧懦弱的人才会避免称呼你的真实身份。这种人不尊重你的智商，认为你自己不知道自己是谁。但是，您接受自己的身份，对于成为一个雇佣兵，您是一个很好的标本。我是说，一个雇佣兵。}";
		bros[1].setPlaceInFormation(4);
		bros[1].m.Talents = [];
		talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Hitpoints] = 2;
		talents[this.Const.Attributes.Initiative] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 1;
		items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.equip(this.new("scripts/items/helmets/physician_mask"));
		items.equip(this.new("scripts/items/armor/wanderers_coat"));
		items.equip(this.new("scripts/items/weapons/dagger"));
		bros[2].setStartValuesEx([
			"anatomist_background"
		]);
		bros[2].getBackground().m.RawDescription = "{虽然我们的日常对话无疑是平淡无奇的，但在这看似千篇一律的表面下，我不得不承认，我感觉到你内心里隐藏着一丝迟暮的野性，当我的话仿佛是火一般涌现时，就会显露出来。即使是我们最敷衍的谈话也让我有些紧张，因为你用那样憎恶的眼神盯着我。好吧，赏金猎人，要知道，我不是个双重标准者，我说话是认真的。你是个太出色的样本——我的意思是队长，不应该被一些阿底峰的砖头击中。明白了吗?}";
		bros[2].setPlaceInFormation(5);
		bros[2].m.Talents = [];
		talents = bros[2].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Bravery] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 3;
		talents[this.Const.Attributes.RangedDefense] = 3;
		items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.equip(this.new("scripts/items/helmets/masked_kettle_helmet"));
		items.equip(this.new("scripts/items/armor/reinforced_leather_tunic"));
		items.equip(this.new("scripts/items/weapons/militia_spear"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_beasts_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_greenskins_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_undead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_legendary_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/apotheosis_potion_item"));
		this.World.Statistics.getFlags().set("isNecromancerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isWiedergangerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isFallenHeroPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGeistPotionAcquired", false);
		this.World.Statistics.getFlags().set("isRachegeistPotionAcquired", false);
		this.World.Statistics.getFlags().set("isSkeletonWarriorPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHonorGuardPotionAcquired", false);
		this.World.Statistics.getFlags().set("isAncientPriestPotionAcquired", false);
		this.World.Statistics.getFlags().set("isNecrosavantPotionAcquired", false);
		this.World.Statistics.getFlags().set("isLorekeeperPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcYoungPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcWarriorPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcBerserkerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcWarlordPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinGruntPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinOverseerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinShamanPotionAcquired", false);
		this.World.Statistics.getFlags().set("isDirewolfPotionAcquired", false);
		this.World.Statistics.getFlags().set("isLindwurmPotionAcquired", false);
		this.World.Statistics.getFlags().set("isUnholdPotionAcquired", false);
		this.World.Statistics.getFlags().set("isWebknechtPotionAcquired", false);
		this.World.Statistics.getFlags().set("isNachzehrerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isAlpPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHexePotionAcquired", false);
		this.World.Statistics.getFlags().set("isSchratPotionAcquired", false);
		this.World.Statistics.getFlags().set("isSerpentPotionAcquired", false);
		this.World.Statistics.getFlags().set("isKrakenPotionAcquired", false);
		this.World.Statistics.getFlags().set("isIjirokPotionAcquired", false);
		this.World.Statistics.getFlags().set("isIfritPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHyenaPotionAcquired", false);
		this.World.Assets.m.Money = this.World.Assets.m.Money + 700;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3 && !randomVillage.isSouthern())
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(20);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.anatomists_scenario_intro");
		}, null);
	}

	function onActorKilled( _actor, _killer, _combatID )
	{
		if (this.Tactical.State.getStrategicProperties().IsArenaMode)
		{
			return;
		}

		local isLegendary = _actor.getType() == this.Const.EntityType.ZombieBoss || _actor.getType() == this.Const.EntityType.SkeletonLich || _actor.getType() == this.Const.EntityType.Kraken || _actor.getType() == this.Const.EntityType.TricksterGod;

		if (!isLegendary && _killer != null && _killer.getFaction() != this.Const.Faction.Player && _killer.getFaction() != this.Const.Faction.PlayerAnimals)
		{
			return;
		}

		switch(_actor.getType())
		{
		case this.Const.EntityType.Necromancer:
			this.World.Statistics.getFlags().set("shouldDropNecromancerPotion", true);
			break;

		case this.Const.EntityType.Zombie:
		case this.Const.EntityType.ZombieYeoman:
			this.World.Statistics.getFlags().set("shouldDropWiedergangerPotion", true);
			break;

		case this.Const.EntityType.ZombieKnight:
		case this.Const.EntityType.ZombieBetrayer:
			this.World.Statistics.getFlags().set("shouldDropFallenHeroPotion", true);
			break;

		case this.Const.EntityType.Ghost:
			this.World.Statistics.getFlags().set("shouldDropGeistPotion", true);
			break;

		case this.Const.EntityType.ZombieBoss:
			this.World.Statistics.getFlags().set("shouldDropRachegeistPotion", true);
			break;

		case this.Const.EntityType.SkeletonLight:
		case this.Const.EntityType.SkeletonMedium:
			this.World.Statistics.getFlags().set("shouldDropSkeletonWarriorPotion", true);
			break;

		case this.Const.EntityType.SkeletonHeavy:
			this.World.Statistics.getFlags().set("shouldDropHonorGuardPotion", true);
			break;

		case this.Const.EntityType.SkeletonPriest:
			this.World.Statistics.getFlags().set("shouldDropAncientPriestPotion", true);
			break;

		case this.Const.EntityType.Vampire:
			this.World.Statistics.getFlags().set("shouldDropNecrosavantPotion", true);
			break;

		case this.Const.EntityType.SkeletonLich:
			this.World.Statistics.getFlags().set("shouldDropLorekeeperPotion", true);
			break;

		case this.Const.EntityType.OrcYoung:
			this.World.Statistics.getFlags().set("shouldDropOrcYoungPotion", true);
			break;

		case this.Const.EntityType.OrcWarrior:
			this.World.Statistics.getFlags().set("shouldDropOrcWarriorPotion", true);
			break;

		case this.Const.EntityType.OrcBerserker:
			this.World.Statistics.getFlags().set("shouldDropOrcBerserkerPotion", true);
			break;

		case this.Const.EntityType.OrcWarlord:
			this.World.Statistics.getFlags().set("shouldDropOrcWarlordPotion", true);
			break;

		case this.Const.EntityType.GoblinAmbusher:
		case this.Const.EntityType.GoblinFighter:
		case this.Const.EntityType.GoblinWolfrider:
			this.World.Statistics.getFlags().set("shouldDropGoblinGruntPotion", true);
			break;

		case this.Const.EntityType.GoblinLeader:
			this.World.Statistics.getFlags().set("shouldDropGoblinOverseerPotion", true);
			break;

		case this.Const.EntityType.GoblinShaman:
			this.World.Statistics.getFlags().set("shouldDropGoblinShamanPotion", true);
			break;

		case this.Const.EntityType.Direwolf:
			this.World.Statistics.getFlags().set("shouldDropDirewolfPotion", true);
			break;

		case this.Const.EntityType.Lindwurm:
			this.World.Statistics.getFlags().set("shouldDropLindwurmPotion", true);
			break;

		case this.Const.EntityType.Unhold:
		case this.Const.EntityType.UnholdFrost:
		case this.Const.EntityType.UnholdBog:
		case this.Const.EntityType.BarbarianUnhold:
		case this.Const.EntityType.BarbarianUnholdFrost:
			this.World.Statistics.getFlags().set("shouldDropUnholdPotion", true);
			break;

		case this.Const.EntityType.Spider:
			this.World.Statistics.getFlags().set("shouldDropWebknechtPotion", true);
			break;

		case this.Const.EntityType.Ghoul:
			this.World.Statistics.getFlags().set("shouldDropNachzehrerPotion", true);
			break;

		case this.Const.EntityType.Alp:
			this.World.Statistics.getFlags().set("shouldDropAlpPotion", true);
			break;

		case this.Const.EntityType.Hexe:
			this.World.Statistics.getFlags().set("shouldDropHexePotion", true);
			break;

		case this.Const.EntityType.Schrat:
			this.World.Statistics.getFlags().set("shouldDropSchratPotion", true);
			break;

		case this.Const.EntityType.Kraken:
			this.World.Statistics.getFlags().set("shouldDropKrakenPotion", true);
			break;

		case this.Const.EntityType.TricksterGod:
			this.World.Statistics.getFlags().set("shouldDropIjirokPotion", true);
			break;

		case this.Const.EntityType.Serpent:
			this.World.Statistics.getFlags().set("shouldDropSerpentPotion", true);
			break;

		case this.Const.EntityType.SandGolem:
			this.World.Statistics.getFlags().set("shouldDropIfritPotion", true);
			break;

		case this.Const.EntityType.Hyena:
			this.World.Statistics.getFlags().set("shouldDropHyenaPotion", true);
			break;
		}
	}

	function onBattleWon( _combatLoot )
	{
		local buffs = [
			{
				acquiredFlagName = "isNecromancerPotionAcquired",
				discoveredFlagName = "isNecromancerPotionDiscovered",
				shouldDropFlagName = "shouldDropNecromancerPotion",
				itemName = "necromancer_potion_item"
			},
			{
				acquiredFlagName = "isWiedergangerPotionAcquired",
				discoveredFlagName = "isWiedergangerPotionDiscovered",
				shouldDropFlagName = "shouldDropWiedergangerPotion",
				itemName = "wiederganger_potion_item"
			},
			{
				acquiredFlagName = "isFallenHeroPotionAcquired",
				discoveredFlagName = "isFallenHeroPotionDiscovered",
				shouldDropFlagName = "shouldDropFallenHeroPotion",
				itemName = "fallen_hero_potion_item"
			},
			{
				acquiredFlagName = "isGeistPotionAcquired",
				discoveredFlagName = "isGeistPotionDiscovered",
				shouldDropFlagName = "shouldDropGeistPotion",
				itemName = "geist_potion_item"
			},
			{
				acquiredFlagName = "isRachegeistPotionAcquired",
				discoveredFlagName = "isRachegeistPotionDiscovered",
				shouldDropFlagName = "shouldDropRachegeistPotion",
				itemName = "rachegeist_potion_item"
			},
			{
				acquiredFlagName = "isSkeletonWarriorPotionAcquired",
				discoveredFlagName = "isSkeletonWarriorPotionDiscovered",
				shouldDropFlagName = "shouldDropSkeletonWarriorPotion",
				itemName = "skeleton_warrior_potion_item"
			},
			{
				acquiredFlagName = "isHonorGuardPotionAcquired",
				discoveredFlagName = "isHonorGuardPotionDiscovered",
				shouldDropFlagName = "shouldDropHonorGuardPotion",
				itemName = "honor_guard_potion_item"
			},
			{
				acquiredFlagName = "isAncientPriestPotionAcquired",
				discoveredFlagName = "isAncientPriestPotionDiscovered",
				shouldDropFlagName = "shouldDropAncientPriestPotion",
				itemName = "ancient_priest_potion_item"
			},
			{
				acquiredFlagName = "isNecrosavantPotionAcquired",
				discoveredFlagName = "isNecrosavantPotionDiscovered",
				shouldDropFlagName = "shouldDropNecrosavantPotion",
				itemName = "necrosavant_potion_item"
			},
			{
				acquiredFlagName = "isLorekeeperPotionAcquired",
				discoveredFlagName = "isLorekeeperPotionDiscovered",
				shouldDropFlagName = "shouldDropLorekeeperPotion",
				itemName = "lorekeeper_potion_item"
			},
			{
				acquiredFlagName = "isOrcYoungPotionAcquired",
				discoveredFlagName = "isOrcYoungPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcYoungPotion",
				itemName = "orc_young_potion_item"
			},
			{
				acquiredFlagName = "isOrcWarriorPotionAcquired",
				discoveredFlagName = "isOrcWarriorPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcWarriorPotion",
				itemName = "orc_warrior_potion_item"
			},
			{
				acquiredFlagName = "isOrcBerserkerPotionAcquired",
				discoveredFlagName = "isOrcBerserkerPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcBerserkerPotion",
				itemName = "orc_berserker_potion_item"
			},
			{
				acquiredFlagName = "isOrcWarlordPotionAcquired",
				discoveredFlagName = "isOrcWarlordPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcWarlordPotion",
				itemName = "orc_warlord_potion_item"
			},
			{
				acquiredFlagName = "isGoblinGruntPotionAcquired",
				discoveredFlagName = "isGoblinGruntPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinGruntPotion",
				itemName = "goblin_grunt_potion_item"
			},
			{
				acquiredFlagName = "isGoblinOverseerPotionAcquired",
				discoveredFlagName = "isGoblinOverseerPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinOverseerPotion",
				itemName = "goblin_overseer_potion_item"
			},
			{
				acquiredFlagName = "isGoblinShamanPotionAcquired",
				discoveredFlagName = "isGoblinShamanPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinShamanPotion",
				itemName = "goblin_shaman_potion_item"
			},
			{
				acquiredFlagName = "isDirewolfPotionAcquired",
				discoveredFlagName = "isDirewolfPotionDiscovered",
				shouldDropFlagName = "shouldDropDirewolfPotion",
				itemName = "direwolf_potion_item"
			},
			{
				acquiredFlagName = "isLindwurmPotionAcquired",
				discoveredFlagName = "isLindwurmPotionDiscovered",
				shouldDropFlagName = "shouldDropLindwurmPotion",
				itemName = "lindwurm_potion_item"
			},
			{
				acquiredFlagName = "isUnholdPotionAcquired",
				discoveredFlagName = "isUnholdPotionDiscovered",
				shouldDropFlagName = "shouldDropUnholdPotion",
				itemName = "unhold_potion_item"
			},
			{
				acquiredFlagName = "isWebknechtPotionAcquired",
				discoveredFlagName = "isWebknechtPotionDiscovered",
				shouldDropFlagName = "shouldDropWebknechtPotion",
				itemName = "webknecht_potion_item"
			},
			{
				acquiredFlagName = "isNachzehrerPotionAcquired",
				discoveredFlagName = "isNachzehrerPotionDiscovered",
				shouldDropFlagName = "shouldDropNachzehrerPotion",
				itemName = "nachzehrer_potion_item"
			},
			{
				acquiredFlagName = "isAlpPotionAcquired",
				discoveredFlagName = "isAlpPotionDiscovered",
				shouldDropFlagName = "shouldDropAlpPotion",
				itemName = "alp_potion_item"
			},
			{
				acquiredFlagName = "isHexePotionAcquired",
				discoveredFlagName = "isHexePotionDiscovered",
				shouldDropFlagName = "shouldDropHexePotion",
				itemName = "hexe_potion_item"
			},
			{
				acquiredFlagName = "isSchratPotionAcquired",
				discoveredFlagName = "isSchratPotionDiscovered",
				shouldDropFlagName = "shouldDropSchratPotion",
				itemName = "schrat_potion_item"
			},
			{
				acquiredFlagName = "isSerpentPotionAcquired",
				discoveredFlagName = "isSerpentPotionDiscovered",
				shouldDropFlagName = "shouldDropSerpentPotion",
				itemName = "serpent_potion_item"
			},
			{
				acquiredFlagName = "isKrakenPotionAcquired",
				discoveredFlagName = "isKrakenPotionDiscovered",
				shouldDropFlagName = "shouldDropKrakenPotion",
				itemName = "kraken_potion_item"
			},
			{
				acquiredFlagName = "isIjirokPotionAcquired",
				discoveredFlagName = "isIjirokPotionDiscovered",
				shouldDropFlagName = "shouldDropIjirokPotion",
				itemName = "ijirok_potion_item"
			},
			{
				acquiredFlagName = "isIfritPotionAcquired",
				discoveredFlagName = "isIfritPotionDiscovered",
				shouldDropFlagName = "shouldDropIfritPotion",
				itemName = "ifrit_potion_item"
			},
			{
				acquiredFlagName = "isHyenaPotionAcquired",
				discoveredFlagName = "isHyenaPotionDiscovered",
				shouldDropFlagName = "shouldDropHyenaPotion",
				itemName = "hyena_potion_item"
			}
		];

		foreach( buff in buffs )
		{
			if (!this.World.Statistics.getFlags().get(buff.acquiredFlagName) && this.World.Statistics.getFlags().get(buff.shouldDropFlagName))
			{
				this.World.Statistics.getFlags().set(buff.acquiredFlagName, true);
				this.World.Statistics.getFlags().set(buff.discoveredFlagName, true);
				_combatLoot.add(this.new("scripts/items/misc/anatomist/" + buff.itemName));
			}
		}
	}

	function onCombatFinished()
	{
		this.World.Statistics.getFlags().set("shouldDropNecromancerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropWiedergangerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropFallenHeroPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGeistPotion", false);
		this.World.Statistics.getFlags().set("shouldDropRachegeistPotion", false);
		this.World.Statistics.getFlags().set("shouldDropSkeletonWarriorPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHonorGuardPotion", false);
		this.World.Statistics.getFlags().set("shouldDropAncientPriestPotion", false);
		this.World.Statistics.getFlags().set("shouldDropNecrosavantPotion", false);
		this.World.Statistics.getFlags().set("shouldDropLorekeeperPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcYoungPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcWarriorPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcBerserkerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcWarlordPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinGruntPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinOverseerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinShamanPotion", false);
		this.World.Statistics.getFlags().set("shouldDropDirewolfPotion", false);
		this.World.Statistics.getFlags().set("shouldDropLindwurmPotion", false);
		this.World.Statistics.getFlags().set("shouldDropUnholdPotion", false);
		this.World.Statistics.getFlags().set("shouldDropWebknechtPotion", false);
		this.World.Statistics.getFlags().set("shouldDropNachzehrerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropAlpPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHexePotion", false);
		this.World.Statistics.getFlags().set("shouldDropSchratPotion", false);
		this.World.Statistics.getFlags().set("shouldDropSerpentPotion", false);
		this.World.Statistics.getFlags().set("shouldDropKrakenPotion", false);
		this.World.Statistics.getFlags().set("shouldDropIjirokPotion", false);
		this.World.Statistics.getFlags().set("shouldDropIfritPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHyenaPotion", false);
		return true;
	}

	function onGetBackgroundTooltip( _background, _tooltip )
	{
		_tooltip.push({
			id = 16,
			type = "text",
			icon = "ui/icons/morale.png",
			text = "永远不会达到自信士气"
		});
	}

});

