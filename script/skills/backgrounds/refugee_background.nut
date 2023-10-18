this.refugee_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.refugee";
		this.m.Name = "难民";
		this.m.Icon = "ui/backgrounds/background_38.png";
		this.m.BackgroundDescription = "难民缺乏为家园而战的信念，但他们现在已经习惯了漫长而疲惫的旅行。";
		this.m.GoodEnding = "%name%这个难民表现出了他天生的战斗才能，但他最终退役离开了%companyname%。传言称他回到了家乡，目前正在用他所有的财富来帮助重建家乡。";
		this.m.BadEnding = "由于%companyname%的垮台已经板上钉钉，难民%name%离开了战团。他用所剩无几的克朗买了一双鞋，返回家的废墟尝试重建它。在回家的路上，一个不识字的野人杀死了他并吃掉了那双鞋。";
		this.m.HiringCost = 40;
		this.m.DailyCost = 4;
		this.m.Excluded = [
			"trait.impatient",
			"trait.iron_jaw",
			"trait.athletic",
			"trait.tough",
			"trait.strong",
			"trait.loyal",
			"trait.cocky",
			"trait.fat",
			"trait.bright",
			"trait.fearless",
			"trait.brave",
			"trait.determined",
			"trait.deathwish",
			"trait.greedy",
			"trait.bloodthirsty"
		];
		this.m.Titles = [
			"难民(the Refugee)",
			"幸存者(the Survivor)",
			"远跑(Runsfar)",
			"弃儿(the Derelict)",
			"痛脚(the Surbated)"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsOffendedByViolence = true;
		this.m.IsLowborn = true;
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
		return "{灾难很频繁。 | 疾病，无形的终极之手。 | 无论战争输赢，一切都一如既往。}%name%来自一个小村庄 {—— 这个村庄现在只被口头记住，离被遗忘还有一代人的距离。 | —— 简而言之，已经被摧毁了。 | —— 现在只是一个脚注，很少浪费历史学家的笔墨。 | —— 遭受了这个世界的愤怒。}但%name%是个幸存者。{他只带着身上的衣服逃离了灾难。 | 他的家着火了，他尽可能地救了一些东西，然后逃走了。 | 在偶然发现他死去的家人后，他收拾了能收拾的东西逃跑了。 | 战争、饥荒、恶疾。现在对他来说一切都是模糊的记忆。}{%name%只是一个急于向前看而不愿向后看的人。 | %name%除了坚定的决心之外，几乎没有什么值得一提的。但是，坚定的决心是值得拥有的东西。 | 一段可怕的过往让他伤痕累累，目光呆滞，但他很容易就被激励着去不再经历过去。 | 不管他的镇子发生了什么，他并没有中招，从你听到的传言来看，这是一件值得称道的事情。 | 这个人并不精于武艺，但绝对有着活下去的决心。 | 他过去的工作现在都不复存在了。就像许多其他人一样，他在这个日益血腥的世界里寻求佣兵的活计。 | 他是你见过的众多难民中的一个，这人已经决定停止逃跑，开始战斗。}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-8,
				-5
			],
			Bravery = [
				-5,
				-5
			],
			Stamina = [
				7,
				5
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				1,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/sackcloth"));
		}
	}

});

