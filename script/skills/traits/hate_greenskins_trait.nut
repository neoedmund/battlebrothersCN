this.hate_greenskins_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.hate_greenskins";
		this.m.Name = "憎恨绿皮";
		this.m.Icon = "ui/traits/trait_icon_52.png";
		this.m.Description = "在这个角色的生活中，一些过去的事件激起了对所有绿色和卑鄙事物的强烈仇恨。";
		this.m.Titles = [
			"兽人克星"
		];
		this.m.Excluded = [
			"trait.weasel",
			"trait.craven",
			"trait.dastard",
			"trait.fainthearted",
			"trait.fear_greenskins"
		];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] 决心，与绿皮战斗时"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}

		local fightingGreenskins = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Orcs || this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Goblins)
			{
				fightingGreenskins = true;
				break;
			}
		}

		if (fightingGreenskins)
		{
			_properties.Bravery += 10;
		}
	}

});

