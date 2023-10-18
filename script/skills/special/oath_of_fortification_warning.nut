this.oath_of_fortification_warning <- this.inherit("scripts/skills/skill", {
	function create()
	{
		this.m.ID = "special.oath_of_fortification_warning";
		this.m.Name = "壁垒！";
		this.m.Icon = "skills/status_effect_159.png";
		this.m.IconMini = "status_effect_159_mini";
		this.m.Overlay = "status_effect_159";
		this.m.Description = "这个角色已经立下壁垒誓言，因此在准备应战的过程中无法移动！";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.StatusEffect | this.Const.SkillType.Alert;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsHidden = true;
	}

	function onTurnStart()
	{
		if (!this.isHidden())
		{
			this.spawnIcon("status_effect_159", this.getContainer().getActor().getTile());
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("trait.oath_of_fortification") && actor.isPlacedOnMap() && this.Time.getRound() <= 1)
		{
			_properties.IsRooted = true;
			this.m.IsHidden = false;
		}
		else
		{
			this.m.IsHidden = true;
		}
	}

});

