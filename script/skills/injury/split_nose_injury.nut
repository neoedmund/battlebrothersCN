this.split_nose_injury <- this.inherit("scripts/skills/injury/injury", {
	m = {},
	function create()
	{
		this.injury.create();
		this.m.ID = "injury.split_nose";
		this.m.Name = "鼻子劈裂";
		this.m.Description = "一次差点命中的挥砍将这个角色的鼻子一分为二，使得任何呼吸的尝试都像是在练习吞咽大量血液";
		this.m.Type = this.m.Type | this.Const.SkillType.TemporaryInjury;
		this.m.DropIcon = "injury_icon_34";
		this.m.Icon = "ui/injury/injury_icon_34.png";
		this.m.IconMini = "injury_icon_34_mini";
		this.m.HealingTimeMin = 2;
		this.m.HealingTimeMax = 4;
	}

	function getTooltip()
	{
		local ret = [
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
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] 每回合疲劳值恢复量"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function isValid( _actor )
	{
		if (_actor.getSkills().hasSkill("injury.missing_nose"))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);

		if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
		{
			return;
		}

		_properties.FatigueRecoveryRate -= 5;
	}

});

