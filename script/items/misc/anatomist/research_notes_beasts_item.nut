this.research_notes_beasts_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.research_notes_beasts";
		this.m.Name = "怪兽解剖指南";
		this.m.Description = "一篇关于世界上所存在的各种怪兽的论文。书中关于那些最有趣——而且确实存在的生物的段落附近所有的空白都被笔记和注释填满了。";
		this.m.Icon = "misc/inventory_anatomists_book_03.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc;
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
			icon = "ui/icons/papers.png",
			text = "记录着战团对各种奇禽异兽的研究成果"
		});
		local buffAcquisitions = [
			{
				flag = "is冰原狼PotionDiscovered",
				creatureName = "Direwolf",
				potionName = "刀锋舞者药剂"
			},
			{
				flag = "is食尸鬼PotionDiscovered",
				creatureName = "Nachzehrer",
				potionName = "血肉编织药剂"
			}
		];

		if (this.Const.DLC.林德蠕龙)
		{
			buffAcquisitions.extend([
				{
					flag = "isLindwurmPotionDiscovered",
					creatureName = "Lindwurm",
					potionName = "灰烬之血药剂"
				}
			]);
		}

		if (this.Const.DLC.巨魔)
		{
			buffAcquisitions.extend([
				{
					flag = "is梦魇PotionDiscovered",
					creatureName = "Alp",
					potionName = "午夜君王药剂"
				},
				{
					flag = "is女巫PotionDiscovered",
					creatureName = "Hexe",
					potionName = "怨毒药剂"
				},
				{
					flag = "is树人PotionDiscovered",
					creatureName = "Schrat",
					potionName = "神树根须药剂"
				},
				{
					flag = "isUnholdPotionDiscovered",
					creatureName = "Unhold",
					potionName = "愚者宝藏药剂"
				},
				{
					flag = "is蛛魔PotionDiscovered",
					creatureName = "Webknecht",
					potionName = "毒血药剂"
				}
			]);
		}

		if (this.Const.DLC.Desert)
		{
			buffAcquisitions.extend([
				{
					flag = "is鬣狗PotionDiscovered",
					creatureName = "Hyena",
					potionName = "血门关药剂"
				},
				{
					flag = "is大蛇PotionDiscovered",
					creatureName = "Serpent",
					potionName = "迅牙药剂"
				},
				{
					flag = "is伊夫利特PotionDiscovered",
					creatureName = "Ifrit",
					potionName = "石肤药剂"
				}
			]);
		}

		foreach( buff in buffAcquisitions )
		{
			if (this.World.Statistics.getFlags().get(buff.flag))
			{
				result.push({
					id = 15,
					type = "text",
					icon = "ui/icons/special.png",
					text = "" + buff.creatureName + ": " + buff.potionName
				});
			}
			else
			{
				result.push({
					id = 15,
					type = "text",
					icon = "ui/icons/special.png",
					text = "" + buff.creatureName + ": " + "???"
				});
			}
		}

		return result;
	}

});

