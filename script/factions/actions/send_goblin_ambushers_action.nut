this.send_goblin_ambushers_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "send_goblin_ambushers_action";
		this.m.Cooldown = 30.0;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		if (this.World.getTime().Days <= 5)
		{
			return;
		}

		local settlements = _faction.getSettlements();

		if (settlements.len() < 7)
		{
			return;
		}

		if (this.World.FactionManager.isGreenskinInvasion() && this.World.FactionManager.getGreaterEvilStrength() >= 10.0)
		{
			if (_faction.getUnits().len() >= 7)
			{
				return;
			}
		}
		else if (_faction.getUnits().len() >= 5)
		{
			return;
		}

		local allowed = false;

		foreach( s in _faction.getSettlements() )
		{
			if (s.getLastSpawnTime() + 300.0 > this.Time.getVirtualTimeF())
			{
				continue;
			}

			allowed = true;
			break;
		}

		if (!allowed)
		{
			return;
		}

		this.m.Score = 10;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local settlements = [];

		foreach( s in _faction.getSettlements() )
		{
			if (s.getLastSpawnTime() + 300.0 > this.Time.getVirtualTimeF())
			{
				continue;
			}

			settlements.push({
				D = s,
				P = 10
			});
		}

		local settlement = this.pickWeightedRandom(settlements);
		settlement.setLastSpawnTimeToNow();
		local mult = this.World.FactionManager.isGreenskinInvasion() ? 1.1 : 1.0;
		local party = this.getFaction().spawnEntity(settlement.getTile(), "地精掠袭者", false, this.Const.World.Spawn.GoblinRaiders, this.Math.rand(75, 120) * this.getReputationToDifficultyLightMult() * mult);
		party.getSprite("banner").setBrush(settlement.getBanner());
		party.setDescription("一群淘气的地精，小而狡猾，不可低估。");
		party.setFootprintType(this.Const.World.FootprintsType.Goblins);
		party.getFlags().set("IsRandomlySpawned", true);
		party.getLoot().ArmorParts = this.Math.rand(0, 10);
		party.getLoot().Medicine = this.Math.rand(0, 3);
		party.getLoot().Ammo = this.Math.rand(10, 30);

		if (this.Math.rand(1, 100) <= 75)
		{
			local loot = [
				"supplies/strange_meat_item",
				"supplies/roots_and_berries_item",
				"supplies/pickled_mushrooms_item"
			];
			party.addToInventory(loot[this.Math.rand(0, loot.len() - 1)]);
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			local loot = [
				"loot/goblin_carved_ivory_iconographs_item",
				"loot/goblin_minted_coins_item",
				"loot/goblin_rank_insignia_item"
			];
			party.addToInventory(loot[this.Math.rand(0, loot.len() - 1)]);
		}

		local c = party.getController();
		local ambush = this.new("scripts/ai/world/orders/ambush_order");
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(settlement.getTile());
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(ambush);
		c.addOrder(move);
		c.addOrder(despawn);
		return true;
	}

});

