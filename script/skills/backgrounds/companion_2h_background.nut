this.companion_2h_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.companion";
		this.m.Name = "伙伴";
		this.m.Icon = "ui/traits/trait_icon_32.png";
		this.m.HiringCost = 0;
		this.m.DailyCost = 14;
		this.m.DailyCostMult = 1.0;
		this.m.Excluded = [
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.impatient",
			"trait.asthmatic",
			"trait.greedy",
			"trait.clubfooted",
			"trait.drunkard",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.dexterous"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.GoodEnding = "%name%从一开始就跟随你，退休后也跟着你，在你离开战团不久后也离开了。但他还没有结束战斗的生活，而是开始为另一个战团而战 —— 他自己的战团。他在你的领导下学到了很多，像你自己儿子一样令你感到自豪。讽刺的是，他讨厌你扮演他父亲的角色，而你总是告诉他你绝不可能做这么难看的儿子的爸爸。你们一直保持联系到如今。";
		this.m.BadEnding = "%name%从一开始就跟随着你，他既忠诚又有才华。他在战团呆了一段时间，最终离开自行开创事业。前几天，你收到了一封来自这位雇佣兵的信，他在信中表示已经开创了自己的战团，并急需帮助。不幸的是，这封信是将近一年之前寄出的。当你调查了他的战团的存在时，你得知它已经在贵族间的一场战斗中被彻底摧毁了。";
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsUntalented = true;
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
		return "郁郁寡欢有时又有点自我毁灭倾向，经常看到%name%只带着把巨大的双手武器投入战斗并不令人惊讶。{他充满了杀意，你曾经目睹他把一个人一分为二 —— 从上到下。 | 据说他曾经把一个兽人战士劈成两半，只留下它的腿立在那儿。 | 大伙都知道，他为了结束他人的性命而不在意自己肉体的同样脆弱。 | 他喜欢身处战斗的核心地带，在那里他可以毫不顾忌安全和精准地挥舞武器。 | 据说，他曾经赢得过一次马上骑枪比武，但不得不在与一位观看比赛的贵族的妻子上床后逃跑。 | 这个人并不是个杀手，但他本来可以成为一个出色的杀手。 | 有时看起来势不可挡，你很高兴这男人是你这边的。 | 在一次充满嗜血的愤怒冲动中，他曾经用一根长矛刺穿了两只地精。 | 是个强壮的猛兽，你曾经看到%name%一个后挥就杀了一个人。}他会使用你给他的任何武器，但是%name%倾向于那些能对肉体造成灾难性毁灭的武器。";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"1h",
			brothers.len() >= 1 ? brothers[0].getName() : ""
		]);
		_vars.push([
			"2h",
			brothers.len() >= 2 ? brothers[1].getName() : ""
		]);
		_vars.push([
			"ranged",
			brothers.len() >= 3 ? brothers[2].getName() : ""
		]);
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				5
			],
			Bravery = [
				10,
				5
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				10,
				5
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				2,
				0
			],
			RangedDefense = [
				2,
				0
			],
			Initiative = [
				-5,
				0
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 3) == 3)
		{
			local actor = this.getContainer().getActor();
			actor.setTitle(this.Const.Strings.SellswordTitles[this.Math.rand(0, this.Const.Strings.SellswordTitles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 1;
		talents[this.Const.Attributes.Bravery] = 1;
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}
	}

});

