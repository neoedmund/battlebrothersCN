this.wardog_bite <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.wardog_bite";
		this.m.Name = "咬";
		this.m.Description = "";
		this.m.KilledString = "撕烂";
		this.m.Icon = "skills/active_84.png";
		this.m.Overlay = "active_84";
		this.m.SoundOnUse = [
			"sounds/enemies/wardog_bite_00.wav",
			"sounds/enemies/wardog_bite_01.wav",
			"sounds/enemies/wardog_bite_02.wav",
			"sounds/enemies/wardog_bite_03.wav",
			"sounds/enemies/wardog_bite_04.wav",
			"sounds/enemies/wardog_bite_05.wav",
			"sounds/enemies/wardog_bite_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingActorPitch = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 20;
		_properties.DamageRegularMax += 35;
		_properties.DamageArmorMult *= 0.4;
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

});

