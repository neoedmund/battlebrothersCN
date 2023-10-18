this.kite_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.kite_shield";
		this.m.Name = "筝形盾";
		this.m.Description = "一块覆盖着皮革的细长木制盾牌，对下半身也能提供很好的保护。在近距离战斗中有点笨重。";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = this.Math.rand(0, 9);
		this.updateVariant();
		this.m.Value = 200;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 25;
		this.m.StaminaModifier = -16;
		this.m.Condition = 48;
		this.m.ConditionMax = 48;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.Sprite = "shield_kite_" + variant;
		this.m.SpriteDamaged = "shield_kite_" + variant + "_damaged";
		this.m.ShieldDecal = "shield_kite_" + variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_kite_shield_" + variant + ".png";
		this.m.Icon = "shields/icon_kite_shield_" + variant + ".png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

	function onPaintInCompanyColors()
	{
		this.setVariant(this.World.Assets.getBannerID() + 11);
		this.updateAppearance();
	}

});

