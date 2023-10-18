this.heraldic_armor <- this.inherit("scripts/items/armor/armor", {
	m = {
		Faction = 1
	},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.heraldic_armor";
		this.m.Name = "纹章锁子甲";
		this.m.Description = "一种用肩甲加固的锁子甲，额外附加了金属镀层和铆接的皮革盔甲，上面镶嵌着贵族家族的纹章。";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 35;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4000;
		this.m.Condition = 250;
		this.m.ConditionMax = 250;
		this.m.StaminaModifier = -26;
	}

	function setFaction( _f )
	{
		this.m.Faction = _f;
		this.updateVariant();
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		local faction = this.m.Faction < 10 ? "0" + this.m.Faction : this.m.Faction;
		this.m.Sprite = "bust_body_" + variant;
		this.m.SpriteDamaged = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_body_" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_faction_armor_" + faction + ".png";
		this.m.Icon = "armor/icon_faction_armor_" + faction + ".png";
	}

	function onEquip()
	{
		this.armor.onEquip();
		local actor = this.getContainer().getActor();

		if (actor != null && actor.hasSprite("surcoat"))
		{
			local banner = this.m.Faction < 10 ? "0" + this.m.Faction : this.m.Faction;
			actor.getSprite("surcoat").setBrush("surcoat_" + banner);
			actor.m.Surcoat = this.m.Faction;
			actor.setDirty(true);
		}
	}

	function onUnequip()
	{
		this.armor.onUnequip();
		local actor = this.getContainer().getActor();

		if (actor != null && !actor.isNull() && actor.hasSprite("surcoat"))
		{
			actor.getSprite("surcoat").resetBrush();
			actor.m.Surcoat = null;
			actor.setDirty(true);
		}
	}

	function onSerialize( _out )
	{
		_out.writeU8(this.m.Faction);
		this.armor.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.m.Faction = _in.readU8();
		this.armor.onDeserialize(_in);
		this.updateVariant();
	}

});

