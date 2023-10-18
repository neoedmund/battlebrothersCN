this.goedendag <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.goedendag";
		this.m.Name = "日安棒";
		this.m.Description = "一根顶端有尖钉的金属加固棍棒。可用于刺击敌人，或者击打他们至屈服。";
		this.m.Categories = "长矛/狼牙棒，双手持";
		this.m.IconLarge = "weapons/melee/goedendag_01.png";
		this.m.Icon = "weapons/melee/goedendag_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goedendag_01";
		this.m.Value = 600;
		this.m.ShieldDamage = 0;
		this.m.Condition = 64.0;
		this.m.ConditionMax = 64.0;
		this.m.StaminaModifier = -14;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local thrust = this.new("scripts/skills/actives/thrust");
		thrust.m.Icon = "skills/active_128.png";
		thrust.m.IconDisabled = "skills/active_128_sw.png";
		thrust.m.Overlay = "active_128";
		thrust.setFatigueCost(15);
		thrust.m.ActionPointCost = 6;
		this.addSkill(thrust);
		local knockOut = this.new("scripts/skills/actives/knock_out");
		knockOut.m.Icon = "skills/active_127.png";
		knockOut.m.IconDisabled = "skills/active_127_sw.png";
		knockOut.m.Overlay = "active_127";
		knockOut.setFatigueCost(knockOut.getFatigueCostRaw() + 5);
		knockOut.m.ActionPointCost = 6;
		this.addSkill(knockOut);
	}

});

