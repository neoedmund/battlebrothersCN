this.ailing_recovers_event <- this.inherit("scripts/events/event", {
	m = {
		Ailing = null,
		Healer = null
	},
	function create()
	{
		this.m.ID = "event.ailing_recovers";
		this.m.Title = "露营时……";
		this.m.Cooldown = 75.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_05.png[/img]{%ailing%双手张开，像在绷紧的绳索上保持平衡一样在营地周围走着。他转身时点头，一步步地走回来。%SPEECH_ON%这是很长时间以来我第一次感觉好起来。谢谢你，%healer%！%SPEECH_OFF%看来%healer%知道几种方法来治好%ailing%的问题。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "很高兴听到。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Ailing.getImagePath());
				this.Characters.push(_event.m.Healer.getImagePath());
				_event.m.Ailing.improveMood(1.5, "感觉他在很长一段时间内做得最好");

				if (_event.m.Ailing.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Ailing.getMoodState()],
						text = _event.m.Ailing.getName() + this.Const.MoodStateEvent[_event.m.Ailing.getMoodState()]
					});
				}

				_event.m.Ailing.getSkills().removeByID("trait.ailing");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_59.png",
					text = _event.m.Ailing.getName() + "不再生病了"
				});
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Unhold)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates_ailing = [];
		local candidates_healer = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() < 4)
			{
				continue;
			}

			if (bro.getSkills().hasSkill("trait.ailing"))
			{
				candidates_ailing.push(bro);
			}
			else if (bro.getBackground().getID() == "background.monk" || bro.getBackground().getID() == "background.beast_slayer")
			{
				candidates_healer.push(bro);
			}
		}

		if (candidates_ailing.len() == 0 || candidates_healer.len() == 0)
		{
			return;
		}

		this.m.Ailing = candidates_ailing[this.Math.rand(0, candidates_ailing.len() - 1)];
		this.m.Healer = candidates_healer[this.Math.rand(0, candidates_healer.len() - 1)];
		this.m.Score = 5;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"ailing",
			this.m.Ailing.getName()
		]);
		_vars.push([
			"healer",
			this.m.Healer.getName()
		]);
	}

	function onClear()
	{
		this.m.Ailing = null;
		this.m.Healer = null;
	}

});

