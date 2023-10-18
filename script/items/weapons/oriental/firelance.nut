this.firelance <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.firelance";
		this.m.Name = "火矛";
		this.m.Description = "一种南方设计的长矛，装有火药，点燃后会在两个格子距离内喷火。每次战斗只能使用一次，但战斗结束后自动补充。";
		this.m.Categories = "矛/火器, 单手持";
		this.m.IconLarge = "weapons/ranged/firelance_01.png";
		this.m.Icon = "weapons/ranged/firelance_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.Ammo;
		this.m.IsDroppedAsLoot = true;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.IsDoubleGrippable = true;
		this.m.ArmamentIcon = "icon_firelance_01";
		this.m.Value = 750;
		this.m.Ammo = 1;
		this.m.AmmoMax = 1;
		this.m.AmmoCost = 3;
		this.m.RangeMin = 1;
		this.m.RangeMax = 1;
		this.m.RangeIdeal = 1;
		this.m.RangeMaxBonus = 0;
		this.m.Condition = 48.0;
		this.m.ConditionMax = 48.0;
		this.m.StaminaModifier = -12;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 35;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageMult = 0.25;
		this.m.ShieldDamage = 0;
		this.m.ChanceToHitHead = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/thrust"));
		this.addSkill(this.new("scripts/skills/actives/ignite_firelance_skill"));
	}

	function setAmmo( _a )
	{
		this.weapon.setAmmo(_a);

		if (this.m.Ammo > 0)
		{
			this.m.Name = "Fire Lance";
			this.m.IconLarge = "weapons/ranged/firelance_01.png";
			this.m.Icon = "weapons/ranged/firelance_01_70x70.png";
			this.m.ArmamentIcon = "icon_firelance_01";
		}
		else
		{
			this.m.Name = "火矛（已用）";
			this.m.IconLarge = "weapons/ranged/firelance_02.png";
			this.m.Icon = "weapons/ranged/firelance_02_70x70.png";
			this.m.ArmamentIcon = "icon_firelance_01_empty";
		}

		this.updateAppearance();
	}

});

