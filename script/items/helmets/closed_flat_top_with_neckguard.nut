this.closed_flat_top_with_neckguard <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.closed_flat_top_with_neckguard";
		this.m.Name = "覆面内衬平顶盔";
		this.m.Description = "一顶封闭式的头盔，里面有完整的内衬护面。 影响呼吸和限制视野。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		local variants = [
			17,
			17,
			17,
			17,
			17,
			17,
			17,
			140,
			141,
			142,
			143,
			181
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 1100;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = -11;
		this.m.Vision = -3;
	}

	function setPlainVariant()
	{
		this.setVariant(17);
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Variant = 17;
			break;

		case this.Const.Items.Paint.Black:
			this.m.Variant = 143;
			break;

		case this.Const.Items.Paint.WhiteBlue:
			this.m.Variant = 140;
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Variant = 141;
			break;

		case this.Const.Items.Paint.OrangeRed:
			this.m.Variant = 142;
			break;

		case this.Const.Items.Paint.Red:
			this.m.Variant = 181;
			break;
		}

		this.updateVariant();
		this.updateAppearance();
	}

});

