this.conic_helmet_with_faceguard <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.conic_helmet_with_faceguard";
		this.m.Name = "护面圆锥盔";
		this.m.Description = "这种锥形头盔配有链邮，带有金属面罩。它重量沉重，视线有点受限，但提供极好的保护。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		local variants = [
			200,
			200,
			200,
			200,
			200,
			200,
			200,
			212,
			213,
			214,
			215,
			216
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 3000;
		this.m.Condition = 280;
		this.m.ConditionMax = 280;
		this.m.StaminaModifier = -19;
		this.m.Vision = -3;
	}

	function setPlainVariant()
	{
		this.setVariant(200);
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Variant = 200;
			break;

		case this.Const.Items.Paint.Black:
			this.m.Variant = 212;
			break;

		case this.Const.Items.Paint.WhiteBlue:
			this.m.Variant = 215;
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Variant = 216;
			break;

		case this.Const.Items.Paint.OrangeRed:
			this.m.Variant = 214;
			break;

		case this.Const.Items.Paint.Red:
			this.m.Variant = 213;
			break;
		}

		this.updateVariant();
		this.updateAppearance();
	}

});

