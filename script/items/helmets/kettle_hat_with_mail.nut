this.kettle_hat_with_mail <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.kettle_hat_with_mail";
		this.m.Name = "链甲锅盔";
		this.m.Description = "一个带宽边和链甲的全金属头盔。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		local variants = [
			10,
			10,
			10,
			10,
			10,
			10,
			10,
			112,
			113,
			114,
			115,
			174
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1500;
		this.m.Condition = 215;
		this.m.ConditionMax = 215;
		this.m.StaminaModifier = -14;
		this.m.Vision = -2;
	}

	function setPlainVariant()
	{
		this.setVariant(10);
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Variant = 10;
			break;

		case this.Const.Items.Paint.Black:
			this.m.Variant = 115;
			break;

		case this.Const.Items.Paint.WhiteBlue:
			this.m.Variant = 112;
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Variant = 113;
			break;

		case this.Const.Items.Paint.OrangeRed:
			this.m.Variant = 114;
			break;

		case this.Const.Items.Paint.Red:
			this.m.Variant = 174;
			break;
		}

		this.updateVariant();
		this.updateAppearance();
	}

});

