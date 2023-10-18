this.converted_cultist_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.converted_cultist";
		this.m.Name = "邪教徒";
		this.m.Icon = "ui/backgrounds/background_34.png";
		this.m.HiringCost = 45;
		this.m.DailyCost = 4;
		this.m.Excluded = [
			"trait.athletic",
			"trait.bright",
			"trait.drunkard",
			"trait.dastard",
			"trait.gluttonous",
			"trait.insecure",
			"trait.disloyal",
			"trait.hesitant",
			"trait.fat",
			"trait.bright",
			"trait.greedy",
			"trait.craven",
			"trait.fainthearted"
		];
		this.m.Titles = [
			"邪教徒(the Cultist)",
			"疯子(the Mad)",
			"信徒(the Believer)",
			"疯狂者(the Insane)"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
	}

	function onBuildDescription()
	{
		return "这个人曾经是谁已经不重要了。现在他的额头上有达库尔的印记，虽然他的嘴唇尚未掌握新发现宗教的言语，但是却用熟悉的语调谈论邪教的魅力。黑暗，他说，即将降临。";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (!tattoo_body.HasBrush && this.Math.rand(1, 100) <= 50)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("tattoo_01_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		actor.setDirty(true);
	}

});

