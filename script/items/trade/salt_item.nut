this.salt_item <- this.inherit("scripts/items/trade/trading_good_item", {
	m = {},
	function create()
	{
		this.trading_good_item.create();
		this.m.ID = "misc.salt";
		this.m.Name = "盐";
		this.m.Description = "岩盐用于烹饪和腌制食品。商人会为此付个好价钱。";
		this.m.Icon = "trade/inventory_trade_03.png";
		this.m.Culture = this.Const.World.Culture.Neutral;
		this.m.ProducingBuildings = [
			"attached_location.salt_mine"
		];
		this.m.Value = 340;
	}

});

