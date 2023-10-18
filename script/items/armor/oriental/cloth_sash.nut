this.cloth_sash <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.cloth_sash";
		this.m.Name = "布饰带";
		this.m.Description = "一种由厚布制成穿在身上的双重饰带。";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.VariantString = "body_southern";
		local variants = [
			12,
			18,
			19
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 30;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 0;
	}

});

