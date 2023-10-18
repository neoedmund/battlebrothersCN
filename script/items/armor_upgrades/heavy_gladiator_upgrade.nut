this.heavy_gladiator_upgrade <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.heavy_gladiator_upgrade";
		this.m.Name = "金属装甲件";
		this.m.Description = "提供额外保护的金属装甲。";
		this.m.ArmorDescription = "这件甲胄有附加的金属装甲件，提供额外的保护。";
		this.m.Icon = "armor_upgrades/upgrade_25.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_25.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_25.png";
		this.m.SpriteFront = "upgrade_25_front";
		this.m.SpriteBack = null;
		this.m.SpriteDamagedFront = "upgrade_25_front_damaged";
		this.m.SpriteDamagedBack = null;
		this.m.SpriteCorpseFront = "upgrade_25_front_dead";
		this.m.SpriteCorpseBack = null;
		this.m.Value = 800;
		this.m.ConditionModifier = 115;
		this.m.StaminaModifier = 10;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+115[/color] 耐久度"
		});
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] 最大疲劳值"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

