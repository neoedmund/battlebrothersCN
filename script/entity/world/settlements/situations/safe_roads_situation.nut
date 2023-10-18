this.safe_roads_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.safe_roads";
		this.m.Name = "安全道路";
		this.m.Description = "最近通往这里的道路相当安全，这使得许多有利可图的贸易得以进行，定居点也有所繁荣。";
		this.m.Icon = "ui/settlement_status/settlement_effect_06.png";
		this.m.Rumors = [
			"看来 %settlement% 附近的强盗现在日子不好过很多人都在巡逻。",
			"昨晚刚从 %settlement% 回来。路上看不到强盗，感谢上帝。",
			"多年来我一直劝我堂兄别在路上抢劫别人。没有办法，只有糟糕的结局。我是对的，是的。前几天他在 %settlement% 得到了报应。这个地方到处都是民兵。"
		];
		this.m.IsStacking = false;
	}

	function onAdded( _settlement )
	{
		_settlement.removeSituationByID("situation.ambushed_trade_routes");
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 1.1;
		_modifiers.RarityMult *= 1.1;
	}

});

