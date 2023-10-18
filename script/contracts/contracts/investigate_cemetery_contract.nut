this.investigate_cemetery_contract <- this.inherit("scripts/contracts/contract", {
	m = {
		Destination = null,
		TreasureLocation = null,
		SituationID = 0
	},
	function setDestination( _d )
	{
		this.m.Destination = this.WeakTableRef(_d);
	}

	function create()
	{
		this.contract.create();
		this.m.Type = "contract.investigate_cemetery";
		this.m.Name = "确保墓地的安全";
		this.m.TimeOut = this.Time.getVirtualTimeF() + this.World.getTime().SecondsPerDay * 7.0;
	}

	function onImportIntro()
	{
		this.importSettlementIntro();
	}

	function start()
	{
		if (this.m.Destination == null || this.m.Destination.isNull())
		{
			local myTile = this.World.State.getPlayer().getTile();
			local 不死族 = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies).getSettlements();
			local lowestDistance = 9999;
			local best;

			foreach( b in undead )
			{
				local d = myTile.getDistanceTo(b.getTile());

				if (d < lowestDistance && (b.getTypeID() == "location.undead_graveyard" || b.getTypeID() == "location.undead_crypt"))
				{
					lowestDistance = d;
					best = b;
				}
			}

			this.m.Destination = this.WeakTableRef(best);
		}

		this.m.Flags.set("DestinationName", this.m.Destination.getName());
		this.m.Payment.Pool = 550 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

		if (this.Math.rand(1, 100) <= 33)
		{
			this.m.Payment.Completion = 0.75;
			this.m.Payment.Advance = 0.25;
		}
		else
		{
			this.m.Payment.Completion = 1.0;
		}

		this.contract.start();
	}

	function createStates()
	{
		this.m.States.push({
			ID = "Offer",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"确保安全于" + this.Flags.get("DestinationName")
				];

				if (this.Math.rand(1, 100) <= this.Const.Contracts.Settings.IntroChance)
				{
					this.Contract.setScreen("Intro");
				}
				else
				{
					this.Contract.setScreen("Task");
				}
			}

			function end()
			{
				this.World.Assets.addMoney(this.Contract.m.Payment.getInAdvance());
				this.Contract.m.Destination.setDiscovered(true);
				this.World.uncoverFogOfWar(this.Contract.m.Destination.getTile().Pos, 500.0);
				this.Contract.m.Destination.clearTroops();
				this.Contract.m.Destination.setLastSpawnTimeToNow();

				if (this.Contract.getDifficultyMult() < 1.15 && !this.Contract.m.Destination.getFlags().get("IsEventLocation"))
				{
					this.Contract.m.Destination.getLoot().clear();
				}

				this.Contract.m.Destination.setLootScaleBasedOnResources(100 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setResources(this.Math.min(this.Contract.m.Destination.getResources(), 60 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult()));
				local r = this.Math.rand(1, 100);

				if (r <= 10 && this.World.Assets.getBusinessReputation() > 500)
				{
					this.Flags.set("IsMysteriousMap", true);
					this.logInfo("地图");
					local bandits = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits);
					this.World.FactionManager.getFaction(this.Contract.m.Destination.getFaction()).removeSettlement(this.Contract.m.Destination);
					this.Contract.m.Destination.setFaction(bandits.getID());
					bandits.addSettlement(this.Contract.m.Destination.get(), false);
					this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.BanditRaiders, 100 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				}
				else if (r <= 40)
				{
					this.logInfo("食尸鬼");
					this.Flags.set("IsGhouls", true);
					this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.Ghouls, 100 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				}
				else if (r <= 70)
				{
					this.Flags.set("IsGraverobbers", true);
					this.logInfo("盗墓贼");
					local bandits = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits);
					this.World.FactionManager.getFaction(this.Contract.m.Destination.getFaction()).removeSettlement(this.Contract.m.Destination);
					this.Contract.m.Destination.setFaction(bandits.getID());
					bandits.addSettlement(this.Contract.m.Destination.get(), false);
					this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.BanditRaiders, 100 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				}
				else
				{
					this.logInfo("undead");
					this.Flags.set("IsUndead", true);
					this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.Zombies, 100 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				}

				this.Contract.setScreen("Overview");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				if (this.Contract.m.Destination != null && !this.Contract.m.Destination.isNull())
				{
					this.Contract.m.Destination.getSprite("selection").Visible = true;
					this.Contract.m.Destination.setOnCombatWithPlayerCallback(this.onDestinationAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Destination == null || this.Contract.m.Destination.isNull())
				{
					if (this.Flags.get("IsUndead") && this.World.Assets.getBusinessReputation() > 500 && this.Math.rand(1, 100) <= 25 * this.Contract.m.DifficultyMult)
					{
						this.Flags.set("IsNecromancer", true);
						this.Contract.setScreen("Necromancer0");
						this.World.Contracts.showActiveContract();
					}

					this.Contract.setState("Return");
				}
			}

			function onDestinationAttacked( _dest, _isPlayerAttacking = true )
			{
				if (!this.Flags.get("IsAttackDialogShown"))
				{
					this.Flags.set("IsAttackDialogShown", true);

					if (this.Flags.get("IsGhouls"))
					{
						this.Contract.setScreen("AttackGhouls");
					}
					else if (this.Flags.get("IsGraverobbers"))
					{
						this.Contract.setScreen("AttackGraverobbers");
					}
					else if (this.Flags.get("IsUndead"))
					{
						this.Contract.setScreen("AttackUndead");
					}
					else if (this.Flags.get("IsMysteriousMap"))
					{
						this.Contract.setScreen("MysteriousMap1");
					}

					this.World.Contracts.showActiveContract();
				}
				else
				{
					this.World.Contracts.showCombatDialog();
				}
			}

		});
		this.m.States.push({
			ID = "Running_Necromancer",
			function start()
			{
				if (this.Contract.m.Destination != null && !this.Contract.m.Destination.isNull())
				{
					this.Contract.m.Destination.getSprite("selection").Visible = true;
					this.Contract.m.Destination.setOnCombatWithPlayerCallback(this.onDestinationAttacked.bindenv(this));
				}

				this.Contract.m.BulletpointsObjectives = [
					"摧毁 " + this.Flags.get("DestinationName")
				];
			}

			function update()
			{
				if (this.Contract.m.Destination == null || this.Contract.m.Destination.isNull())
				{
					this.Contract.setScreen("Necromancer3");
					this.World.Contracts.showActiveContract();
					this.Flags.set("IsNecromancerDead", true);
					this.Contract.setState("Return");
				}
			}

			function onDestinationAttacked( _dest, _isPlayerAttacking = true )
			{
				if (!this.Flags.get("IsAttackDialogShown"))
				{
					this.Flags.set("IsAttackDialogShown", true);
					this.Contract.setScreen("Necromancer2");
					this.World.Contracts.showActiveContract();
				}
				else
				{
					this.World.Contracts.showCombatDialog();
				}
			}

		});
		this.m.States.push({
			ID = "Return",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"返回" + this.Contract.m.Home.getName()
				];
				this.Contract.m.Home.getSprite("selection").Visible = true;
			}

			function update()
			{
				if (this.Contract.isPlayerAt(this.Contract.m.Home))
				{
					if (this.Flags.get("IsNecromancer"))
					{
						if (this.Flags.get("IsNecromancerDead"))
						{
							this.Contract.setScreen("Success3");
						}
						else
						{
							this.Contract.setScreen("Necromancer1");
						}
					}
					else if (this.Flags.get("IsUndead"))
					{
						this.Contract.setScreen("Success1");
					}
					else if (this.Flags.get("IsMysteriousMapAccepted"))
					{
						if (this.Math.rand(1, 100) <= 50)
						{
							this.Contract.setScreen("Failure1");
						}
						else
						{
							this.Contract.setScreen("Failure2");
						}
					}
					else
					{
						this.Contract.setScreen("Success2");
					}

					this.World.Contracts.showActiveContract();
				}
			}

		});
	}

	function createScreens()
	{
		this.importScreens(this.Const.Contracts.NegotiationDefault);
		this.importScreens(this.Const.Contracts.Overview);
		this.m.Screens.push({
			ID = "Task",
			Title = "谈判",
			Text = "[img]gfx/ui/events/event_20.png[/img]{%employer%焦躁不安地走来走去，不时停下来跟你说话。%SPEECH_ON%乡亲们一片混乱！墓地里的坟墓出现了被打开并被掠夺的现象。一些傻瓜声称这是因为有死人从坟墓里爬了出来 —— 迷信的胡说八道。很显然是有盗墓贼胆大到来%townname%用他们贪婪的存在来折磨我们！%SPEECH_OFF%他愤怒地一拳锤在桌上。%SPEECH_ON%给我去墓地一劳永逸地结束这种破事！%SPEECH_OFF% | %employer%自顾自地笑着坐到他的椅子上。%SPEECH_ON%别害怕，佣兵，但他们说有鬼魂出没！是的，是的，本地的乡巴佬们没日没夜地拿这些鬼怪和地精的故事劳烦我的早晨。他们说是那些所谓的生物在墓地里闹腾，掠夺坟墓来扩大他们的军队或者别的这样的胡言乱语。很显然，都只是些拿着铲子的家伙想抢走陪葬的珠宝。我以前见过。%SPEECH_OFF%他低头看着他的双手，轻轻地笑了笑。%SPEECH_ON%不论如何，我没法就这么放置不管，因为这些屁民不会就这么停止来烦我。所以，为了安抚他们，需要……你。我要你去墓地把你发现的捣乱分子清除出去。怎么做由你决定，但我得抢先建议你带上几把趁手的家伙，如果你懂我在说什么的话……%SPEECH_OFF% | %employer%的桌上有一张墓地的地图。图中一半的方格似乎用墨水填满了。%SPEECH_ON%你看到的每个方格都代表着它被刨了。每天晚上它们都会来，而每天晚上我似乎都抓不住它们。我现在无计可施，所以我决定一劳永逸地结束这一切。我要你去那个墓地把你看到的每个盗墓傻瓜都杀掉。明白？%SPEECH_OFF% | %employer%站在窗前，一边喝着一杯蜂蜜酒，一边凝视着窗外。他似乎并没有真正专注于任何特定的事情，甚至说话时似乎一点也不在乎谈话本身。%SPEECH_ON%盗墓贼们正在洗劫墓地。又一次。我对你没有太多要求，佣兵，只求你去那儿了结这桩愚蠢的买卖。去那个墓地并杀掉每个你看到的盗墓贼。明白？很好。%SPEECH_OFF%}",
			Image = "",
			List = [],
			ShowEmployer = true,
			ShowDifficulty = true,
			Options = [
				{
					Text = "我们来谈谈价钱。",
					function getResult()
					{
						return "Negotiation";
					}

				},
				{
					Text = "不感兴趣。",
					function getResult()
					{
						this.World.Contracts.removeContract(this.Contract);
						return 0;
					}

				}
			],
			function start()
			{
			}

		});
		this.m.Screens.push({
			ID = "AttackGhouls",
			Title = "当你接近时……",
			Text = "[img]gfx/ui/events/event_69.png[/img]{咔嚓声、咀嚼声。有人 —— 或者说是某种生物 —— 正在享受一顿美餐。当你穿过墓地时，你偶然发现了一片满是食尸鬼的空地。它们正俯身在一些看起来曾经是你正在寻找的盗墓贼的遗体上。这些丑陋的怪物慢慢地转向你，它们的红眼睛在看到新鲜的肉食时睁得更大了。 | 墓碑翻倒，一群食尸鬼徘徊其间。它们似乎正在享用盛宴，其中几只仍在啃咬这只手或者那条腿，想必是你所要找的那些盗墓贼的肢体。 | 你听到一声尖叫，迅速转过角落，来到一个陵墓前，只见一只食尸鬼正咬住一个男人的颈部。这只野兽的嘴里充满了鲜血，甚至从鼻孔中流出。它只是瞥了你一眼。小一些的食尸鬼们正围绕着它，向前挪动，以确保它们的下一顿餐不会跑掉……}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "拿起武器！",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "AttackGraverobbers",
			Title = "在靠近时……",
			Text = "[img]gfx/ui/events/event_57.png[/img]{盗墓贼们就在这，跟说好的一样。你抓了他们个正着，你的兄弟们拔出武器跃过墓碑。 | 走进墓地，你发现了盗墓贼们，正如%employer%所预料到的那般。他们同时也发现了你。你的手下展开队形，拔出武器以阻止任何人逃离。 | 随着你走过片片墓碑，几声细语从一处陵墓的另一头传来。当你走过转角，你发现一群人正站在一座被挖空的坟墓边。他们面前有一具打开的棺材，几人正从中拿出珠宝。你命令你的人冲锋。 | %employer%说的没错：这里确实有盗墓贼在。你发现了一些翻倒的墓碑和被挖开的坟墓。泥泞的痕迹引导你找到了那些正在忙新活的挖掘者。%SPEECH_ON%不是故意要组织你们，但%employer%付了个好价钱来确保这些人呆在地里。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "To arms!",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "AttackUndead",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/event_57.png[/img]{墓地被层层笼罩在雾中 —— 亦或者是亡者散发的厚厚瘴气中。等等……那*就是*亡者！拿起武器！ | 你看到一块底下带着泥土的墓碑。泥点像面包屑一样引向远方。这里没有铲子……也没有人……当你跟着线索前行时，你突然遭遇了一群僵尸，它们呻吟着，嘶哑着……现在它们带着无法满足的饥渴盯着你... | 一个男人在一排排墓碑深处徘徊。他看起来在晃，好像随时都要昏过去。%randombrother%到你身边摇了摇头。%SPEECH_ON%那不是人，先生。那是亡灵在出没。%SPEECH_OFF%他刚说完，远处的陌生人缓慢的转过来，光线下能看出他少了半张脸。 | 你到此地发现许多的坟墓都是空的。不只是空，而且是自里向外挖开的。这可不是盗墓贼的手笔……}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "To arms!",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "MysteriousMap1",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/event_57.png[/img]{你进入墓地，发现盗墓者就正如%employer%所说：深陷在他人的死后世界中。你拔出你的剑，告诉他们放下任何他们认为可以偷走的珠宝。其中一个人站起来，举起双臂，陈述了自己的观点。%SPEECH_ON%在你杀掉我们之前，我能说几句吗？我们有张地图……我知道，这听起来像个谎言，但请听我说完……我们有一张指向大量财宝的地图。你放我们走，我就把它给你。杀掉我们的话……你将永远找不到它。怎么说？%SPEECH_OFF% | 正如%employer%所料，盗墓贼们正翻弄着墓碑。你在他们挖到一半的时候拦住他们，问他们在加入那些泥巴中的受害者的行列之前还有什么遗言。其中一个人恳求宽恕，说他有一张藏宝图，愿意以此换取他们所有人的性命。 | 你撞见了几个人正视图弄开一个陵墓的门。你用剑敲靴子的响声引来了他们的注意。%SPEECH_ON%晚上好先生们。%employer%派我来的。%SPEECH_OFF%其中一个人丢下了他的工具。%SPEECH_ON%等一下！我们有张地图……是的，一张地图！并且如果你放过我们，我就把它给你！但你得放过我们！如果你不……你再也不会看到那张地图，明白？%SPEECH_OFF% | 你打了盗墓贼们一个措手不及，在他们还在铲土的时候拔出了剑。其中一个人，可能是意识到他将要加入他一只脚已经踏入的坟墓，试图与你做个交易。很显然，他有一张导向神秘宝藏的地图。你只需要放他们走就能获得它。如果你杀死他们，那好吧，“地图”就会被藏起来，且你永远找不到它或者它所指引的宝藏。}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "杀光他们！",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				},
				{
					Text = "很好，交出地图你们就可以活着离开这个地方。",
					function getResult()
					{
						this.updateAchievement("NeverTrustAMercenary", 1, 1);
						local tile = this.Contract.getTileToSpawnLocation(this.World.State.getPlayer().getTile(), 8, 18, [
							this.Const.World.TerrainType.Shore,
							this.Const.World.TerrainType.Ocean,
							this.Const.World.TerrainType.Mountains
						], false);
						tile.clear();
						this.Contract.m.TreasureLocation = this.WeakTableRef(this.World.spawnLocation("scripts/entity/world/locations/undead_ruins_location", tile.Coords));
						this.Contract.m.TreasureLocation.onSpawned();
						this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).addSettlement(this.Contract.m.TreasureLocation.get(), false);
						this.Contract.m.TreasureLocation.addToInventory("loot/silverware_item");
						this.Contract.m.TreasureLocation.addToInventory("loot/silver_bowl_item");
						return "MysteriousMap2";
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "MysteriousMap2",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/event_57.png[/img]{或许%employer%只是在试图杀死那些人以夺去宝藏？那……会很合理，不是吗？你决定放这些人走以换取地图。上面显示东西就在这里%treasure_direction%边的%treasure_location%。 | %employer%没提到这些人有张地图……或许他在试图抹去这份知识？谁知道呢。但宝藏的吸引力太大了，而你决定让他们走来换取这份信息。他们的地图揭示了宝藏的位置：%treasure_location%。它位于这里的%treasure_direction%边。 | 你还是个孩子时，你总是到处搜寻宝物。这种感觉……异常令人兴奋。你不知道为什么，但是重温那段古老冒险的吸引力让你放过了那些人。作为回报，他们向你展示了地图，揭示了位于%treasure_location%的宝藏，一个隐藏的储藏地……谁知道那有什么？你真正知道的只是它位于你所站之处的%treasure_direction%边。}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "这最好值得。",
					function getResult()
					{
						this.World.uncoverFogOfWar(this.Contract.m.TreasureLocation.getTile().Pos, 700.0);
						this.Contract.m.TreasureLocation.setDiscovered(true);
						this.World.getCamera().moveTo(this.Contract.m.TreasureLocation.get());
						this.Contract.m.Destination.fadeOutAndDie();
						this.Contract.m.Destination = null;
						this.Flags.set("IsMysteriousMapAccepted", true);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Necromancer0",
			Title = "战斗之后……",
			Text = "[img]gfx/ui/events/event_56.png[/img]{消灭了全部的亡灵后，你找到一片泛着紫光的布。 你不确定它是什么东西，但不知怎么想要留着它。%randombrother% 认为这很愚蠢，但管事的不是他。 | 战斗后，%randombrother% 找一个铲头，上面烙着一个符号。 他寻思，%employer%，你的雇主，可能知道些什么。 你表示认同，并带上这块金属碎片去询问当地人能否辨认它。 | 怪物们被击倒，你收剑入鞘打扫起战场。 在你的搜索中，你找到一个用乌鸦羽和牛皮制成的奇异护符。 你把它收进口袋里，或许 %employer%，你的雇主，可能知道点什么。}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "是时候领工钱了。",
					function getResult()
					{
						this.Flags.set("DestinationName", this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.NecromancerLair));
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Necromancer1",
			Title = "你回来后……",
			Text = "[img]gfx/ui/events/event_63.png[/img]{回来找到 %employer%，你快速解释了没有盗墓贼，而是一群亡灵。 他看起来很惊讶，但当你展示你找到的物品时，你发现他咬住嘴唇并低沉的点了点头。%SPEECH_ON%那是…那来自 %necromancer_location%。我们以为我们可以无视那个地方，但看起来我错了。 去那，佣兵，并彻底的了结那阴森的恐怖地方！%SPEECH_OFF%他将戏剧性调低了一点。%SPEECH_ON%噢，当然，我准备付你另一笔 %reward_completion% 克朗，叠加在原本的 %reward_completion% 上。%SPEECH_OFF% | 你在 %employer% 的书房里找到了他，沉闷的嘬着酒杯。%SPEECH_ON%我已经听说了。 亡者在行走，噢，连说出来都令人恐惧！%SPEECH_OFF%你点头并展示了你在墓地里找到的物品。%SPEECH_ON%你对这个有什么了解吗？%SPEECH_OFF%他瞟了眼，好似他已经知道你带着它。%SPEECH_ON%是的，那来源于 %necromancer_location%。我们以为可以无视从那里出来的恐怖之物，但…好吧，看。 或许你能去那里？ 或许你可以摧毁 %necromancer_location% 以使我们免受恐惧？ 这是你的原本报酬，说好的，但如果你帮我们解决 %necromancer_location% 你会拿到额外的 %reward_completion% 克朗。 这对你来说听起来还行吧？%SPEECH_OFF% | 你走入 %employer%的房间并将物品拍在了他的办公桌上。 他用手将它拍开。%SPEECH_ON%你从哪里搞到那玩意的？%SPEECH_OFF%一根手指指着它，你按着他。%SPEECH_ON%你知道墓地里的亡灵吗？%SPEECH_OFF%他畏缩的转开视线，然后点了点头。%SPEECH_ON%是的…我知道。它们，以及那个物品，来自 %necromancer_location%。某种黑魔法师住在那并且它已经给我们这些…麻烦一段时间了。 求求你，能否去那里摧毁它？ 这是你原本任务的报酬，但如果你能替我们除掉那该死的…东西，你将得到丰厚的报酬。 我说…额外 %reward_completion% 克朗？%SPEECH_OFF% | 你解释给 %employer% 说陵园那里没有盗墓贼，一个人类都没有。 在他能开口前，你展示了那个物品，将它举在光线中好让他看清。 他很快退步。%SPEECH_ON%把那东西放下！%SPEECH_OFF%声音似火，他的吼叫使那物品燃起并在你的指尖无痛的燃烧着，只剩下摇摆的灰尘。%employer% 抱住头。%SPEECH_ON%它来自 %necromancer_location%。一个…亡灵巫师住在那里，一个以线摆弄亡者的木偶师。 求你了，佣兵，去那并摧毁它。 我们会非常感激…%SPEECH_OFF%他停下来拿出一袋克朗。%SPEECH_ON%这是我们本来谈好的。 但如果你解决掉 %necromancer_location% 那可怕的家伙，额外的 %reward_completion% 克朗等着你的归来。%SPEECH_OFF% | 你拿出在墓地里找到的物品。%employer% 看到他倒吸一口气，但他的表情快速的转换到一种阴沉的接受般的表情。%SPEECH_ON%我跟你实话实说，佣兵。 有个亡灵巫师住在离这里不远的 %necromancer_location%。%SPEECH_OFF%他拿出一袋克朗并把它交给你。%SPEECH_ON%那是你原本委托的报酬。 但是，我提出另一笔 %reward_completion% 克朗，这是我们能集出的全部，如果你现在就去杀掉那个恶人。%SPEECH_OFF%他向后倚着，看起来非常希望你会接受这新的委托条件。}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "很好，我们会去解决那个亡灵巫师。",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "确保了墓地的安全");
						local tile = this.Contract.getTileToSpawnLocation(this.World.State.getPlayer().getTile(), 8, 15, [
							this.Const.World.TerrainType.Shore,
							this.Const.World.TerrainType.Ocean,
							this.Const.World.TerrainType.Mountains
						], false);
						tile.clear();
						this.Contract.m.Destination = this.WeakTableRef(this.World.spawnLocation("scripts/entity/world/locations/undead_necromancers_lair_location", tile.Coords));
						this.Contract.m.Destination.onSpawned();
						this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).addSettlement(this.Contract.m.Destination.get(), false);
						this.Contract.m.Destination.setName(this.Flags.get("DestinationName"));
						this.Contract.m.Destination.setDiscovered(true);
						this.Contract.m.Destination.clearTroops();
						this.Contract.m.Destination.setLootScaleBasedOnResources(115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
						this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.Necromancer, 115 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());

						if (this.Contract.getDifficultyMult() <= 1.15 && !this.Contract.m.Destination.getFlags().get("IsEventLocation"))
						{
							this.Contract.m.Destination.getLoot().clear();
						}

						this.World.uncoverFogOfWar(this.Contract.m.Destination.getTile().Pos, 500.0);
						this.Contract.m.Home.getSprite("selection").Visible = false;
						this.Flags.set("IsAttackDialogShown", false);
						this.Contract.setState("Running_Necromancer");
						return 0;
					}

				},
				{
					Text = "不，战团在这方面做得够多了。",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Secured the cemetery");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "你获得了 [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] 克朗"
				});
			}

		});
		this.m.Screens.push({
			ID = "Necromancer2",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/event_57.png[/img]{那地方如同你想象的一般骇人，禁忌的，极端的腐臭。 你还未发现亡灵巫师所以最好保持最高警惕前进… | %necromancer_location% 就在 %employer% 所说的地方。 你发现一条骨铺的小径。 其中一些仍带着血肉，或许是半成的亡灵术失误导致死者没能完全转变为亡灵。 无视掉恐怖的景象，你开始计划你的攻势… | 一个像 %necromancer_location% 这样的地方是如此的杂草丛生，加上黑化的树木，它根本不需要一个“禁止入内”标志。 但它还是带着一个。 以一种骨头组成的谜题呈现，各种各样人与兽的骨头以恐怖的方式组成，显眼的摆在十字架上以赶走任何可能的冒险者。 鼻涕虫从它的眼孔中爬出，动脉般的行军蚁在它的四肢上脉动。\n\n %randombrother% 走过来，因这景象有些不安，并问你想要如何进攻。 | 一开始你找到一个啮齿动物，四肢岔开，每一只小手或者脚都钉在一块木板上。 然后有只狗，它的头被换成了只猫。 你发誓这怪物在你靠近时动了，但或许你只是有了幻觉。 然后…是人。 你无以言表他们遭遇了什么，但那是一座耸立着的血肉奇观，残暴到了顶点。\n\n%randombrother% 走到你身边。%SPEECH_ON%让我们了结这个狂人。%SPEECH_OFF%是的。问题是，先要怎么开始进攻？}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "准备进攻。",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Necromancer3",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_56.png[/img]{%necromancer_location% 被净化了。你几乎对这感到神圣，但回想起来你是为报酬来的，而不是什么正直的原因。 倒也不是说你更想要后者。 | 亡灵巫师死了，他的头就在你手上。 现在是时候去告诉那个傻子，%employer%，好让他给你报酬。 | 战斗并不轻松，但 %necromancer_location% 被摧毁了。 亡灵巫师死了并且，就像所有人一样，倒在他拥有的血肉和骨头里。 他的巫术可以操纵死者，但死了却使不出来令你感到好奇。 好奇，但也不令你感到遗憾。 你取下了这个异教者的头，以保万无一失。 | 你解决了亡灵巫师但，担心他的诡计在死后继续，你切下了他的头颅装到袋子里。%employer%，你的雇主，应该很高兴看到它。 | 战斗结束了，你执剑向亡灵巫师的脖子并取下了他的头颅。 它下来的几乎太轻松了，好似它想要落到你手里。 好吧，不论如何，%employer%，你的雇主，会想看看你成果的证据的。}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "是时候收这个头的钱了。",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Success1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_04.png[/img]{当你回来时，%employer%在狡黠地笑着。%SPEECH_ON%麻烦活，不是吗？我已经听说了消息 —— 它在这片地方传的很快。遗憾的是我们只能这样做，但谁知道否则你会为对付这些……东西收取多少费用呢。\n\n嗨……你还是拿得到报酬的。%SPEECH_OFF%他指着角落里的一个木箱。%SPEECH_ON%%reward_completion%克朗都在那里面，跟我们说好的一样。%SPEECH_OFF% | %employer%听完了你的报告然后缓慢倚回他的椅子。%SPEECH_ON%关于这些……东西之前是有很多流言。死人走来走去？%SPEECH_OFF%他盯着桌子，然后愤怒地看向你。%SPEECH_ON%胡说八道！我不信。你会拿到我们说好的%reward_completion%克朗。你别想用你的这些……这些谎言从我这敲走更多钱！%SPEECH_OFF%你真的应该带一两个头来，但话说回来，一个死人的头和亡灵的头可能没什么区别…… | %employer%听完你关于亡灵的报告后耸耸肩。%SPEECH_ON%真可惜。%SPEECH_OFF%他若无其事地呷了一口高脚杯的边缘，然后将手伸向房间的一角。%SPEECH_ON%你的报酬在那个箱子里。%randomname%会为你们送行。%SPEECH_OFF% | %employer%合拢双手，然后将它们放在腿上。%SPEECH_ON%我听说过这些……东西。这些游荡的怪物。它们来%townname%不是什么好消息，但我想他们没有比墓地更好的去处了！不管怎么说，好过镇广场。%SPEECH_OFF%他紧张地笑着。%SPEECH_ON%%randomname%现在正带着你的报酬站在我门外。谢谢你，佣兵。%SPEECH_OFF%}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "当之无愧的克朗。",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Secured the cemetery");
						this.World.Contracts.finishActiveContract();

						if (this.World.FactionManager.isUndeadScourge())
						{
							this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnCommonContract);
						}

						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
		this.m.Screens.push({
			ID = "Success2",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_04.png[/img]{%employer%将你迎进他的房间。%SPEECH_ON%你把他们都杀了？它安全了？%SPEECH_OFF%你耸耸肩。%SPEECH_ON%一段时间里不会有人再来挖坟了。%SPEECH_OFF% | 你发现%employer%依偎在椅子上，拿着蜡烛，靠近一本破旧的书卷。他说话时头也没抬。%SPEECH_ON%我的麻烦，你解决了吗？%SPEECH_OFF%你点头。%SPEECH_ON%如果我没有，我就不会站在这里了。%SPEECH_OFF%%employer%把手放在书桌的一角。%SPEECH_ON%你的报酬。%reward_completion%克朗，跟说好的一样。%SPEECH_OFF% | %employer%在你回到他的房间时正跟他的一些手下说着话。他撇开他们并询问你任务结果。你报告说埋葬%townname%的亲人们这事再度安全了。%employer%笑了。%SPEECH_ON%好。好。你的报酬。%SPEECH_OFF%他打了个响指，其中一个人走上前来，递给你一个背包。如前所述，其中有%reward_completion%克朗。}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns well deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Secured the cemetery");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
		this.m.Screens.push({
			ID = "Success3",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_04.png[/img]{你带着亡灵巫师的头回来找到 %employer%。 对于一颗外观上的人头而言它是如此难以置信的轻。%SPEECH_ON%就是那个肮脏的生物用亡灵翻我们的坟墓的？%SPEECH_OFF%点头，你放下那个头。 脸踹了口气吓得 %employer% 跳开。%SPEECH_ON%他还活着！%SPEECH_OFF%你耸耸肩用匕首扎穿了头盖骨。 亡灵巫师的眼睛转向上看着柄，他的牙齿颤出笑声，然后眼睛缩回到它们的眼眶，一卷微弱的红眼从中冒出然后就平息了下来。%employer%，吓得发抖，坐回椅子上并做动作指向角落里的一个袋子。 那是你的报酬而且它还挺沉的。 | %employer% 在你进入他的书房时正要坐下，但他看到亡灵巫师的头在你的手下晃荡马上起身并退后。%SPEECH_ON%我－我想这是…是他？ 对吧？是他？结束了？%SPEECH_OFF%你点头并把头丢到他的办公桌上。 它转过脸来，在紧绷的脸颊上咧着嘴笑，前后摇晃。%employer% 用一本书把它敲开。%SPEECH_ON%好。好极了！如同约定的，你的报酬…%SPEECH_OFF%他示意向一个角落，那里放着一个 {木箱 | 大袋子}。 你拿上它，数了数，然后告别。 | %employer% 从阅读中抬头。%SPEECH_ON%天啊，你手里的是那个亡灵巫师的头吗？%SPEECH_OFF%你点头并把它丢到地上。 一只猫从书柜后冒出来摆弄它。%employer% 起身并从书架取了几本书，露出来一个大盒子。 他拿起它并把它交给你。%SPEECH_ON%我为特殊时刻存着这，而我想这是一个特殊时刻。%SPEECH_OFF%你想它会是一件物品，或许是个护身符或者什么神秘物品，但它只是一堆克朗。 | 回来找到 %employer%，你手里拿着亡灵巫师的头，他快速的示意让你交过去。 对行为毫无顾虑…\n\n%employer% 用双手捧着它，像研究一个生病的婴儿般研究着它。 在一段时间后，他把它放到一个断掉的三叉戟的叉子齿上。%SPEECH_ON%我想它摆在那看起来不错。 你也这么认为，不是吗？%SPEECH_OFF%他用大拇指按在亡灵巫师苍白的下巴上。 你清清嗓子询问起报酬，%employer% 示意让他的一个卫兵进来。 一个袋子被交给你，从中你数出来 %reward_completion% 克朗。 心满意足，你离开 %employer% 好让他做…他在做的事情。}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns well deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractPoor, "Secured the cemetery");
						this.World.Contracts.finishActiveContract();

						if (this.World.FactionManager.isUndeadScourge())
						{
							this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnCommonContract);
						}

						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
		this.m.Screens.push({
			ID = "Failure1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_63.png[/img]{%employer% 在你进入房间时站在窗边。%SPEECH_ON%小鸟们的歌声今天听起来有些生气。 好像他们要说的东西毫无意义。 我认为这很有趣。你呢？%SPEECH_OFF%他突然转向你。%SPEECH_ON%哼，佣兵？不？我的小鸟告诉我盗墓贼们离开了。 活着。自由自在，随时可以回来。 真奇怪，因为通常死人没有自由去做任何事情。 我之前要求你怎么解决这些盗墓贼的？%SPEECH_OFF%你顿了一下。他替你回答道。%SPEECH_ON%我想让你杀掉他们。 现在他们没死。现在你拿不到报酬。 啊，真简单。然后现在？ 现在给我滚出我的房子。%SPEECH_OFF% | %employer% 在你进入他的房间时破口大笑。%SPEECH_ON%我很惊讶你回来了。 我觉得这是种侮辱，说真的，你在当我是个弱智。 盗墓贼们被目击到离开了。 那些我要求你杀掉的盗墓贼。 还记得吗？记得我说的去干掉他们吗？ 我确信你是的。 我同样确信你记得那时我付钱给你就是为了这个。 所以…没有死盗墓贼…%SPEECH_OFF%他一拳击在办公桌上。%SPEECH_ON%没有报酬！现在滚出我的家！%SPEECH_OFF% | 你找到 %employer% 坐在椅子上，两手翻着一个空酒杯。%SPEECH_ON%我很少遇到试图对我使诈的人。 那正是你回来打算做的事，对吧？ 我知道盗墓贼们没死，佣兵。 我可不好傻。趁我还没下令杀了你之前离开我的视线。%SPEECH_OFF% | %employer% 在你进入他房间时读者一本书。%SPEECH_ON%你有十秒钟转身离开。十。九。八…%SPEECH_OFF%你意识到他知道盗墓贼没被干掉。%SPEECH_ON%…四…三…%SPEECH_OFF%你转身快步离开了房间。}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "该死的！",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractFail);
						this.World.Assets.addMoralReputation(-1);
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationAttacked);
						this.World.Contracts.finishActiveContract(true);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Failure2",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_63.png[/img]{%employer% purses his lips.%SPEECH_ON%你让我很尴尬，雇佣兵。 你跟我说盗墓贼被解决了，但是…我拿不到证据。 通常来说，死人会留下很多证据。 特别是被匆忙杀掉的人。%SPEECH_OFF%He shrugs.%SPEECH_ON%我会付你一半。 而且你得接受并就这么拿上它离开。 下一次，带证据。 如果你在撒谎…那，我会自己琢磨出来的。%SPEECH_OFF% | 你回来找到 %employer% 正在清理他的花园。%SPEECH_ON%有时候我种下一株蔬菜，但冒出来是别的完全意外的东西？ 这怎么发生的？ 我自己犯蠢了？ 你在试图愚弄我？ 你说盗墓贼死了，但我的手下已经搜查过墓地没找到任何证据。 他们同样也没找到盗墓贼，而且请…%SPEECH_OFF%他举起一只手。%SPEECH_ON%请不要试图告诉我你对尸体做了什么。 所以我们会这么办，佣兵。 我将给你一半的报酬，然后我会坐在这寻思你有没有撒谎。听起来不错？很好。%SPEECH_OFF% | %employer% 微笑着听你告诉他问题已经解决了。%SPEECH_ON%那是好消息。不过，我的手下搜索了墓地却没找到我们所说的盗墓贼的尸体或证据。 一个有趣的进展，我很确信，但我不会在我弄清楚前把你留在这里。 所以…我会付你一半的报酬。 下一次，给我带证据来。 或者…不要撒谎。我不确定现在是哪种情况。%SPEECH_OFF%}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "嗯。",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractPoor);
						this.World.Assets.addMoralReputation(-1);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion() / 2);
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail);
						this.World.Contracts.finishActiveContract(true);
						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() / 2 + "[/color] Crowns"
				});
			}

		});
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"treasure_location",
			this.m.TreasureLocation == null || this.m.TreasureLocation.isNull() ? "" : this.m.TreasureLocation.getName()
		]);
		_vars.push([
			"treasure_direction",
			this.m.TreasureLocation == null || this.m.TreasureLocation.isNull() ? "" : this.Const.Strings.Direction8[this.World.State.getPlayer().getTile().getDirection8To(this.m.TreasureLocation.getTile())]
		]);
		_vars.push([
			"necromancer_location",
			this.m.Flags.get("DestinationName")
		]);
	}

	function onHomeSet()
	{
		if (this.m.SituationID == 0)
		{
			this.m.SituationID = this.m.Home.addSituation(this.new("scripts/entity/world/settlements/situations/terrified_villagers_situation"));
		}
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Destination != null && !this.m.Destination.isNull())
			{
				this.m.Destination.getSprite("selection").Visible = false;
				this.m.Destination.setOnCombatWithPlayerCallback(null);
				local zombies = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Zombies);
				this.World.FactionManager.getFaction(this.m.Destination.getFaction()).removeSettlement(this.m.Destination);
				this.m.Destination.setFaction(zombies.getID());
				zombies.addSettlement(this.m.Destination.get(), false);
			}

			this.m.Home.getSprite("selection").Visible = false;
		}

		if (this.m.Home != null && !this.m.Home.isNull() && this.m.SituationID != 0)
		{
			local s = this.m.Home.getSituationByInstance(this.m.SituationID);

			if (s != null)
			{
				s.setValidForDays(3);
			}
		}
	}

	function onIsValid()
	{
		if (this.m.IsStarted)
		{
			if (this.m.Destination == null || this.m.Destination.isNull() || !this.m.Destination.isAlive())
			{
				return false;
			}

			return true;
		}
		else
		{
			if (this.m.Destination == null || this.m.Destination.isNull())
			{
				return false;
			}

			return true;
		}
	}

	function onSerialize( _out )
	{
		if (this.m.Destination != null && !this.m.Destination.isNull())
		{
			_out.writeU32(this.m.Destination.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		local destination = _in.readU32();

		if (destination != 0)
		{
			this.m.Destination = this.WeakTableRef(this.World.getEntityByID(destination));
		}

		this.contract.onDeserialize(_in);
	}

});

