this.nachzehrer_potion_item <- this.inherit("scripts/items/misc/anatomist/anatomist_potion_item", {
	m = {},
	function create()
	{
		this.anatomist_potion_item.create();
		this.m.ID = "misc.nachzehrer_potion";
		this.m.Name = "血肉编织药剂";
		this.m.Description = "如果你能把一种行为恐怖的外在表现与它的实际效用分开看待，那么在本质上而言，没有什么现象能比食尸鬼通过吞吃死者的血肉来恢复健康的能力更神奇了。重大突破！人类现在也可以获得这种强大的再生能力了，而且还不用犯下丧尽天良的食人罪！";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/potion_36.png";
		this.m.Value = 0;
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
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

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
			id = 11,
			type = "text",
			icon = "ui/icons/days_wounded.png",
			text = "所有伤残的恢复时长减少一天，最短一天"
		});
		result.push({
			id = 65,
			type = "text",
			text = "右键单击或拖动到当前选定的角色上进行饮用。 此物品会在使用过程中消耗掉。"
		});
		result.push({
			id = 65,
			type = "hint",
			icon = "ui/tooltips/warning.png",
			text = "会让使用者的身体发生突变并导致疾病"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		_actor.getSkills().add(this.new("scripts/skills/effects/nachzehrer_potion_effect"));
		return this.anatomist_potion_item.onUse(_actor, _item);
	}

});

