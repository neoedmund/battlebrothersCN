this.rusty_mail_coif <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.rusty_mail_coif";
		this.m.Name = "生锈的链甲头巾";
		this.m.Description = "一顶仍然提供了很好保护的生锈链甲头巾－尽管它会留下可怕的污渍。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.ReplaceSprite = true;
		this.m.Variant = 0;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 150;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -4;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_helmet_29";
		this.m.SpriteDamaged = "bust_helmet_29_damaged";
		this.m.SpriteCorpse = "bust_helmet_29_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/inventory_helmet_29.png";
	}

});

