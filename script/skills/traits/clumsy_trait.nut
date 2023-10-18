this.clumsy_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.clumsy";
		this.m.Name = "笨拙";
		this.m.Icon = "ui/traits/trait_icon_36.png";
		this.m.Description = "这个角色对他自己和对手来说都可能是同样危险的。";
		this.m.Excluded = [
			"trait.weasel",
			"trait.dexterous",
			"trait.sure_footing",
			"trait.swift",
			"trait.lucky"
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
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] 近战技能"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill += -5;
	}

});

