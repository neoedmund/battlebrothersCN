this.heavily_armored_wardog_item <- this.inherit("scripts/items/accessory/wardog_item", {
	m = {},
	function create()
	{
		this.wardog_item.create();
		this.m.ID = "accessory.heavily_armored_wardog";
		this.m.Description = "忠诚而强壮的狗，为战争而饲养。可以在战斗中释放用以侦查，追踪或追捕逃跑的敌人。这狗穿着的重型兽皮护甲提供了很好的防护。";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.ArmorScript = "scripts/items/armor/special/wardog_heavy_armor";
		this.m.Value = 600;
	}

	function setEntity( _e )
	{
		this.m.Entity = _e;

		if (this.m.Entity != null)
		{
			this.m.Icon = "tools/dog_01_leash_70x70.png";
		}
		else
		{
			this.m.Icon = "tools/dog_01_0" + this.m.Variant + "_armor_02_70x70.png";
		}
	}

});

