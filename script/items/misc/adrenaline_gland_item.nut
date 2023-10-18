this.adrenaline_gland_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.adrenaline_gland";
		this.m.Name = "肾上腺";
		this.m.Description = "冰原狼的疯狂和嗜血可以归因于这个腺体产生的物质。某个地方的某个人可能会用得上它。";
		this.m.Icon = "misc/inventory_wolf_adrenaline.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 400;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/cleave_hit_hitpoints_01.wav", this.Const.Sound.Volume.Inventory);
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

