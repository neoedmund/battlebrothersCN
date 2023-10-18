this.winery_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "葡萄酒厂";
		this.m.ID = "attached_location.winery";
		this.m.Description = "这个葡萄酒厂被一个大葡萄园所环绕。这里出产的葡萄酒在富裕阶层中是一种高价的商品。";
		this.m.Sprite = "world_winery_01";
		this.m.SpriteDestroyed = "world_winery_01_ruins";
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/wine_item");
	}

	function onUpdateDraftList( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("monk_background");
		_list.push("brawler_background");
		_list.push("caravan_hand_background");
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/wine_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

	function onBuild()
	{
		local myTile = this.getTile();
		local num = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.IsOccupied || nextTile.HasRoad)
				{
				}
				else if (nextTile.Type != this.Const.World.TerrainType.Plains && nextTile.Type != this.Const.World.TerrainType.Tundra && nextTile.Type != this.Const.World.TerrainType.Steppe)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						nextTile.clear();
						local d = nextTile.spawnDetail("world_winery_detail_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
						d.Scale = 0.9;
						num = ++num;
					}

					if (num >= 2)
					{
						break;
					}
				}
			}
		}

		return true;
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

