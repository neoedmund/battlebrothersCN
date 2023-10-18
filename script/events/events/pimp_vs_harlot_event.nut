this.pimp_vs_harlot_event <- this.inherit("scripts/events/event", {
	m = {
		Minstrel = null,
		Monk = null,
		Tailor = null,
		Dude = null,
		Town = null
	},
	function create()
	{
		this.m.ID = "event.pimp_vs_harlot";
		this.m.Title = "在 %townname%";
		this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_92.png[/img]你在小镇的一栋建筑外面遇见了一个男人和一个女人正在争吵。%SPEECH_ON%为什么我要给你所有的东西？ 所有事都是我做的！%SPEECH_OFF%女人喊道。男人摸了摸下巴，回答道。%SPEECH_ON%我负责拉拢业务！ 如果没有我，你找到的工作吗？%SPEECH_OFF%那个女人看见了你，回过头来问你愿不愿意跟她上床。 她看起来就像是两个圆圈和一个三角，你有点想要来一发。 女人伸出手来，说道。%SPEECH_ON%看？只要我张开双腿，半个世界都准备着和我做生意。%SPEECH_OFF%想当皮条客的人请你对他的“前景”讲点道理。",
			Image = "",
			List = [],
			Options = [
				{
					Text = "有了皮条客才能让你在这个世界里更安全。",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "一个妓女按自己的规则行事没什么错。",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Minstrel != null)
				{
					this.Options.push({
						Text = "看起来我们的吟游诗人有话要说。",
						function getResult( _event )
						{
							return "Minstrel";
						}

					});
				}

				if (_event.m.Monk != null)
				{
					this.Options.push({
						Text = "我们的僧侣有什么想说的吗，对于这场…交易？",
						function getResult( _event )
						{
							return "Monk";
						}

					});
				}

				if (_event.m.Tailor != null)
				{
					this.Options.push({
						Text = "战团里的裁缝可能会提供一些信息。",
						function getResult( _event )
						{
							return "Tailor";
						}

					});
				}
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_92.png[/img]你给出了你的答案。%SPEECH_ON%皮条客给你提供了保护。 只是因为每个摇摆的家伙都想要你两腿之间的东西并不能保证你的安全。 一次最轻微的怠慢也有可能激发一个顾客更加黑暗更加暴力的本性。%SPEECH_OFF% 皮条客点了点头。%SPEECH_ON%对嘛！听他的！%SPEECH_OFF%思考了一会，妓女点了点头，然后突然扇了皮条客一个耳光。 他哀嚎着捂着脸颊。 女人又点了点头。%SPEECH_ON%就这个弱鸡还说要来保护我？日安，先生。%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "该死的。我还以为他是一个厉害的皮条客。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_92.png[/img]带着慈父般的微笑，你搭上了皮条客的肩膀。%SPEECH_ON%你能让一个女人从良，但是却无法让娼妓行业没有女人。%SPEECH_OFF%皮条客仔细思考了一下。 你也是，因为你从来就不是一个逻辑感很强的人。 皮条客看了向你。%SPEECH_ON%什么？%SPEECH_OFF%那个女士走上前来，搭上了皮条客的另一边肩膀。%SPEECH_ON%我认为他的意思是让你摆脱我。%SPEECH_OFF%皮条客挑了挑眉毛，女人解释道。%SPEECH_ON%打个比方来说。%SPEECH_OFF%皮条客叹了一口气。%SPEECH_ON%我就没听懂你们两个在说什么，但是好吧。 我认为我在这可以做成一单生意。 这一个女人，那一个女人，出售各种各样的东西，挣一些克朗，早早地退休。 好吧，回去磨小麦吧，直到我再也干不下去，死了为止。%SPEECH_OFF%男人一边走一边对你们嗤之以鼻。",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "皮条客游戏并非适合所有人。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "Minstrel",
			Text = "[img]gfx/ui/events/event_92.png[/img]%minstrel% 这个吟游诗人向前走了两步。%SPEECH_ON%噢，这不就是一个傻瓜和一个妓女的故事吗？ 我一眼就看出来你应该怎么做：向他们解释一下什么是永恒的爱！%SPEECH_OFF%女人叉着手，抬了抬眉毛。%SPEECH_ON%你到底再说什－%SPEECH_OFF%吟游诗人抬起了手，用歌咏般的语调打断她的话。%SPEECH_ON%啊哈！爱，是的，爱无处不在。 最好让它爆发！我说的不仅仅是他的鸡鸡和蛋蛋。 他爱你，亲爱的，你还没有发现吗？ 他为什么只和你一起从事娼妓行业？ 一个皮条客需要多种多样的职员，而不是唯一神圣的那一个哦，哦哦。%SPEECH_OFF%皮条客低下了头，羞红了脸。 他承认这是真的，所有都是真的。 女人的目光飘向了远方，脸色发红。 他们的目光相遇了。你滚你的。 最终两人拥抱在了一起，尽情地卿卿我我起来。%minstrel% 挠了挠脸颊。%SPEECH_ON%虽然我是个诗人，但是甚至没有…意识到这个。%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "真是干得漂亮，吟游诗人。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Minstrel.getImagePath());
				_event.m.Minstrel.improveMood(2.0, "被他自己的诗迷住了");

				if (_event.m.Minstrel.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Minstrel.getMoodState()],
						text = _event.m.Minstrel.getName() + this.Const.MoodStateEvent[_event.m.Minstrel.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "Tailor",
			Text = "[img]gfx/ui/events/event_92.png[/img]\'啧啧啧\'，%tailor% 抬头挺胸地站起来，摇着头。 他用手指划过妓女的裙子。 他说道：他认为妓女们应该都是美丽的。 皮条客举起了他的手。%SPEECH_ON%你这是在侮辱我的财产。%SPEECH_OFF%%tailor% 鞠了一躬。%SPEECH_ON%不好意思，先生，但是我确定你让她穿成这样已经是对她的侮辱了。 我不知道她是否是为了不要让你用一个皮条客的，额，懒洋洋的经济眼光来对着她吼叫。%SPEECH_OFF%皮条客掏出了匕首，猛地刺向裁缝。 裁缝侧身一让，堪堪避过了利刃。 他立刻回过身来，把一把剪刀架在了皮条客的脖子上。%SPEECH_ON%嗯，这是一个多么奇怪姿势。 我敢说你现在只有两条路可走，而且一条比另一条要窄得多。 是的，没错，你明白了，不是吗？ 赔款，否则我就割开你的喉咙，解决你这个麻烦，而且我的要求会让你大吃一惊。%SPEECH_OFF%皮条客匆忙地掏出了一些克朗来拯救他的生命。 裁缝合拢了他的剪刀，收回了他的口袋。%SPEECH_ON%好的。现在是一些建议。 你可以在街那头买到一些便宜的亚麻布。 在店里工作的那个男人，嗯，特别擅长给女人装衣服…还有男人。再会。%SPEECH_OFF%%tailor% 裁缝看向你，笑了笑，问道他是不是可以走了，去店里花他刚刚挣的钱。",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "很出色。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local money = this.Math.rand(100, 200);
				this.World.Assets.addMoney(money);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "你获得了 [color=" + this.Const.UI.Color.PositiveEventValue + "]" + money + "[/color] 克朗"
				});
				_event.m.Tailor.getBaseProperties().Initiative += 2;
				_event.m.Tailor.getSkills().update();
				this.List.push({
					id = 17,
					icon = "ui/icons/initiative.png",
					text = _event.m.Tailor.getName() + " 获得了 [color=" + this.Const.UI.Color.PositiveEventValue + "]+2[/color] 主动性"
				});
				this.Characters.push(_event.m.Tailor.getImagePath());
				_event.m.Tailor.improveMood(1.0, "把一个皮条客剪成合适的尺寸");

				if (_event.m.Tailor.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Tailor.getMoodState()],
						text = _event.m.Tailor.getName() + this.Const.MoodStateEvent[_event.m.Tailor.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "Monk",
			Text = "[img]gfx/ui/events/event_92.png[/img]%monk% 这个僧侣走上前。 他抓住皮条客的手。 如果你那样做，皮条客肯定会退缩或打你。 但这位圣人是如此优雅和谦逊，皮条客只是盯着他看。 僧侣热情地笑了。%SPEECH_ON%这不是你要走的路，这一点很清楚。 你没有办法对付这个女人，而这只是一个女人，而皮条客需要很多。 古神告诉我，你注定要走另一条路，一条适合更坚强的人的路。 我想说你适合加入一个雇佣兵战团。 把女人们的争吵留给蛇头吧。%SPEECH_OFF%皮条客想了一会儿，但你可以看出他已经被这些话打动了。 他问你是否愿意接受他加入你的战团。",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "好的，我们带着你。",
					function getResult( _event )
					{
						this.World.getPlayerRoster().add(_event.m.Dude);
						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "不了，谢谢。",
					function getResult( _event )
					{
						this.World.getTemporaryRoster().clear();
						_event.m.Dude = null;
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Monk.improveMood(1.0, "带领一个人回到正确的道路上");

				if (_event.m.Monk.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Monk.getMoodState()],
						text = _event.m.Monk.getName() + this.Const.MoodStateEvent[_event.m.Monk.getMoodState()]
					});
				}

				this.Characters.push(_event.m.Monk.getImagePath());
				local roster = this.World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.setStartValuesEx([
					"pimp_background"
				]);
				_event.m.Dude.setTitle("皮普(The Pimp)");
				_event.m.Dude.getBackground().m.RawDescription = "访问期间 (While visiting)" + _event.m.Town.getName() + "，你发现 %name% 正在和他唯一的妓女争吵。" + _event.m.Monk.getName() + "说服他加入了战团，你同意带他一起走。希望他在盾墙里战斗比和妓女吵架更好。";
				_event.m.Dude.getBackground().buildDescription(true);
				this.Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getSize() >= 2 && !t.isMilitary() && !t.isSouthern() && t.getTile().getDistanceTo(playerTile) <= 3 && t.isAlliedWithPlayer())
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 3)
		{
			return;
		}

		local candidate_minstrel = [];
		local candidate_monk = [];
		local candidate_tailor = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.minstrel")
			{
				candidate_minstrel.push(bro);
			}
			else if (bro.getBackground().getID() == "background.monk")
			{
				candidate_monk.push(bro);
			}
			else if (bro.getBackground().getID() == "background.tailor")
			{
				candidate_tailor.push(bro);
			}
		}

		if (candidate_minstrel.len() != 0)
		{
			this.m.Minstrel = candidate_minstrel[this.Math.rand(0, candidate_minstrel.len() - 1)];
		}

		if (candidate_monk.len() != 0)
		{
			this.m.Monk = candidate_monk[this.Math.rand(0, candidate_monk.len() - 1)];
		}

		if (candidate_tailor.len() != 0)
		{
			this.m.Tailor = candidate_tailor[this.Math.rand(0, candidate_tailor.len() - 1)];
		}

		this.m.Town = town;
		this.m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"minstrel",
			this.m.Minstrel != null ? this.m.Minstrel.getNameOnly() : ""
		]);
		_vars.push([
			"monk",
			this.m.Monk != null ? this.m.Monk.getNameOnly() : ""
		]);
		_vars.push([
			"tailor",
			this.m.Tailor != null ? this.m.Tailor.getNameOnly() : ""
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Monk = null;
		this.m.Minstrel = null;
		this.m.Tailor = null;
		this.m.Dude = null;
		this.m.Town = null;
	}

});

