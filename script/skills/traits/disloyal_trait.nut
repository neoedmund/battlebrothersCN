this.disloyal_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.disloyal";
		this.m.Name = "不忠诚";
		this.m.Icon = "ui/traits/trait_icon_35.png";
		this.m.Description = "我必须把自己放在第一位！这个角色相当不忠诚，一旦你的克朗或食物用完，他会很快离开。";
		this.m.Titles = [
			"骗子(the Liar)"
		];
		this.m.Excluded = [
			"trait.loyal",
			"trait.brave",
			"trait.fearless"
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
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "总是满足于充当后备"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
	}

});

