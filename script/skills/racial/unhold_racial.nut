this.unhold_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.unhold";
		this.m.Name = "巨魔被动";
		this.m.Description = "";
		this.m.Icon = "skills/status_effect_79.png";
		this.m.SoundOnUse = [
			"sounds/enemies/unhold_regenerate_01.wav",
			"sounds/enemies/unhold_regenerate_02.wav",
			"sounds/enemies/unhold_regenerate_03.wav"
		];
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
		local healthAdded = this.Math.min(healthMissing, this.Math.floor(actor.getHitpointsMax() * 0.15));

		if (healthAdded <= 0)
		{
			return;
		}

		actor.setHitpoints(actor.getHitpoints() + healthAdded);
		actor.setDirty(true);

		if (!actor.isHiddenToPlayer())
		{
			this.spawnIcon("status_effect_79", actor.getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "恢复了" + healthAdded + "点生命值");
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor().get();

		if ((!this.Tactical.State.isScenarioMode() && this.Time.getRound() <= 2 || this.Tactical.State.isScenarioMode() && this.Time.getRound() <= 3) && (this.isKindOf(actor, "unhold_armored") || this.isKindOf(actor, "unhold_frost_armored")))
		{
			_properties.InitiativeForTurnOrderAdditional += 40;
		}
	}

});

