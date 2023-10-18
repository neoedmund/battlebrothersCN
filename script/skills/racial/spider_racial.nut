this.spider_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.spider";
		this.m.Name = "毒药";
		this.m.Description = "TODO";
		this.m.Icon = "";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/giant_spider_poison_01.wav",
			"sounds/enemies/dlc2/giant_spider_poison_02.wav"
		];
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints < this.Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}

		if (!_targetEntity.isAlive())
		{
			return;
		}

		if (_targetEntity.getFlags().has("undead"))
		{
			return;
		}

		if (!_targetEntity.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + "中毒了");
		}

		this.spawnIcon("status_effect_54", _targetEntity.getTile());
		local poison = _targetEntity.getSkills().getSkillByID("effects.spider_poison");

		if (poison == null)
		{
			local effect = this.new("scripts/skills/effects/spider_poison_effect");
			_targetEntity.getSkills().add(effect);
		}
		else
		{
			poison.resetTime();
		}
	}

	function onUpdate( _properties )
	{
		local num = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction()).len();
		_properties.Bravery += (num - 1) * 3;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity.getSkills().hasSkill("effects.web"))
		{
			_properties.DamageDirectMult *= 2.0;
		}
	}

});

