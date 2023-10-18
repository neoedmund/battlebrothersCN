this.orc_wooden_club <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.orc_wooden_club";
		this.m.Name = "树枝";
		this.m.Description = "从树上扯下来的又大又重的树枝。不太适合人手。";
		this.m.Categories = "狼牙棒, 单手持";
		this.m.IconLarge = "weapons/melee/orc_club_01_140x70.png";
		this.m.Icon = "weapons/melee/orc_club_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.IsAgainstShields = true;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_orc_weapon_06";
		this.m.Value = 150;
		this.m.ShieldDamage = 0;
		this.m.Condition = 44.0;
		this.m.ConditionMax = 44.0;
		this.m.StaminaModifier = -20;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.75;
		this.m.DirectDamageMult = 0.4;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/bash");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/knock_out");
		this.addSkill(skill);
	}

});

