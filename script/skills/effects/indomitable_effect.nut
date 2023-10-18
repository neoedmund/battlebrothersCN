this.indomitable_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.indomitable";
		this.m.Name = "不屈";
		this.m.Icon = "ui/perks/perk_30.png";
		this.m.IconMini = "perk_30_mini";
		this.m.Overlay = "perk_30";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "这个角色已经聚集了他们所有的体力和意志力，变得不屈不挠，直到下一个回合。";
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
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "只受到 [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] 所有伤害"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "免疫昏迷"
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "免疫击退和勾拽技能"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= 0.5;
		_properties.IsImmuneToStun = true;
		_properties.IsImmuneToKnockBackAndGrab = true;
		_properties.TargetAttractionMult *= 0.5;
	}

	function onTurnStart()
	{
		this.removeSelf();
	}

});

