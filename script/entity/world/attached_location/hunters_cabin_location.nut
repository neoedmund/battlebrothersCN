this.hunters_cabin_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "猎人小屋";
		this.m.ID = "attached_location.hunters_cabin";
		this.m.Description = "猎人在狩猎时会住在这些小茅屋里。剁碎的野味、鹿肉和兽皮被挂在小屋周围晒干。";
		this.m.Sprite = "world_hunter_01";
		this.m.SpriteDestroyed = "world_hunter_01_ruins";
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/cured_venison_item");
	}

	function onUpdateDraftList( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("butcher_background");
		_list.push("butcher_background");
		_list.push("hunter_background");
		_list.push("hunter_background");
		_list.push("poacher_background");
		_list.push("poacher_background");
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/cured_venison_item"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/short_bow"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/hunting_bow"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/hood"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/hunters_hat"
			});

			if (this.Const.DLC.Unhold)
			{
				_list.extend([
					{
						R = 10,
						P = 1.0,
						S = "weapons/spetum"
					}
				]);
			}
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

