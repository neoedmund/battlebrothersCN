this.double_mail_upgrade <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.double_mail";
		this.m.Name = "双重链甲";
		this.m.Description = "一个厚厚的双重链甲护肩。重，但能有效的进一步增加装甲的防御。";
		this.m.ArmorDescription = "一个厚厚的双重链甲护肩能有效的进一步增加装甲的防御。";
		this.m.Icon = "armor_upgrades/upgrade_19.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_19.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_19.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_19_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_19_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_19_back_dead";
		this.m.Value = 200;
		this.m.ConditionModifier = 20;
		this.m.StaminaModifier = 2;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] 耐久度"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] 最大疲劳值"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

