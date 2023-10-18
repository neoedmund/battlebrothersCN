this.mail_and_lamellar_plating <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.mail_and_lamellar_plating";
		this.m.Name = "金属札链甲";
		this.m.Description = "一种由金属板交织而成的片状衬衫穿在盔甲衫上。";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.VariantString = "body_southern";
		this.m.Variant = 2;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 750;
		this.m.Condition = 135;
		this.m.ConditionMax = 135;
		this.m.StaminaModifier = -15;
	}

});

