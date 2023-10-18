this.named_lindwurm_shield <- this.inherit("scripts/items/shields/named/named_shield", {
	m = {},
	function create()
	{
		this.named_shield.create();
		this.m.Variant = 7;
		this.updateVariant();
		this.m.ID = "shield.named_lindwurm";
		this.m.NameList = this.Const.Strings.ShieldNames;
		this.m.Description = "一面用坚固木材框架与罕见的林德蠕龙鳞片制成的闪耀盾牌，几乎无法穿透。";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Value = 1300;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 25;
		this.m.StaminaModifier = -16;
		this.m.Condition = 48;
		this.m.ConditionMax = 48;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.Sprite = "shield_named_0" + this.m.Variant;
		this.m.SpriteDamaged = "shield_named_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "shield_named_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_named_shield_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/icon_named_shield_0" + this.m.Variant + ".png";
	}

	function createRandomName()
	{
		local prefixes = [
			"林德蠕龙的",
			"蜥蜴的",
			"龙鳞甲",
			"沼泽",
			"鳞片覆盖的",
			"蛇皮",
			"糠皮",
			"有鳞的"
		];
		return prefixes[this.Math.rand(0, prefixes.len() - 1)] + " ";
	}

	function onEquip()
	{
		this.named_shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

});

