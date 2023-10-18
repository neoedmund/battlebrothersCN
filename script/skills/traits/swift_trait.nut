this.swift_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.swift";
		this.m.Name = "迅捷";
		this.m.Icon = "ui/traits/trait_icon_53.png";
		this.m.Description = "这个角色天生迅捷灵巧，更容易躲避飞来的投射物。";
		this.m.Titles = [
			"迅捷者(the Swift)",
			"敏足 (Quickfeet)"
		];
		this.m.Excluded = [
			"trait.clumsy",
			"trait.fat",
			"trait.clubfooted"
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
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] 远程防御"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.RangedDefense += 5;
	}

});

