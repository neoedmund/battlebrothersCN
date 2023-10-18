this.footman_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.footman_armor";
		this.m.Name = "步兵盔甲";
		this.m.Description = "一件由长链甲与皮革软甲铆接而成的传统盔甲。";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 84;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1600;
		this.m.Condition = 190;
		this.m.ConditionMax = 190;
		this.m.StaminaModifier = -24;
	}

});

