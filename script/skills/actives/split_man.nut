this.split_man <- this.inherit("scripts/skills/skill", {
	m = {
		ApplyBonusToBodyPart = -1
	},
	function create()
	{
		this.m.ID = "actives.split_man";
		this.m.Name = "裂身斩";
		this.m.Description = "一种缓慢的过顶击，用全部力量将目标从上到下分成两半。冲击力足够大，因此总是同时命中头部和身体造成额外伤害。";
		this.m.KilledString = "劈成两半";
		this.m.Icon = "skills/active_37.png";
		this.m.IconDisabled = "skills/active_37_sw.png";
		this.m.Overlay = "active_37";
		this.m.SoundOnUse = [
			"sounds/combat/overhead_strike_01.wav",
			"sounds/combat/overhead_strike_02.wav",
			"sounds/combat/overhead_strike_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/overhead_strike_hit_01.wav",
			"sounds/combat/overhead_strike_hit_02.wav",
			"sounds/combat/overhead_strike_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = false;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.4;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 99;
		this.m.ChanceDisembowel = 50;
		this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().buildPropertiesForUse(this, null);
		local mult = 1.5;
		local damage_regular_min = this.Math.floor(p.DamageRegularMin * p.DamageRegularMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_regular_max = this.Math.floor(p.DamageRegularMax * p.DamageRegularMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_armor_min = this.Math.floor(p.DamageRegularMin * p.DamageArmorMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(p.DamageRegularMax * p.DamageArmorMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_direct_max = this.Math.floor(damage_regular_max * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
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
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];

		if (this.m.DirectDamageMult > 0.0)
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "造成 [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] 生命值伤害，其中[color=" + this.Const.UI.Color.DamageValue + "]0[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_direct_max + "[/color] 可无视盔甲"
			});
		}
		else
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] 生命值伤害"
			});
		}

		if (damage_armor_max > 0)
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] 护甲伤害"
			});
		}

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "同时命中头部和身体以造成额外伤害"
		});
		return ret;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInAxes ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		local targetEntity = _targetTile.getEntity();
		local success = this.attackEntity(_user, _targetTile.getEntity());

		if (!_user.isAlive() || _user.isDying())
		{
			return success;
		}

		if (success && this.m.ApplyBonusToBodyPart != -1 && !_targetTile.IsEmpty && targetEntity.isAlive())
		{
			local p = this.getContainer().buildPropertiesForUse(this, targetEntity);
			local hitInfo = clone this.Const.Tactical.HitInfo;
			local damageRegular = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageRegularMult * 0.5;
			local damageArmor = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageArmorMult * 0.5;
			local damageDirect = this.Math.minf(1.0, p.DamageDirectMult * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
			hitInfo.DamageRegular = damageRegular;
			hitInfo.DamageArmor = damageArmor;
			hitInfo.DamageDirect = damageDirect;
			hitInfo.BodyPart = this.m.ApplyBonusToBodyPart;
			hitInfo.BodyDamageMult = 1.0;
			targetEntity.onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			this.m.ApplyBonusToBodyPart = -1;
		}

		return success;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this)
		{
			this.m.ApplyBonusToBodyPart = _bodyPart == this.Const.BodyPart.Body ? this.Const.BodyPart.Head : this.Const.BodyPart.Body;
		}
	}

});

