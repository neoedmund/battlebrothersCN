this.local_holiday_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.local_holiday";
		this.m.Name = "本地节日";
		this.m.Description = "当地的节日使人们心情舒畅。盛宴时刻！";
		this.m.Icon = "ui/settlement_status/settlement_effect_22.png";
		this.m.Rumors = [
			"如果你想玩得开心，就去 %settlement% 参加他们的庆祝活动吧！天呐，我真希望我能在那里。",
			"如果我可以这么说的话，你看起来不太像那种喜庆的人，但也许你的人会喜欢一些食物和饮料。唉，这两种在 %settlement% 很常见，因为他们正在那里庆祝节日。",
			"%settlement% 的好人们正在度每年的节日。如果我有克朗的话，我会在那里吃喝什么的。介意再给我拿杯啤酒吗，朋友？"
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 2;
	}

	function getAddedString( _s )
	{
		return _s + "现在有" + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + "不再有" + this.m.Name;
	}

	function onAdded( _settlement )
	{
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 1.05;
		_modifiers.BuyPriceMult *= 0.95;
		_modifiers.FoodRarityMult *= 1.5;
		_modifiers.FoodPriceMult *= 0.9;
	}

});

