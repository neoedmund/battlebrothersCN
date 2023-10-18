this.ammo_item <- this.inherit("scripts/items/item", {
	m = {
		Amount = 0
	},
	function isAmountShown()
	{
		return true;
	}

	function getAmountString()
	{
		return this.m.Amount;
	}

	function getAmount()
	{
		return this.m.Amount;
	}

	function setAmount( _a )
	{
		this.m.Amount = this.Math.floor(_a);
	}

	function create()
	{
		this.m.ID = "supplies.ammo";
		this.m.Name = "弹药";
		this.m.Icon = "supplies/ammo.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Supply;
		this.m.IsConsumed = true;
		this.m.Value = 100;
		this.m.Amount = 50;
	}

	function getValue()
	{
		return this.Math.floor(this.m.Amount / 50.0 * this.m.Value);
	}

	function getBuyPrice()
	{
		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			local isBuildingPresent = this.World.State.getCurrentTown().hasAttachedLocation("attached_location.fletchers_hut") || this.World.State.getCurrentTown().hasBuilding("building.fletcher");
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.Const.Difficulty.BuyPriceMult[this.World.Assets.getEconomicDifficulty()] * this.World.State.getCurrentTown().getBuyPriceMult() * (isBuildingPresent ? 1.0 : 1.5)));
		}

		return this.item.getBuyPrice();
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = "不错的[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Amount + "[/color]单位弹药——弓箭、弩箭、标枪，用于在战斗后自动补充箭袋。一旦你重新进入世界地图，将被添加到你的全局库存中。"
			}
		];

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

	function consume()
	{
		this.World.Assets.addAmmo(this.m.Amount);
	}

});

