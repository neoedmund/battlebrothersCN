this.negotiator_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.negotiator";
		this.m.Name = "谈判者";
		this.m.Description = "谈判家的家是高贵的法院和华丽的大厅，并不习惯与一群身穿泥泞靴的佣兵一起旅行，但他是社交关系和合同谈判的专家。";
		this.m.Image = "ui/campfire/negotiator_01";
		this.m.Cost = 3000;
		this.m.Effects = [
			"允许与潜在雇主进行更多轮的合同谈判，而且不会对关系造成任何影响",
			"使与任何派系的良好关系衰退得更慢，而不良关系恢复得更快"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = ""
			}
		];
	}

	function onUpdate()
	{
		this.World.Assets.m.NegotiationAnnoyanceMult = 0.5;
		this.World.Assets.m.AdvancePaymentCap = 0.75;
		this.World.Assets.m.RelationDecayGoodMult = 0.85;
		this.World.Assets.m.RelationDecayBadMult = 1.15;
	}

	function onNewDay()
	{
		this.onUpdate();
	}

	function onEvaluate()
	{
		this.m.Requirements[0].Text = "完成了。" + this.Math.min(15, this.World.Contracts.getContractsFinished()) + "/15 合同";

		if (this.World.Contracts.getContractsFinished() >= 15)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}
	}

});

