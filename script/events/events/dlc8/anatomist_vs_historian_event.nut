this.anatomist_vs_historian_event <- this.inherit("scripts/events/event", {
	m = {
		Historian = null
	},
	function create()
	{
		this.m.ID = "event.anatomist_vs_historian";
		this.m.Title = "露营时……";
		this.m.Cooldown = 9999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_40.png[/img]{%historian% 这位历史学家正在和解剖学家发生某种种类的纷争。你走过去看到%historian%拿着一本充满人体描述和图像的书。他说这是人类已知的最准确的人体描绘，但解剖学家们嗤之以鼻，说这样的书根本不存在，因为他们还没有写出这样的书。你很感兴趣，翻开了这本书。这些图画表现人类仿佛是一些非常长的蠕虫，它们流向心脏然后再流回去，每一条专门穿过一个特定的部位。其他的页面展示出身体器官的布局，展示肺、肾、肝脏等等。它似乎很详细，但你并不确定在这种情况下谁是正确的。%SPEECH_ON%不要信那本书的谎言，队长。让我们解剖学家来做我们的工作，这些可怕的文献应该扔到该去的地方。%SPEECH_OFF%历史学家非常愤怒地从你手中夺过这本书，并向他们展示了一页。上面展示了人类的大脑，并有大量的绳索或线从大脑上延伸出来，沿着脊柱往下延伸。他说这是人类体验的核心，我们所有的经验以及思考都存在于这个器官里。再一次，解剖学家们嘲笑起来。历史学家转向你，好像你这个门外汉的观点可以调节这些大脑的情感，现在每个人都在等你的判定。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "我认为这位历史学家是正确的。",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "解剖学家可能对此了解更多。",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Historian.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_64.png[/img]{你叹了口气，毫无知识地说，历史学家是对的。毕竟，如果有人把它写下来了，那么肯定意味着有重要的东西，并且很可能是正确的。这种说法让双方都反对你。甚至历史学家也抗议，尽管你为他辩护。%SPEECH_ON%仅仅因为它被写下来，并不意味着它一定是正确的。%SPEECH_OFF%你叹了口气，问道，谁会浪费墨水在错误的观点上呢？历史学家和解剖学家都嘲笑你坚持这种荒谬的观点。他们一起走开，摇着头嘀咕着什么封建的东西。短暂的瞬间，你想象自己用剑把他们全部杀死，这个画面让你获得了极大的满足，但是你只是想想而已。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "被书呆子欺负。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Historian.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_64.png[/img]{你告诉历史学家解剖学家是经常旅游的，他们肯定已经看过比他那本更伟大、更宏伟的书。解剖学家们转向你。他们说话直截了当。%SPEECH_ON%不，我们没有看过。%SPEECH_OFF%你不确定他们的意思，试图强调你在这个问题上为他们辩护，重申他们肯定读过这方面的书很多。他们再次嘲笑你。%SPEECH_ON%读了很多？读书？难道你没有看到我们来这里不是为了阅读，而是为了行动。我们是行动的人，通过行动我们将发现这个世界上所有的问题，特别是那些有关人和野兽的问题。认为我们凭借阅读得到了这个位置的想法是令我们感到冒犯的。%SPEECH_OFF%叹了口气，你试图解决这个问题，但现在历史学家%historian%也加入进来了。%SPEECH_ON%队长，你也这样看待我吗？认为我只是通过阅读得到这个职位的吗？你知道吗，我也会战斗。这就是我来这里的原因。我希望你不认为我只是偶尔读几本书，做得很少的人。%SPEECH_OFF%你已经忍够了这些家伙，转身离开，听到他们在抱怨你把他们视为纯粹的学究，而不是任何佣兵团都会雇用的战士。一种向他们发起军事决斗的想法浮现在你的脑海中，但你放弃了。还有一个想法是在他们睡觉时将他们杀死。你沉思了一分钟，但也放弃了。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Getting bullied by eggheads.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Historian.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Paladins)
		{
			return;
		}

		if (this.World.Assets.getOrigin().getID() != "scenario.anatomists")
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local anatomistCandidates = [];
		local historianCandidates = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.anatomist")
			{
				anatomistCandidates.push(bro);
			}
			else if (bro.getBackground().getID() == "background.historian")
			{
				historianCandidates.push(bro);
			}
		}

		if (historianCandidates.len() == 0 || anatomistCandidates.len() <= 1)
		{
			return;
		}

		this.m.Historian = historianCandidates[this.Math.rand(0, historianCandidates.len() - 1)];
		this.m.Score = 5 * historianCandidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"historian",
			this.m.Historian.getNameOnly()
		]);
	}

	function onClear()
	{
		this.m.Historian = null;
	}

});

