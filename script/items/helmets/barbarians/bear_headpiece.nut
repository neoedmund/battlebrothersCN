this.bear_headpiece <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.bear_headpiece";
		this.m.Name = "熊头帽";
		this.m.Description = "经过干燥处理的熊头帽。 提供了一定的防护，但主要还是为了好看。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ReplaceSprite = true;
		local variants = [
			190
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 100;
		this.m.Condition = 50;
		this.m.ConditionMax = 50;
		this.m.StaminaModifier = -3;
		this.m.Vision = 0;
	}

});

