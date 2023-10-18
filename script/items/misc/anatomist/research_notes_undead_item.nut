this.research_notes_undead_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.research_notes_undead";
		this.m.Name = "亡灵样本图鉴";
		this.m.Description = "一本写满了民间故事、验尸记录、尸检笔记和一个所谓的亡灵巫师的疯狂涂鸦的笔记簿，你们对不死亡灵所知的一切尽数记载其中。";
		this.m.Icon = "misc/inventory_anatomists_book_02.png";
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
			text = "记录着战团对不死亡灵的研究成果"
		});
		local buffAcquisitions = [
			{
				flag = "isSkeletonWarriorPotionDiscovered",
				creatureName = "远古骷髅(Ancient Skeleton)",
				potionName = "不眠药剂"
			},
			{
				flag = "isHonorGuardPotionDiscovered",
				creatureName = "古代仪仗队",
				potionName = "血肉化骨药剂"
			},
			{
				flag = "isAncientPriestPotionDiscovered",
				creatureName = "古代祭司",
				potionName = "懦夫之勇药剂"
			},
			{
				flag = "is死灵学者PotionDiscovered",
				creatureName = "Necrosavant",
				potionName = "暗夜行者药剂"
			},
			{
				flag = "is僵尸PotionDiscovered",
				creatureName = "Wiederganger",
				potionName = "厚皮药剂"
			},
			{
				flag = "isFallenHeroPotionDiscovered",
				creatureName = "堕落的英雄",
				potionName = "稳固药剂"
			},
			{
				flag = "is幽灵PotionDiscovered",
				creatureName = "Geist",
				potionName = "不死人药剂"
			},
			{
				flag = "is死灵法师PotionDiscovered",
				creatureName = "Necromancer",
				potionName = "咒缚之王药剂"
			}
		];

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
					text = "" + buff.creatureName + ": ???"
				});
			}
		}

		return result;
	}

});

