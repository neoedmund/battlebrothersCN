this.masterwork_bow <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.masterwork_bow";
		this.m.Name = "大师弓";
		this.m.Description = "一张精雕细琢的弓，轻盈而又精确平衡。它是由不同的木材打造的，螺旋式的花纹混合着树的颜色横贯整把武器。不愧是弓匠大师的杰作。";
		this.m.Categories = "弓，双手持";
		this.m.IconLarge = "weapons/ranged/bow_03.png";
		this.m.Icon = "weapons/ranged/bow_03_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_event_bow_01";
		this.m.Value = 3500;
		this.m.RangeMin = 2;
		this.m.RangeMax = 7;
		this.m.RangeIdeal = 7;
		this.m.StaminaModifier = -6;
		this.m.Condition = 110.0;
		this.m.ConditionMax = 110.0;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 0.65;
		this.m.DirectDamageMult = 0.35;
		this.m.AdditionalAccuracy = 5;
	}

	function getAmmoID()
	{
		return "ammo.arrows";
	}

	function getAdditionalRange( _actor )
	{
		return _actor.getCurrentProperties().IsSpecializedInBows ? 1 : 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local quick_shot = this.new("scripts/skills/actives/quick_shot");
		this.addSkill(quick_shot);
		local aimed_shot = this.new("scripts/skills/actives/aimed_shot");
		this.addSkill(aimed_shot);
	}

	function onSerialize( _out )
	{
		this.weapon.onSerialize(_out);
		_out.writeString(this.m.Name);
	}

	function onDeserialize( _in )
	{
		this.weapon.onDeserialize(_in);
		this.m.Name = _in.readString();
	}

});

