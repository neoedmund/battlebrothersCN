this.cultist_leather_hood <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.cultist_leather_hood";
		this.m.Name = "邪教徒皮兜帽";
		this.m.Description = "一顶覆盖头部和颈部但限制视力的厚皮兜帽。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.ReplaceSprite = true;
		this.m.Variant = 236;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 140;
		this.m.Condition = 60;
		this.m.ConditionMax = 60;
		this.m.StaminaModifier = -3;
		this.m.Vision = -1;
	}

});

