this.paladin_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.paladin";
		this.m.Name = "执誓者";
		this.m.Icon = "ui/backgrounds/background_69.png";
		this.m.BackgroundDescription = "执誓者是勇敢的战士，他们宣誓遵守严格的规则，对战斗并不陌生。守誓者";
		this.m.GoodEnding = "执誓者%name%留在了%companyname%，手持小安瑟姆的头骨，向世界传播骑士的美德。大多数人认为他有些烦人，但一个完全相信荣誉、自豪和善行的人也有些迷人之处。据你所知，他独自一人从一伙街头小偷手中拯救了一位领主的公主。为了庆祝，他娶了这位少女，尽管有传言称她在床上不开心，声称那执誓者坚持让小安瑟姆的头骨在角落里观看。无论发生了什么，你很高兴这个人仍然全力以赴地做着他的事情。";
		this.m.BadEnding = "%name%曾经是名忠诚的执誓者，但最终对他的同伴失望透顶。有一天晚上他梦到他们自己，实际上，才是真正的异端。于是，他杀死了身边所有的执誓者并逃离，最终加入了守誓者。据最后一次听到的消息，他夺回了小安瑟姆的头骨，并用锤子将其粉碎。愤怒之下，他的新守誓者兄弟们立即将他杀死。%name%的尸体上发现了一百多处刺伤，头骨的碎片覆满了鲜血淋漓、狂笑着的面容。";
		this.m.HiringCost = 150;
		this.m.DailyCost = 22;
		this.m.Titles = [
			"圣战士(the Crusader)",
			"狂信者(the Zealot)",
			"尽责者(the Pious)",
			"虔诚者(the Devoted)",
			"圣武士(the Paladin)",
			"正义者(the Righteous)",
			"誓缚者(the Oathbound)",
			"誓言守护者(the Oathsworn)",
			"高尚者(the Virtuous)"
		];
		this.m.Excluded = [
			"trait.ailing",
			"trait.asthmatic",
			"trait.bleeder",
			"trait.bright",
			"trait.clubfooted",
			"trait.clumsy",
			"trait.craven",
			"trait.dastard",
			"trait.disloyal",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fragile",
			"trait.greedy",
			"trait.hesitant",
			"trait.insecure",
			"trait.paranoid",
			"trait.tiny",
			"trait.tough",
			"trait.weasel"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.RangedSkill
		];
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.BeardChance = 60;
		this.m.Level = this.Math.rand(1, 3);
		this.m.IsCombatBackground = true;
	}

	function getTooltip()
	{
		return [
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
	}

	function onBuildDescription()
	{
		return "{Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers. Oathbringers!\n\nOathbringers Oathbringers Oathbringers Oathbringers Oathbringers Oathbringers!!!\n\nOATHBRINGERS OATHBRINGERS OATHBRINGERS!!! | %name% is a diligent follower of the famed founder of the Oathtakers, Young Anselm. He believes himself blessed to be in the company of likeminded men who, thought not without fault, will try and do right in the world. | Some say %name% was an Oathtaker the moment he was born. It is the man himself who says this most often, though, which leads to some speculation that he was almost assuredly a terrible degenerate and he\'s just now making up for a horrific past. | When you think of an Oathtaker, %name% is about as clean as they come. Keeps his uniform and armor nice and tidy. Respects his superiors but is never mawkish. And he\'s absolutely excellent at directing steel through an Oathbringer\'s face. An outstanding Oathtaker if there ever was one. | Living in a faraway land, chasing honor and bringing death to Oathbringers, %name% heard of the %companyname%\'s prestigious past and just had to find it and join up. He is a man of incredible resolve and most importantly he does not truck with Oathbringers. | Young Anselm\'s spirit has brought %name% to the %companyname%. Or so he says. Whatever brought him into the company, he is no doubt a talented fighter and will serve the outfit well. | The majesty of Young Anselm\'s spirit cannot be taken for granted. At least that is what %name% believes. He states that he is fights on behalf of the dead Oathtaker. Young Anselm must have been a spirited fellow indeed for this man is a wicked talent with any steel.  | Like many Oathtakers, %name% knows three divine elements: Young Anselm\'s spirit is to be cherished, Oaths are to be taken seriously, and all Oathbringers must die. Earning some coin on the side is also nice, which is why he has made his \'fourth\' element fighting for outfits like the %companyname%. | It is a little peculiar for an Oathtaker to earn a sellsword\'s coin fighting, but %name% states that it was never forbidden by Young Anselm\'s teachings. Instead, it is the personal responsibility of the individual Oathtakers to maintain their oaths, which he can readily do cleaving enemies for the %companyname%. | %name% carries a ledger dedicated to only one kind of inventory: how many Oathbringers he\'s killed. He even has a list of when and where he did the deed, and of course how. The \"how\" entries even get a little extra dedication, with lines and lines meticulously describing how he dispatched his hated foes. Frankly, you like the man\'s enthusiasm. | %name%, a Oathtaker, is of such a singular mind it has you almost worried what he\'d do without Young Anselm\'s directives. Now, that said, a part of you is curious how he\'d fare dedicating himself to another craft. With his resolve and drive, he could probably weave an unbelievable basket, possibly even do it underwater like those learned experts. | %name% is everything one would want in an honorable man: smart, fit, and quite good swinging some steel. His dedication to the Oaths is only matched by his ability to absolutely demolish those who stand in his way. A perfect fit for the %companyname%, truly. | With the %companyname% gaining renown, it is becoming one of the more notable outfits in the land. Naturally, a talented and honorable man like %name% would seek to join up, albeit at a cost. His services to Young Anselm\'s cause mean his attention is no doubt split, but even being consumed by righteousness he is still an indefatigable fighter worth having in the %companyname%.}";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 30)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				6
			],
			Bravery = [
				13,
				16
			],
			Stamina = [
				0,
				-4
			],
			MeleeSkill = [
				13,
				10
			],
			RangedSkill = [
				-2,
				-3
			],
			MeleeDefense = [
				4,
				5
			],
			RangedDefense = [
				-10,
				-5
			],
			Initiative = [
				13,
				12
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		if (items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
		{
			local weapons = [
				"weapons/arming_sword",
				"weapons/fighting_axe",
				"weapons/winged_mace",
				"weapons/military_pick",
				"weapons/warhammer",
				"weapons/billhook",
				"weapons/longaxe",
				"weapons/greataxe",
				"weapons/greatsword"
			];

			if (this.Const.DLC.Unhold)
			{
				weapons.extend([
					"weapons/longsword",
					"weapons/polehammer",
					"weapons/two_handed_flail",
					"weapons/two_handed_flanged_mace"
				]);
			}

			if (this.Const.DLC.Wildmen)
			{
				weapons.extend([
					"weapons/bardiche"
				]);
			}

			items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}

		if (items.hasEmptySlot(this.Const.ItemSlot.Offhand) && this.Math.rand(1, 100) <= 75)
		{
			local shields = [
				"shields/wooden_shield",
				"shields/wooden_shield",
				"shields/heater_shield",
				"shields/kite_shield"
			];
			items.equip(this.new("scripts/items/" + shields[this.Math.rand(0, shields.len() - 1)]));
		}

		r = this.Math.rand(0, 5);

		if (r < 3)
		{
			items.equip(this.new("scripts/items/armor/adorned_mail_shirt"));
		}
		else if (r < 5)
		{
			items.equip(this.new("scripts/items/armor/adorned_warriors_armor"));
		}
		else if (r == 5)
		{
			items.equip(this.new("scripts/items/armor/adorned_heavy_mail_hauberk"));
		}

		r = this.Math.rand(0, 5);

		if (r < 3)
		{
			items.equip(this.new("scripts/items/helmets/heavy_mail_coif"));
		}
		else if (r < 5)
		{
			items.equip(this.new("scripts/items/helmets/adorned_closed_flat_top_with_mail"));
		}
		else if (r == 5)
		{
			items.equip(this.new("scripts/items/helmets/adorned_full_helm"));
		}
	}

});

