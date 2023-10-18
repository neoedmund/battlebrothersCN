this.ifrit_potion_item <- this.inherit("scripts/items/misc/anatomist/anatomist_potion_item", {
	m = {},
	function create()
	{
		this.anatomist_potion_item.create();
		this.m.ID = "misc.ifrit_potion";
		this.m.Name = "石肤药剂";
		this.m.Description = "有了这种药剂，一个平平无奇普通人也可以变成南方沙漠的伊芙利特那般可怕的敌手！长出诡异的石头皮肤，笑看你敌人的武器在你身上磕出豁口的模样吧！副作用可能包括全身瘙痒。";
		this.m.IconLarge = "";
		this.m.Icon = "consumables/potion_28.png";
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
			icon = "ui/icons/armor_body.png",
			text = "使皮肤变硬如石头，增加[color=" + this.Const.UI.Color.PositiveValue + "]25[/color] 天然护甲点数"
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
		_actor.getSkills().add(this.new("scripts/skills/effects/ifrit_potion_effect"));
		return this.anatomist_potion_item.onUse(_actor, _item);
	}

});

