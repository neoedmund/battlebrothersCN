this.terrified_villagers_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.terrified_villagers";
		this.m.Name = "吓坏了的村民";
		this.m.Description = "这里的村民对未知的恐怖感到恐惧。街上潜在的新兵越来越少，人们对陌生人的态度也越来越差。";
		this.m.Icon = "ui/settlement_status/settlement_effect_09.png";
		this.m.Rumors = [
			"死人并不是真的死了，有时候他们会回来缠着活人！你不相信我？你自己去%settlement%看看吧！",
			"你看起来像个能干的剑客！我听说又有死人在%settlement%附近晃荡了。可能是骗人的，但受惊吓的本地人往往会为了再次感到安全而付高价。"
		];
	}

	function onUpdate( _modifiers )
	{
		_modifiers.BuyPriceMult *= 1.25;
		_modifiers.SellPriceMult *= 0.75;
		_modifiers.RecruitsMult *= 0.5;
	}

});

