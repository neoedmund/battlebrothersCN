this.bright_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.bright";
		this.m.Name = "聪明";
		this.m.Icon = "ui/traits/trait_icon_11.png";
		this.m.Description = "这个角色比大多数人更容易掌握新概念并适应形势。";
		this.m.Titles = [
			"快人(the Quick)",
			"狐狸(the Fox)",
			"捷思(the Bright)",
			"明日之星(the Bright)",
			"智者"
		];
		this.m.Excluded = [
			"trait.dumb"
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] 经验获取"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.XPGainMult *= 1.1;
	}

});

