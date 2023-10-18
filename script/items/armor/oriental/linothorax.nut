this.linothorax <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.linothorax";
		this.m.Name = "亚麻胸甲";
		this.m.Description = "由几层亚麻布制成的胸甲。";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.VariantString = "body_southern";
		this.m.Variant = 5;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 180;
		this.m.Condition = 75;
		this.m.ConditionMax = 75;
		this.m.StaminaModifier = -7;
	}

});

