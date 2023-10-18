this.full_helm <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.full_helm";
		this.m.Name = "全密封头盔";
		this.m.Description = "一个带有呼吸孔的全密封金属头盔。 有着良好的防护但影响呼吸和限制视野。";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.IsDroppedAsLoot = true;
		local variants = [
			4,
			4,
			4,
			4,
			4,
			4,
			4,
			148,
			149,
			150,
			151,
			183
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 3500;
		this.m.Condition = 300;
		this.m.ConditionMax = 300;
		this.m.StaminaModifier = -20;
		this.m.Vision = -3;
	}

	function setPlainVariant()
	{
		this.setVariant(4);
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Variant = 4;
			break;

		case this.Const.Items.Paint.Black:
			this.m.Variant = 151;
			break;

		case this.Const.Items.Paint.WhiteBlue:
			this.m.Variant = 148;
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Variant = 149;
			break;

		case this.Const.Items.Paint.OrangeRed:
			this.m.Variant = 150;
			break;

		case this.Const.Items.Paint.Red:
			this.m.Variant = 183;
			break;
		}

		this.updateVariant();
		this.updateAppearance();
	}

});

