this.ghoul_brain_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.ghoul_brain";
		this.m.Name = "食尸鬼大脑";
		this.m.Description = "被杀死的食尸鬼的油腻大脑。你想要用它做点什么呢？";
		this.m.Icon = "misc/inventory_ghoul_brain.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 200;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function getSellPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function getBuyPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

});

