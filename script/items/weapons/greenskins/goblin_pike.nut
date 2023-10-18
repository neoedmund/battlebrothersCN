this.goblin_pike <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.goblin_pike";
		this.m.Name = "锯齿长矛";
		this.m.Description = "一把锯齿状的长矛，可以撕裂出流血伤口，并利用其长度与敌人保持距离。";
		this.m.Categories = "长柄武器，双手持";
		this.m.IconLarge = "weapons/melee/goblin_weapon_04.png";
		this.m.Icon = "weapons/melee/goblin_weapon_04_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goblin_weapon_04";
		this.m.Value = 800;
		this.m.ShieldDamage = 0;
		this.m.Condition = 40.0;
		this.m.ConditionMax = 40.0;
		this.m.StaminaModifier = -8;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 70;
		this.m.ArmorDamageMult = 0.9;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local impale = this.new("scripts/skills/actives/rupture");
		impale.m.Icon = "skills/active_80.png";
		impale.m.IconDisabled = "skills/active_80_sw.png";
		impale.m.Overlay = "active_80";
		this.addSkill(impale);
		this.addSkill(this.new("scripts/skills/actives/repel"));
	}

});

