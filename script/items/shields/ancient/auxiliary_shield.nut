this.auxiliary_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.auxiliary_shield";
		this.m.Name = "古代辅助盾";
		this.m.Description = "椭圆形的木制盾牌。木头看起来又脆又老，已经不那么耐用了。";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = this.Math.rand(1, 4);
		this.updateVariant();
		this.m.Value = 80;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 15;
		this.m.StaminaModifier = -10;
		this.m.Condition = 16;
		this.m.ConditionMax = 16;
	}

	function updateVariant()
	{
		this.m.Sprite = "shield_auxiliary_0" + this.m.Variant;
		this.m.SpriteDamaged = "shield_auxiliary_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "shield_auxiliary_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_shield_auxiliary_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/icon_shield_auxiliary_0" + this.m.Variant + ".png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

});

