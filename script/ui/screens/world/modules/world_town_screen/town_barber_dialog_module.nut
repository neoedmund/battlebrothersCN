this.town_barber_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {},
	function create()
	{
		this.m.ID = "BarberDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function clear()
	{
	}

	function onLeaveButtonPressed()
	{
		this.World.getTemporaryRoster().clear();
		this.m.Parent.onModuleClosed();
	}

	function queryRosterInformation()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local roster = [];

		foreach( b in brothers )
		{
			local background = b.getBackground();
			local e = {
				ID = b.getID(),
				Name = b.getName(),
				ImagePath = b.getImagePath(),
				ImageOffsetX = b.getImageOffsetX(),
				ImageOffsetY = b.getImageOffsetY(),
				BackgroundImagePath = background.getIconColored(),
				BackgroundText = background.getDescription()
			};
			roster.push(e);
		}

		return {
			Title = "理发店",
			SubTitle = "在理发店定制你的人的外观",
			Roster = roster,
			Assets = this.m.Parent.queryAssetsInformation()
		};
	}

	function onEntrySelected( _entityID )
	{
		local roster = this.World.getTemporaryRoster();
		roster.clear();
		local temp = roster.create("scripts/entity/tactical/human");
		temp.copySpritesFrom(this.Tactical.getEntityByID(_entityID), [
			"body",
			"head",
			"beard",
			"hair",
			"tattoo_body",
			"tattoo_head",
			"beard_top"
		]);
		temp.setDirty(true);
		return temp.getImagePath();
	}

	function onUpdateAppearance( _data )
	{
		local _entityID = _data[0];
		local _layerID = _data[1];
		local _change = _data[2];
		local temp = this.World.getTemporaryRoster().getAll()[0];
		local color;

		if (temp.getSprite("hair").HasBrush)
		{
			color = temp.getSprite("hair").getBrush().Name;
		}
		else if (temp.getSprite("beard").HasBrush)
		{
			color = temp.getSprite("beard").getBrush().Name;
		}
		else
		{
			color = "brown";
		}

		if (this.String.contains(color, "_black_"))
		{
			color = "black";
		}
		else if (this.String.contains(color, "_blonde_"))
		{
			color = "blonde";
		}
		else if (this.String.contains(color, "_grey_"))
		{
			color = "grey";
		}
		else if (this.String.contains(color, "_red_"))
		{
			color = "red";
		}
		else
		{
			color = "brown";
		}

		if (_layerID == "color")
		{
			local index = 0;

			foreach( i, s in this.Const.HairColors.All )
			{
				if (s == color)
				{
					index = i;
					break;
				}
			}

			index = index + _change;

			if (index >= this.Const.HairColors.All.len())
			{
				index = 0;
			}
			else if (index < 0)
			{
				index = this.Const.HairColors.All.len() - 1;
			}

			color = this.Const.HairColors.All[index];
			this.changeIndexEx(this.Const.Hair.Barber, temp.getSprite("hair"), 0, "hair", color, "");
			this.changeIndexEx(this.Const.Beards.Barber, temp.getSprite("beard"), 0, "beard", color, "");

			if (temp.getSprite("beard").HasBrush && this.doesBrushExist(temp.getSprite("beard").getBrush().Name + "_top"))
			{
				temp.getSprite("beard_top").setBrush(temp.getSprite("beard").getBrush().Name + "_top");
			}
			else
			{
				temp.getSprite("beard_top").resetBrush();
			}
		}
		else if (_layerID == "body")
		{
			this.changeIndex(this.Const.Bodies.Barber, temp.getSprite("body"), _change);
		}
		else if (_layerID == "head")
		{
			this.changeIndex(this.Const.Faces.Barber, temp.getSprite("head"), _change);
		}
		else if (_layerID == "hair")
		{
			this.changeIndexEx(this.Const.Hair.Barber, temp.getSprite("hair"), _change, "hair", color, "");
		}
		else if (_layerID == "beard")
		{
			this.changeIndexEx(this.Const.Beards.Barber, temp.getSprite("beard"), _change, "beard", color, "");

			if (temp.getSprite("beard").HasBrush && this.doesBrushExist(temp.getSprite("beard").getBrush().Name + "_top"))
			{
				temp.getSprite("beard_top").setBrush(temp.getSprite("beard").getBrush().Name + "_top");
			}
			else
			{
				temp.getSprite("beard_top").resetBrush();
			}
		}
		else if (_layerID == "tattoo")
		{
			this.changeIndexEx(this.Const.Tattoos.All, temp.getSprite("tattoo_body"), _change, "", "", temp.getSprite("body").getBrush().Name);

			if (temp.getSprite("tattoo_body").HasBrush)
			{
				local name = temp.getSprite("tattoo_body").getBrush().Name;
				name = this.String.remove(name, "_" + temp.getSprite("body").getBrush().Name);
				local index = 0;

				foreach( i, s in this.Const.Tattoos.All )
				{
					if (s == name)
					{
						index = i;
						break;
					}
				}

				if (this.doesBrushExist(this.Const.Tattoos.All[index] + "_head"))
				{
					temp.getSprite("tattoo_head").setBrush(this.Const.Tattoos.All[index] + "_head");
				}
				else
				{
					temp.getSprite("tattoo_head").resetBrush();
				}
			}
			else
			{
				temp.getSprite("tattoo_head").resetBrush();
			}
		}

		temp.setDirty(true);
		return temp.getImagePath();
	}

	function onChangeAppearance( _entityID )
	{
		local bro = this.Tactical.getEntityByID(_entityID);
		local temp = this.World.getTemporaryRoster().getAll()[0];
		bro.copySpritesFrom(temp, [
			"body",
			"head",
			"beard",
			"hair",
			"tattoo_body",
			"tattoo_head",
			"beard_top"
		]);
		bro.setDirty(true);
		this.Sound.play(this.Const.Sound.Barber[this.Math.rand(0, this.Const.Sound.Barber.len() - 1)], 1.0);
		return bro.getImagePath();
	}

	function changeIndex( _list, _sprite, _change )
	{
		local currentBrush = _sprite.HasBrush ? _sprite.getBrush().Name : "";
		local index = 0;

		foreach( i, s in _list )
		{
			if (s == currentBrush)
			{
				index = i;
				break;
			}
		}

		index = index + _change;

		if (index >= _list.len())
		{
			index = 0;
		}
		else if (index < 0)
		{
			index = _list.len() - 1;
		}

		if (_list[index] != "")
		{
			_sprite.setBrush(_list[index]);
		}
		else
		{
			_sprite.resetBrush();
		}
	}

	function changeIndexEx( _list, _sprite, _change, _prefix, _midfix, _suffix )
	{
		local currentBrush = _sprite.HasBrush ? _sprite.getBrush().Name : "";
		local index = 0;

		if (_prefix != "")
		{
			currentBrush = this.String.remove(currentBrush, _prefix + "_");
		}

		currentBrush = this.String.remove(currentBrush, "red_");
		currentBrush = this.String.remove(currentBrush, "grey_");
		currentBrush = this.String.remove(currentBrush, "black_");
		currentBrush = this.String.remove(currentBrush, "brown_");
		currentBrush = this.String.remove(currentBrush, "blonde_");

		if (_suffix != "")
		{
			currentBrush = this.String.remove(currentBrush, "_" + _suffix);
		}

		foreach( i, s in _list )
		{
			if (s == currentBrush)
			{
				index = i;
				break;
			}
		}

		index = index + _change;

		if (index >= _list.len())
		{
			index = 0;
		}
		else if (index < 0)
		{
			index = _list.len() - 1;
		}

		if (_list[index] != "")
		{
			local brush = _prefix + (_prefix != "" ? "_" : "") + _midfix + (_midfix != "" ? "_" : "") + _list[index] + (_suffix != "" ? "_" : "") + _suffix;

			if (this.doesBrushExist(brush))
			{
				_sprite.setBrush(brush);
			}
			else
			{
				_sprite.resetBrush();
			}
		}
		else
		{
			_sprite.resetBrush();
		}
	}

});

