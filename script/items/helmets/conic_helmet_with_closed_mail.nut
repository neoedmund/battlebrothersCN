this.conic_helmet_with_closed_mail <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.conic_helmet_with_closed_mail";
		this.m.Name = "全密闭链甲圆锥盔";
		this.m.Description = "一种厚重的圆锥形头盔，带有一条全封闭的链甲网以提供额外的保护。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		local variants = [
			201,
			201,
			201,
			201,
			201,
			201,
			201,
			217,
			218,
			219,
			220,
			221
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 2600;
		this.m.Condition = 265;
		this.m.ConditionMax = 265;
		this.m.StaminaModifier = -18;
		this.m.Vision = -2;
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Variant = 201;
			break;

		case this.Const.Items.Paint.Black:
			this.m.Variant = 217;
			break;

		case this.Const.Items.Paint.WhiteBlue:
			this.m.Variant = 220;
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Variant = 221;
			break;

		case this.Const.Items.Paint.OrangeRed:
			this.m.Variant = 219;
			break;

		case this.Const.Items.Paint.Red:
			this.m.Variant = 218;
			break;
		}

		this.updateVariant();
		this.updateAppearance();
	}

});

