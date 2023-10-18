local gt = this.getroottable();

if (!("Contracts" in gt.Const))
{
	gt.Const.Contracts <- {};
}

gt.Const.Contracts.IntroNobleHouseNeutral <- [
	{
		ID = "Intro",
		Title = "谈判",
		Text = "[img]gfx/ui/events/event_20.png[/img]{一个男人突然挤了过来，让你大吃一惊。你刚要抽出武器，他就快速解释说有个叫%employer%的人想要认识你。你将武器放回鞘中，叫这陌生人带你去找他 —— 如果他真有事，他应该亲自告诉你。信使点点头，带路去了一个贵族的府邸。 | 一个信使 —— 一个跟一把长剑齐高的年轻小伙子 —— 从你身边冲过，呼啸而过的同时只是将一个卷轴抛向空中。你抓住了它，但当你想找那孩子时，他已经消失得无影无踪了。你耸耸肩，打开卷轴看到了%employer%的名字。他似乎需要你的帮助。这位贵族住所的方向写在卷轴的底部。 | 在漫步于%townname%时，一个信使悄无声息地靠近你。你瞥了他一眼，而那可怜的家伙将一卷卷轴扔到你手中，然后匆匆跑开。你打开卷轴，发现一位当地贵族要求与你见面。 | %townname%看似似很祥和，但肯定还是出了点什么事，因为一个信使带着位当地贵族的便条过来找到你。哪里有财富，哪里就有麻烦…… | 一位信使和你打招呼。他自称是个龙套角色，因为你也很快就忘记了他叫什么。然而，他带来的信息非常重要：一位当地贵族要求与你见面。 | 一只鸟飞到你的肩头然后停留在那。它对着你咕咕叫，然后抬起了一只拴着便条的爪子。在你接过这张纸条的瞬间，鸟儿就飞走了，它只关心自己的投递服务，对其他事物并不友善。这张纸条揭示了一位当地贵族，也被认为是鸟类的朋友，要求与你见面。 | 一只绳子拴着的狗朝你跑来，汪汪地叫个不停。拉着它的人朝狗点了点头。这只野兽好似是只传递消息的畜生。也许是某人在开玩笑。\n\n收下便条，你读到一位当地贵族要求你的服务。也许这完全不是个笑话。那只狗再次吠叫并摇摇尾巴，乖乖地坐下，看起来相当得意。 | 一个直挺挺的男人走向你。他抬起的手臂上有一只卷轴，像一个高脚架上的布告板一样向你靠近。他什么也没说，只是将手伸向你，你也很配合地收下了卷轴。上面写道一位当地贵族正在找你，兴许还包括你的服务。你向信使致谢，但他什么也没说，只是转身继续像踩高跷般沿路走开了。 | 当你走在%townname%的路上时，有几个人在一间当地酒馆中大声呼喊，大笑着挥手致意你进去。他们弯着腰窃笑，几乎说不清要表达的内容：显然某位贵族正在寻找佣兵。有趣，但你忍不住要询问他们为什么发笑。男人们沉默了一会儿，其中一位耸耸肩，另一个人咳嗽着讲出答案。%SPEECH_ON%因为我们醉了？%SPEECH_OFF%男人们保持着一副勉强紧绷的脸，但只持续了一秒钟，又爆发出笑声。 | 一位当地贵族的仆人表示受主人之命让你跟随他而去。他将你带到了%townname%更富裕的区块，那的建筑更高，街道上没有马粪的臭味。最终，你来到了一座看起来曾经是庙宇的庄园。猫头鹰装饰点缀着屋檐，在你经过时盯着你。一只愁眉苦脸的猫在前台阶上懒洋洋地晃荡。你通过一扇充满奢华的前门进入，门轴和宽大的摆动声回荡在门厅中。你的嘴巴张得大大的，几乎无法用言语形容里面的壮丽景象。}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "我们来谈谈生意。",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];
gt.Const.Contracts.IntroNobleHouseFriendly <- [
	{
		ID = "Intro",
		Title = "Negotiations",
		Text = "[img]gfx/ui/events/event_20.png[/img]{几个乡民走上前来，其中一个甚至伸出手要拥抱你。你婉拒了。%SPEECH_ON%很高兴再次见到你，佣兵。%employer%一直在找你。%SPEECH_OFF% | 一个女人在你走进镇子时给了你一朵花。这与通常的反应不同，平常人们都是关上窗户、把孩子藏起来。你接过花，她摆动着裙摆欢快地离开。一个男人走向你。%SPEECH_ON%对不起打扰您了，先生，镇上的居民似乎对您很感兴趣。%employer%也是，他自从听到您来到镇上的消息后就一直在找您。%SPEECH_OFF% | 一群狗沿路跑来，几个孩子在后追赶。他们一个个在你面前分散开来，狗欢快地咆哮着，孩子们尖叫着问候你。一个女人走过来，一手拿着煎锅，一手拿着抹布。%SPEECH_ON%你好，佣兵。我本该让那些信使告诉你的，但是我得到了消息，所以我跟你直说吧。%employer%在找你。%SPEECH_OFF%她眨巴着眼睛。你微笑着点头。%randombrother%笑了起来。%SPEECH_ON%先生，看到你中意的了？%SPEECH_OFF%你让他滚犊子。 | 几只咩咩叫的山羊被牵着走在路上。它们在泥里拖着脚步，用鼻子在泥里戳来戳去，不知怎么地找到了可以咀嚼的东西。他们的牧人把手杖插在土里。%SPEECH_ON%你好，佣兵。%employer%在找你。%SPEECH_OFF% | 一个坐在自家门廊里的男人一见到你就倾身向前。他伸出一根手指。%SPEECH_ON%看啊，这不是人们都在谈论的佣兵嘛。%SPEECH_OFF%你环顾四周，然后点头。他又笑又叫。%SPEECH_ON%我操，看到你真他妈太好了！要是我不告诉你%employer%正在找你，那我可就太失职了。去找他吧。告诉他是我将消息告诉你的，或许我能拿到赏钱。那混球，或许就会送束花。要么就是只猫。谁想要猫？干嘛要送我猫？我告诉过他我讨厌猫了……%SPEECH_OFF%当他仍在喋喋不休的时候，你一声不响地离开了。 | 一个女人向你跑来。她还带着孩子，看来对佣兵没有太多戒备心。其中一个小孩抱着你的腿。%SPEECH_ON%他回来了！%SPEECH_OFF%你低头咧开笑容，巧妙地试图甩开这小兔崽子，但是他只是将此视为玩笑。母亲抱走了小孩，然后伸手指出了方位。%SPEECH_ON%%employer%在找你。告诉他是我把你叫去的，或许他知道是我帮的忙后会来修我们的井。%SPEECH_OFF%她看起来对整个世界感到疲倦，似乎孩子的嬉闹将她拖进了地狱里。 | 你走进%townname%，一人招呼你进他的花园。他在料理植物，用一只稳定的手修剪蔬菜或水果之类的东西，不是园丁的你并不能辨识。%SPEECH_ON%最近如何，佣兵？如果你在找活，%employer%一直有谈到你。我猜他应该也想见见你，如果你还想继续和他合作的话。给你，抓住。%SPEECH_OFF%他转身朝你扔来一颗{卷心菜 | 洋葱 | 土豆 | 西红柿}。%SPEECH_ON%接得好。%SPEECH_OFF%你咬了一大口，点了点头。%SPEECH_ON%味道还不错。%SPEECH_OFF% | 一名年迈的店主朝你挥手。%SPEECH_ON%很高兴再次见到你，佣兵。这话你听过多少次？%SPEECH_OFF%他伸手指向路。%SPEECH_ON%要是你还想再干点好事，%employer%一直在找你呢。%SPEECH_OFF% | 一个正在剪羊毛的人看着你，那只瘦小的羊在边上扭动。%SPEECH_ON%我就该吃了这小混球。瞧她这熊样。别再搞了，好吗？%SPEECH_OFF%他用肘子捅了捅那羊，它发出一声咩叫，用羊所能发挥的智慧咒骂回去。那人又看向你。%SPEECH_ON%你应该就是人人都在谈论的佣兵吧。我得跟你说，嗯，我想我会，呃，那个，%employer%一直在找你。%SPEECH_OFF%羊弹跳着想逃跑，但是被那人按倒在地。%SPEECH_ON%小王八蛋，要是再那样，我就把你的奶子给挤光！%SPEECH_OFF%}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "我们来商量商量。",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];
gt.Const.Contracts.IntroNobleHouseCold <- [
	{
		ID = "Intro",
		Title = "Negotiations",
		Text = "[img]gfx/ui/events/event_20.png[/img]{你小心翼翼地走进%employer%其中一个联络人的家。他坐在火堆旁，一手拿着卷轴，一手拿着高脚杯。%SPEECH_ON%别费力坐下，雇佣兵。我们可不能让我的舒适感受到一丝寒意对吧？如果你在找%employer%，我可以替你传话给他。他对你不高兴，但生意就是生意，或者我们就喜欢这么说。%SPEECH_OFF%他笑着用酒杯向你示意。 | %employer%的几名保镖站在你面前，双手交叉。%SPEECH_ON%我们这回该怎么处理他来着？%SPEECH_OFF%你握紧了剑柄。其中一人笑了。%SPEECH_ON%放他过去。是那样。虽然不知道原因，但是%employer%想继续和他做生意，依我看，我们现在就应该把他干掉。%SPEECH_OFF%虽然他们放你通过了，但你仍然留心着周围的环境。 | 虽然无法确切指出，但%townname%最近似乎颇具敌意。窗户在你走过时纷纷合上，仿佛你脚步带着风。当门一扇扇关上、乡民们纷纷逃散时，一个民兵靠近。%SPEECH_ON%%employer%想见见你，但是你得规矩点。他现在心情可不太好。%SPEECH_OFF% | 当你走过的时候，几个民兵吹着口哨大喊。%SPEECH_ON%某些还敢来的人胆儿真肥啊。嘿，佣兵！要是还想做生意的话，%employer%乐意再聊聊。就是，你懂的，这次别再搞砸了！%SPEECH_OFF% | 一个男人紧握着战犬们的链子，猎狗们在差一点能够着你一条腿的距离内大声空咬。它们的训犬师看着你，有那么一瞬间，他似乎准备松开链子。%SPEECH_ON%哦，是你。嗯，%employer%一直在找你。%SPEECH_OFF% | 你走过几名民兵。他们口吐唾沫，剑鞘叮当作响，但是你毫不在意。一名穿着体面的人走向你。%SPEECH_ON%如果你想做生意，就跟我来吧。%employer%想和你谈谈。%SPEECH_OFF% | 你经过一个女人，她朝你扔了一棵烂菜。它飞离得很远，但你用一种恶意的凝视进行了报复。她开始絮叨。%SPEECH_ON%我得说你得瞄得更准些%SPEECH_OFF%你拍了拍剑柄，她飞快跑开。一个男人走上前来，看到了整个过程令他咯咯笑着。%SPEECH_ON%佣兵，你在镇上可不怎么受欢迎。跟我来吧，好找%employer%谈谈。%SPEECH_OFF% | 几名正在磨剑的民兵瞥见了你。%SPEECH_ON%他的脑袋是不是值几个钱？%SPEECH_OFF%另一人猛拍了下他的肩膀。%SPEECH_ON%你他妈声音是不是太大了点？嘿，佣兵！%employer%挺想和你聊聊！%SPEECH_OFF%呃，好的，当然了。 | 你靠近一个牵着多只战犬的男人。它们坐得笔直，听从命令，没有一只伸着舌头。它们的训犬师盯着你，抓着绳索的手没有握紧。%SPEECH_ON%你知道吗，%employer%说要我一见到你就任这些畜生扑出去。然后他又说，不，还是算了。他就这样犹豫不决，一会儿说让狗吃顿好的，一会儿说让你活着。%SPEECH_OFF%你问训兽师那最后的决定是什么。他扭头吐了口唾沫。%SPEECH_ON%上去见%employer% 吧。他只想谈谈。%SPEECH_OFF% | 你经过一颗挂着绳子的树。旁边一人大喊道。%SPEECH_ON%小心，死人在走路！%SPEECH_OFF%当你转头看向他时，他大笑起来。%SPEECH_ON%别担心，我觉得他们只是把东西挂那儿演习而已。现在还没理由用它。去见见%employer%吧。%SPEECH_OFF% | 你路过一个正在看通缉令的人。他盯着它，然后盯着你，再盯着海报，然后又盯着你。%SPEECH_ON%该死。如此接近。嘿，佣兵！我听说%employer%想找你聊聊！%SPEECH_OFF%}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "我们来谈谈吧。",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];
gt.Const.Contracts.IntroSettlementNeutral <- [
	{
		ID = "Intro",
		Title = "Negotiations",
		Text = "[img]gfx/ui/events/event_20.png[/img]{一个罩着斗篷的男人向你嘶声说话，兜帽遮掩下只看得到牙齿和鼻子。你没有时间和麻风病人或小丑打交道，于是让那家伙赶紧别挡道。但是，他反而开始向你搭话。%SPEECH_ON%我的主人需要你的服务，他听说过你的功绩。跟我来，我带你去见他。%SPEECH_OFF%你把手放在剑柄上，点了点头。 | 你独自坐着，仔细研究着一张地图，这时一阵强风吹来。当你极力想将纸按在桌子上时，%randombrother%，你的一个伙计，上前将一个酒杯敲在了地图的一角上。看到他微微张开嘴巴，呼出一口有酒气的气息。他解释说他与一个名叫%employer%的当地人分享了一些故事，而那人对你有个提议。地图和上面的土地不会飞走，于是你同意见见他。 | 你刚走进%townname%，一个男人就立马穿过泥泞向你走来。他称自己受雇于%employer% —— 一个镇上有一定权势的人物，而其与其它人的想法与金钱决定需求你的服务。 | 一人走近，递来一个卷轴。%SPEECH_ON%我的名字是%randomname%，%employer%以及%townname%正派人的代表。我们需要你的服务，佣兵。%SPEECH_OFF% | 一人从路边走上前来。他身着乡下人的服饰，却有两名装备精良的护卫。他称自己是受雇于%employer% —— %townname%的当地领袖的议员。你被要求觐见这位男士。 | 一个兜帽男示意你跟着他。他紧张地看着身后，带着你来到当地一家酒馆的后屋。他在与你说话前花了点时间朝窗外窥视 —— 可能是在避免隔墙有耳。%SPEECH_ON%一个叫%employer%的重要人物想见你一面。 他在这镇子里颇有名望，所以你应当理解我的谨慎。%SPEECH_OFF%他将一张纸向你推来 —— 上面写着指示。 | 一个醉酒的女人向你扑来。她几乎是在你耳边满口下流之辞，你用棍子将她打开。一个旁观者匆忙赶到你身边，将那个妇人拽开。%SPEECH_ON%滚，婊子！我要告诉你多少次？%SPEECH_OFF%那女士从容地走开了，像只树丛间晃荡的动物般从一个男人爬向另一个。你的“营救者”伸出手。%SPEECH_ON%我是%randomname%。一位大人物，%employer%，一直在找你。请跟我来，我将带你去见他。%SPEECH_OFF% | 当你的男人们在镇子里晃悠时，你来到酒馆找了个位置坐下。屁股还没坐热，一个陌生人就凑了过来。%SPEECH_ON%你是%companyname%的人吗？%SPEECH_OFF%你点头。那人也点头，把手插进了口袋。你手伸向了匕首。而那陌生人伸出手来。%SPEECH_ON%放轻松。我身上有一把剑。如果我想要你命，那坐下来可能不是个好办法。%SPEECH_OFF%那人掀起剑鞘，它撞到了桌子的底部。他歪着头，好像在说“明白了？”你点点头，而后那人继续将手伸进口袋，掏出一张纸条递给你。%SPEECH_ON%一位叫%employer%的当地议员想见你。%SPEECH_OFF% | 你在%townname%四处闲逛，然后拦住一个男人并问他周围有没有什么有趣的事情。他一边思考，一边把一根又臭又滴着水的草叉放在肩上保持平衡。%SPEECH_ON%这个嘛。有马子啊，嗯 ——%SPEECH_OFF%那人咧嘴一笑，基本是被自己的话逗乐了。%SPEECH_ON%她们很好。还有%employer%。等等，你不是那个佣兵伙计吗？%SPEECH_OFF%那陌生人眯起眼睛看着你，然后迅速继续说道。%SPEECH_ON%哦靠，当然了。没错，%employer%谈到过你。他说……“%randomname%，去清理马厩里的屎蛋。而且如果你看到人们说到的佣兵，就让他来找我。”%SPEECH_OFF%他停了下来，指着路边的一栋建筑。%SPEECH_ON%所以，是的。要是你想赚点钱花花，那里的那家伙很愿意付钱。我觉得他不需要另外一个人来铲屎，如果你是在担心这个问题的话。这屎我已经包圆了！%SPEECH_OFF% | 你走进一间酒馆，吸引了一些人的目光。男人们互相窃窃私语，女人们则像往常一样抛媚眼。酒保将一块布揉成一团塞进一个杯子里，然后招呼你。%SPEECH_ON%你就是人们谈论的那个佣兵吧。%SPEECH_OFF%你好奇地问他是如何知道的，毕竟你并不是唯一一个带着剑走来走去的人。他笑了。%SPEECH_ON%眼睛。我从眼睛就能看出来。你是一个追逐最危险猎物的人。夺取生命的生活本身就是一个世界，但你寻找那些生命已经获得奇怪价值的人，他们的死将成为他人金钱的增殖。一场交易被立下，而你就成了这场交易的手段。就是这样对吧？你是一位骨头收集者，我的朋友。一位预付钱款的掘墓人。%SPEECH_OFF%你理解地点头。突然，一人向你走来，说当地的大人物%employer%想见见你。当你回头时，酒保已经走开了。 | 你撞见一个靠在门廊柱上的男人，他叫住了你。%SPEECH_ON%%employer%一直在找你，佣兵。他就在村里的集会所那边。%SPEECH_OFF%那陌生人向着路边稍远处的一座大建筑点了点头。%SPEECH_ON%我希望你能好好表现，佣兵。%townname%的居民对你们这类人持谨慎态度，但这不代表他们的心无法被征服。%SPEECH_OFF% | 一个男人在你走过时正弹奏着弦乐器。他弹出一记刺耳的和弦，你转过身去正看到他在笑。%SPEECH_ON%嘿，我就知道那会引起你的注意。%employer%说我们应该留心你……这样职业的人。如果你在找活儿的话，找他准没错。%SPEECH_OFF%你询问他这个大人物是否大方。那男人点点头。%SPEECH_ON%当然。他曾经把这柄鲁特琴作为报酬给我。现在我只是在等那些老魔鬼们下来和我比上一曲。%employer%说如果在弹奏比赛中赢了他们，那他们就会给我一把金鲁特琴。这才是我所说的好报酬，不是么？%SPEECH_OFF%男人转身继续弹奏乐器，从琴弦上拉出一段悲鸣的曲调。远处，狗开始嚎叫。 | 当你正在盘点库存时，一个看起来生活条件不错的男人注意到了你，并朝你走来。他自称为%townname%的大人物%employer%工作，而那人想与你见面。你将活儿交给%randombrother%，然后让那人带路。 | %randombrother%走近你，身边跟着个小跑着的男孩。当他们走到你面前时，这对人同时开口说话，停下，然后再开始。你举起手，然后指向小男孩，他立马说%employer%想见见你。然后你指向那个战斗兄弟，他说当地的一只母狗已经生了一窝小狗，也许%companyname%可以领养其中一只。你撅起嘴唇，告诉男孩带你去找他那已经在等着你的主人。}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "我洗耳恭听。",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];
gt.Const.Contracts.IntroSettlementFriendly <- [
	{
		ID = "Intro",
		Title = "Negotiations",
		Text = "[img]gfx/ui/events/event_20.png[/img]{A few peasants walk up to you and one even offers a hug. You decline.%SPEECH_ON%It\'s good to see you again, sellsword. %employer%\'s been looking for you.%SPEECH_OFF% | A woman offers you a flower when you walk into town. This is against the usual response which is shutter the windows and hide the kids. You take the flower and she sways her skirt a little before prancing away. A man comes up to you.%SPEECH_ON%Sorry for that bother, sir, the townsfolk seemed to have taken a liking to you. %employer% as well, seeing as how he\'s been looking for you since the moment he heard you were in town.%SPEECH_OFF% | A pack of dogs streams down the road, a few children in chase. They scatter past you one by one, the dogs howling and huffing with joy, the children screaming out greetings. A woman walks up, a metal skillet in one hand and a wash rag in the other.%SPEECH_ON%Hey there sellsword. I probably should let one of them messenger men find and tell you this, but I got the news so I\'ll tell you anyhow. %employer%\'s looking for you.%SPEECH_OFF%She flutters her eyes. You smile back and nod. %randombrother% smirks.%SPEECH_ON%See something you like, sir?%SPEECH_OFF%You tell the man to go fark a goat. | A couple of bleating goats are being lead down the road. They shuffle through the mud, prodding their noses through the muck and somehow finding things to chew up. Their shepherd plants his cane in the ground.%SPEECH_ON%Hey there mercenary. %employer%\'s been looking for ya.%SPEECH_OFF% | A man sitting on his porch leans forward at the very sight of you. He points a finger.%SPEECH_ON%Well if it ain\'t the sellsword everyone been talking of.%SPEECH_OFF%You look around before nodding. He grins and hoots and hollers.%SPEECH_ON%Hell, it\'s damned nice seeing you around again! And it\'d be short of me not to tell you that %employer%\'s been tryin\' to find ya. Go and see him. Tell him I sent ya, maybe he\'ll send me a reward. Probably just a bunch of flowers, that bastard. Or a cat. Who wants a cat? Why did he ever send me a cat? I told him I hate cats...%SPEECH_OFF%As the man rambles on, you quietly make your leave. | A woman runs up to you. She brings her children with, not exactly taking precautions with a sellsword. One of the kids swings their arms around your leg.%SPEECH_ON%He\'s back!%SPEECH_OFF%You look down and grin, subtly trying to shake the bastard off although he just takes it for play. The mother retrieves the spawn before pointing up the road.%SPEECH_ON%%employer%\'s been lookin\' for ya. Tell him I fetched ya, maybe he\'ll come and fix our well once he knows I done a favor.%SPEECH_OFF%She looks world weary, dragged to the hells by the cheeriness of her children. | You walk into %townname% and a man beckons you into his garden. He\'s tending the plants, using a steady hand to clip the vegetables or fruit or whatever it is, you\'re not a gardener.%SPEECH_ON%How are you doing, sellsword? If you\'re wondering, %employer% been talking of you. Suppose he\'s been wanting to see you, too, if yer interested in some more business. Here, catch.%SPEECH_OFF%He turns and tosses a {cabbage | onion | potato | tomato} at you.%SPEECH_ON%Nice catch.%SPEECH_OFF%You take a bite and nod back.%SPEECH_ON%Doesn\'t taste half bad.%SPEECH_OFF% | An old shopkeep waves at you.%SPEECH_ON%It\'s good seeing you again, sellsword. How often do you hear that?%SPEECH_OFF%He thumbs down the road.%SPEECH_ON%If you\'d like to do some more of that good work, then %employer% been looking for you.%SPEECH_OFF% | A man fleecing a sheep looks over to you, the runt wriggling around.%SPEECH_ON%I should just eat this lil\' bastard. Look at her go. Quit it, would ya?%SPEECH_OFF%He elbows the beast and it bleats, cursing back with as much sapience as a sheep can muster. The man looks up at you again.%SPEECH_ON%Say, yer that sellsword everyone\'s been talking about. I should probably tell you, and I guess I will, heh, that, uh, %employer% been looking for you.%SPEECH_OFF%The sheep jumps in an attempted escape, but the man slams her down.%SPEECH_ON%You little git, I\'mma milk yer tits dry if you try that again!%SPEECH_OFF%}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "I\'m all ears.",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];
gt.Const.Contracts.IntroSettlementCold <- [
	{
		ID = "Intro",
		Title = "Negotiations",
		Text = "[img]gfx/ui/events/event_20.png[/img]{当你走进小镇时，一个老人正坐在小屋的门廊上。一看到你便吐了口唾沫。%SPEECH_ON%佣兵，你真有胆在这里露脸。%SPEECH_OFF%他用袖子擦了擦嘴。%SPEECH_ON%但我不会撒谎说我们不需要你，尽管我非常讨厌不得不承认这一点。过来吧，你知道若想赚钱该去找谁。%employer%一直在他总呆着的地方。%SPEECH_OFF% | 你走进%townname%，一男人冲你大喊。%SPEECH_ON%见鬼，这不是%companyname%和他们的毒蛇头头嘛。%SPEECH_OFF%你挑了挑眉毛，手握住剑柄。男人笑了起来。%SPEECH_ON%我们不喜欢你，佣兵，但我们确实需要你。来吧，往这边滑，我们好谈正事。这才是你真正关心的，对吧？你要找的人是%employer%。%SPEECH_OFF% | %townname%的居民在你走进镇子的同时从你的视线中消失。许多百叶窗砰地关上，孩子们安静下来，匆匆离去。一个男人站在路中间，双手叉腰。%SPEECH_ON%哟，是你啊。%SPEECH_OFF%你环顾四周，确保不会有什么埋伏降临到你头上。男人笑了。%SPEECH_ON%我们不会要你小命的，佣兵。我是来撮合交易的，仅此而已。如果你感兴趣，就来找%employer%吧。%SPEECH_OFF%他吐了口唾沫，转身走开了。你又花了一会儿时间留心埋伏。 | 一看到你，惊慌失措的妇孺儿童就逃开了。几个男人逗留下来，当你经过时，他们紧握着草叉或贴身武器。一名老者走上前来，上下打量着你。%SPEECH_ON%%employer%找你有事。我不知道经历了你的所作所为之后他为何还要找你，但你和他的交易我犯不着从中作梗。%SPEECH_OFF% | 几个%townname%衣衫褴褛的民兵在你走进小镇时侧目盯着着你。其中一人吐了口唾沫大喊。%SPEECH_ON%%employer%找你有事，佣兵。%SPEECH_OFF%他的声音逐渐淡去，你觉得那似乎转为了粗言秽语。 | 一名妇女匆匆赶到路中抱起自己的孩子。她把孩子转了个圈，手紧紧护住小孩后脑勺。%SPEECH_ON%佣兵，我不知道你又来这里干什么，但是%employer%一直在找你。%SPEECH_OFF%她快步跑开，虽然时不时眼睛仍谨慎地瞥向身后。 | 当你走在路上时，孩子们围着你的脚步转悠。他们的父母尖叫着冲出来，让自家孩子赶紧离你远点。一位母亲拉走自己的女儿，同时用敌视的眼神盯着你。%SPEECH_ON%别想碰我的孩子。如果你想找活的话，就去找%employer%。%SPEECH_OFF% | 一个男人在看到你的时候正在修理他家的屋顶。%SPEECH_ON%啊，见鬼，又是你？%SPEECH_OFF%你环顾四周，然后转向那个人。他笑了。%SPEECH_ON%乡亲们都不太喜欢在这看到你。我想我在这件事上是中立的，不过话说回来，当你在十英尺高的空中时，很容易保持观望态度。%SPEECH_OFF%他咧嘴笑了笑，但他的脚却踢了出去，差点从屋顶上滑下来。他紧紧抓住茅草屋顶。%SPEECH_ON%哇！唔，总之，%employer%在找你。别在意人们的憎恨，那对他们来说是本能的。%SPEECH_OFF% | 人们一看到%companyname%就四处跑开。一个男人在窗户后大声喊道。%SPEECH_ON%诶，雇佣兵！%employer%一直想见你们呢！%SPEECH_OFF%你还没来得及回应，他就迅速关上了窗户。}",
		Image = "",
		List = [],
		ShowEmployer = false,
		ShowDifficulty = true,
		Options = [
			{
				Text = "我们来看看这是怎么回事。",
				function getResult()
				{
					return "Task";
				}

			}
		]
	}
];

