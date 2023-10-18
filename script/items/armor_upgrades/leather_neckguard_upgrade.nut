this.leather_neckguard_upgrade <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.leather_neckguard";
		this.m.Name = "皮革护颈";
		this.m.Description = "这种简易的皮革护颈能附加到任何盔甲上来提供少量的额外防护。";
		this.m.ArmorDescription = "这件盔甲已经装上了皮革护颈，增加了额外的防护。";
		this.m.Icon = "armor_upgrades/upgrade_13.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_13.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_13.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_13_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_13_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_13_back_dead";
		this.m.Value = 100;
		this.m.ConditionModifier = 10;
		this.m.StaminaModifier = 0;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 14,
			type = "text",
			icon = "ui/icons/armor_body.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] 耐久度"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
	}

});

