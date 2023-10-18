this.stunned_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.stunned";
		this.m.Name = "昏迷";
		this.m.Icon = "skills/status_effect_05.png";
		this.m.IconMini = "status_effect_05_mini";
		this.m.Overlay = "status_effect_05";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "这个角色被击晕或丧失行动能力 [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] 回合, 期间无法行动。";
	}

	function addTurns( _t )
	{
		this.m.TurnsLeft += _t;
	}

	function setTurns( _t )
	{
		if (this.getContainer() != null)
		{
			this.m.TurnsLeft = this.Math.max(1, _t + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		}
	}

	function onAdded()
	{
		local statusResisted = this.getContainer().getActor().getCurrentProperties().IsResistantToAnyStatuses ? this.Math.rand(1, 100) <= 50 : false;
		statusResisted = statusResisted || this.getContainer().getActor().getCurrentProperties().IsResistantToPhysicalStatuses ? this.Math.rand(1, 100) <= 33 : false;

		if (statusResisted)
		{
			if (!this.getContainer().getActor().isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + "非自然的生理功能帮助他免受击晕");
			}

			this.removeSelf();
		}
		else if (!this.m.Container.getActor().getCurrentProperties().IsImmuneToStun)
		{
			this.m.Container.removeByID("effects.shieldwall");
			this.m.Container.removeByID("effects.spearwall");
			this.m.Container.removeByID("effects.riposte");
			this.m.Container.removeByID("effects.return_favor");
			this.m.Container.removeByID("effects.possessed_undead");
		}
		else
		{
			this.m.IsGarbage = true;
		}
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		if (actor.hasSprite("status_stunned"))
		{
			actor.getSprite("status_stunned").Visible = false;
		}

		actor.setDirty(true);
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (!actor.getCurrentProperties().IsImmuneToStun)
		{
			if (this.m.TurnsLeft != 0)
			{
				_properties.IsStunned = true;
				actor.setActionPoints(0);

				if (actor.hasSprite("status_stunned"))
				{
					actor.getSprite("status_stunned").setBrush(this.Const.Combat.StunnedBrush);
					actor.getSprite("status_stunned").Visible = true;
				}

				actor.setDirty(true);
			}
			else
			{
				if (actor.hasSprite("status_stunned"))
				{
					actor.getSprite("status_stunned").Visible = false;
				}

				actor.setDirty(true);
			}
		}
		else
		{
			this.removeSelf();
		}
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			local actor = this.getContainer().getActor();

			if (actor.hasSprite("status_stunned"))
			{
				actor.getSprite("status_stunned").Visible = false;
			}

			actor.setDirty(true);
		}
	}

});

