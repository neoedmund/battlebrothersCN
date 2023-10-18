this.scavenger_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.scavenger";
		this.m.Name = "拾荒者";
		this.m.Description = "无论是你某个伙计的儿子，还是你拽进来的流浪儿，拾荒者都会从每一个战场上收集零碎的东西。";
		this.m.Image = "ui/campfire/scavenger_01";
		this.m.Cost = 3000;
		this.m.Effects = [
			"回收一部分你在战斗中使用的弹药",
			"从战斗中被你摧毁的每一件盔甲中回收工具和补给"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "有一颗心"
			}
		];
	}

	function onUpdate()
	{
		this.World.Assets.m.IsRecoveringAmmo = true;
		this.World.Assets.m.IsRecoveringArmor = true;
	}

	function onEvaluate()
	{
		this.m.Requirements[0].IsSatisfied = true;
	}

});

