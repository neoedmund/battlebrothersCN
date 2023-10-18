this.southern_quickstart_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.southern_quickstart_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_156.png[/img]{你本可以留在家乡。从未离开过小镇。 为维齐尔干活度日。 然而，你拿起宝剑，搜刮镀金者施舍给你的些许钱财，并组建了一支雇佣军。\n\n作为逐币者的日子让你见识了绝大部分人从未见过的地方。 从某种意义上，你已经通过暴力开凿出了自己的门路。 然而这些年来你慢慢发现一个难堪的事实：你不比一个强盗好多少。 你被当地人用浅薄的报酬雇佣去处理一些简单的事情然后被派往该去的地方。 你想要 %companyname% 做大做强。 你想要你的战团出现在维齐尔的办公室里，你想让它获得它应得的荣耀，也许甚至想北上遥远之地。 见鬼，也许在北方他们会很尊重雇佣兵！\n\n当然，这一切并不容易。 你手头只有几个人。 但这些人是 %bro1%，%bro2%，和 %bro3%，你所知最好的战士。 有他们在你身边，全世界都将知晓 %companyname%！}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "这个Gilder will reveal to us the way.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The " + this.World.Assets.getName();
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"bro1",
			brothers[0].getName()
		]);
		_vars.push([
			"bro2",
			brothers[1].getName()
		]);
		_vars.push([
			"bro3",
			brothers[2].getName()
		]);
	}

	function onClear()
	{
	}

});

