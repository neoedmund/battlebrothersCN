this.fear_beasts_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.fear_beasts";
		this.m.Name = "惧怕野兽";
		this.m.Icon = "ui/traits/trait_icon_48.png";
		this.m.Description = "在这个角色的生活中，一些过去的事件或特别令人信服的故事让他害怕野兽的能力，使他在战场上面对他们时不那么可靠。";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.determined",
			"trait.cocky",
			"trait.bloodthirsty",
			"trait.hate_beasts"
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] 决心，与野兽战斗时"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}

		local fightingBeasts = false;
		local enemies = this.Tactical.Entities.getAllHostilesAsArray();

		foreach( enemy in enemies )
		{
			if (this.Const.EntityType.getDefaultFaction(enemy.getType()) == this.Const.FactionType.Beasts || enemy.getType() == this.Const.EntityType.BarbarianUnhold || enemy.getType() == this.Const.EntityType.BarbarianUnholdFrost)
			{
				fightingBeasts = true;
				break;
			}
		}

		if (fightingBeasts)
		{
			_properties.Bravery -= 10;
		}
	}

});

