this.noble_tunic <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.noble_tunic";
		this.m.Name = "贵族束腰外衣";
		this.m.Description = "绣有悦目花纹的上等亚麻束腰外衣。时尚但几乎没有提供保护。";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 8;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_body_" + variant;
		this.m.SpriteDamaged = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_body_armor_" + variant + ".png";
		this.m.Icon = "armor/icon_body_armor_" + variant + ".png";
	}

});

