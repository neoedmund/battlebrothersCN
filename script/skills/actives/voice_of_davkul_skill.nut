this.voice_of_davkul_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.voice_of_davkul";
		this.m.Name = "达库尔之语";
		this.m.Description = "成为达库尔的血肉媒介与凡间代言。将真理告知他的追随者，使他们将一切奉献出来以取悦他们的神。";
		this.m.Icon = "skills/active_176.png";
		this.m.IconDisabled = "skills/active_176_sw.png";
		this.m.Overlay = "active_176";
		this.m.SoundOnUse = [
			"sounds/combat/dlc4/prophet_chant_01.wav",
			"sounds/combat/dlc4/prophet_chant_02.wav",
			"sounds/combat/dlc4/prophet_chant_03.wav",
			"sounds/combat/dlc4/prophet_chant_04.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 35;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "立即将每个邪教徒的疲劳值降低 [color=" + this.Const.UI.Color.NegativeValue + "]10[/color]。任何非邪教徒都不会受到影响。"
			}
		]);
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		local actors = this.Tactical.Entities.getAllInstancesAsArray();

		foreach( a in actors )
		{
			if (a.getID() == _user.getID())
			{
				continue;
			}

			if (a.getFatigue() == 0)
			{
				continue;
			}

			if (a.getType() == this.Const.EntityType.Cultist || a.isPlayerControlled() && (a.getBackground().getID() == "background.cultist" || a.getBackground().getID() == "background.converted_cultist"))
			{
				a.getSkills().add(this.new("scripts/skills/effects/voice_of_davkul_effect"));
			}
		}

		return true;
	}

});

