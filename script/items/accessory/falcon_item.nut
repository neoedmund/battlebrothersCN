this.falcon_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		IsReleased = false
	},
	function isAllowedInBag()
	{
		return false;
	}

	function isReleased()
	{
		return this.m.IsReleased;
	}

	function setReleased( _r )
	{
		this.m.IsReleased = _r;

		if (!this.m.IsReleased)
		{
			this.m.Icon = "tools/falcon.png";
		}
		else
		{
			this.m.Icon = "tools/falcon_released.png";
		}
	}

	function getName()
	{
		if (this.m.IsReleased)
		{
			return this.item.getName() + "（已释放）";
		}
		else
		{
			return this.item.getName();
		}
	}

	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.falcon";
		this.m.Name = "猎鹰";
		this.m.Description = "一只训练有素的猎鹰。可在战斗中释放来寻找隐藏的敌人。";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "";
		this.m.Icon = "tools/falcon.png";
		this.m.Value = 800;
	}

	function getTooltip()
	{
		local result = this.accessory.getTooltip();
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/inventory/hawk_inventory_0" + this.Math.rand(1, 2) + ".wav", this.Const.Sound.Volume.Inventory);
	}

	function onEquip()
	{
		this.accessory.onEquip();
		local skill = this.new("scripts/skills/actives/release_falcon_skill");
		skill.setItem(this);
		this.addSkill(skill);
	}

	function onCombatFinished()
	{
		this.setReleased(false);
	}

});

