this.minstrel_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.minstrel";
		this.m.Name = "吟游诗人";
		this.m.Description = "好的歌曲和故事在塑造一个公司的声誉中扮演着重要的角色。 吟游诗人是这些技能的大师，并将帮助传播你的事迹，无论听到它们的耳朵是否乐意。";
		this.m.Image = "ui/campfire/minstrel_01";
		this.m.Cost = 2000;
		this.m.Effects = [
			"所有行动都会获得额外 15% 的名望",
			"使酒馆谣言更有可能包含有用的信息"
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
		this.World.Assets.m.BusinessReputationRate *= 1.15;
		this.World.Assets.m.IsNonFlavorRumorsOnly = true;
	}

	function onEvaluate()
	{
		local定居点 = this.World.EntityManager.getSettlements();
		local settlements访问了= 0;
		local maxSettlements = settlements.len();

		foreach( s in settlements )
		{
			if (s.isVisited())
			{
				settlementsVisited = ++settlementsVisited;
			}
		}

		this.m.Requirements[0].Text = "Visited " + settlementsVisited + "/" + maxSettlements + " settlements";

		if (settlementsVisited >= maxSettlements)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}
	}

});

