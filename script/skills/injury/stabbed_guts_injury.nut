this.stabbed_guts_injury <- this.inherit("scripts/skills/injury/injury", {
	m = {},
	function create()
	{
		this.injury.create();
		this.m.ID = "injury.stabbed_guts";
		this.m.Name = "肠胃捅伤";
		this.m.Description = "肠子上的伤口会流失体质，感染的可能性很高，并且可能会缓慢而痛苦的死亡却没有办法。";
		this.m.Type = this.m.Type | this.Const.SkillType.TemporaryInjury;
		this.m.DropIcon = "injury_icon_39";
		this.m.Icon = "ui/injury/injury_icon_39.png";
		this.m.IconMini = "injury_icon_39_mini";
		this.m.InfectionChance = 4.0;
		this.m.HealingTimeMin = 3;
		this.m.HealingTimeMax = 5;
		this.m.IsShownOnBody = true;
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
				id = 7,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40%[/color] 生命值"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40%[/color] 最大疲劳值"
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onAdded()
	{
		this.injury.onAdded();

		if (!("State" in this.Tactical) || this.Tactical.State == null)
		{
			return;
		}

		local p = this.getContainer().getActor().getCurrentProperties();

		if (!p.IsAffectedByInjuries || this.m.IsFresh && !p.IsAffectedByFreshInjuries)
		{
			return;
		}

		if (this.getContainer().getActor().getHitpointsPct() > 0.6)
		{
			this.getContainer().getActor().setHitpoints(this.getContainer().getActor().getHitpointsMax() * 0.6);
		}
	}

	function onUpdate( _properties )
	{
		this.injury.onUpdate(_properties);

		if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
		{
			return;
		}

		if (this.m.IsShownOutOfCombat)
		{
			_properties.HitpointsMult *= 0.6;
		}

		_properties.StaminaMult *= 0.6;
	}

});

