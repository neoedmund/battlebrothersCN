local gt = this.getroottable();

if (!("Strings" in gt.Const))
{
	gt.Const.Strings <- {};
}

gt.Const.Strings.PayTavernRoundIntro <- [
	"男人们一边喝酒一边欢呼你的名字。",
	"男人们为倒下的同志喝酒。",
	"男人们一边喝酒一边为战团的名字欢呼。",
	"男人们为女人和她们的胸脯喝酒。",
	"男人们为忠诚的军犬喝酒。",
	"当你的男人喝酒时，小酒馆里充满了欢声笑语和轻松愉快的故事。",
	"当男人们分享他们前世的故事并享受自己时，艰苦的雇佣军生活需要休息。",
	"“指挥官万岁！”男人们喊道。",
	"你的人喝酒时总喜欢夸大自己的成就。",
	"烈酒暂时模糊了战斗的恐怖。",
	"你的男人欢呼，为财富和长寿干杯。",
	"啤酒使一天的艰辛消失了。"
];
gt.Const.Strings.PayTavernRumorsIntro <- [
	"顾客碰杯时大喊你的名字。饮料使他们的舌头放松。",
	"食客赞许地点头。",
	"人们举杯表示感谢。",
	"众人赞叹不已。",
	"旅店老板敲响了铃，让每个人都知道下一轮在你身上。"
];
gt.Const.Strings.RumorsLocation <- [
	"这里的 %direction% 有一个地方叫%location% %terrain%。我想大多数人都知道它，但很少有人会去那里冒险。",
	"前几天 %randomname% 告诉了我关于 %location% 的事, 他说:“这里的 %distance% %direction% 充满了宝藏”，当然, 也有可能是我记错了。",
	"如果你要冒险的话，这里有个地方叫 %location% %terrain% %direction% 。不知道现在谁住在那里。",
	"听说过 %location% 吗？人们说它闹鬼，死人行走等等。就在离这里 %direction% 的附近。也许 %townname% 的其他人可以告诉你更多...",
	"你知道...天哪，它又叫什么？从这里到 %direction% %distance%，%terrain%。我这辈子都不记得我们以前叫它什么了......",
	"你在来这里的路上遇到 %location% 了吗？ 什么, 那就在这里 %direction% 的 %terrain%。应该会有人雇你把那东西烧成灰烬。因为那里没有什么好事发生，这是肯定的。",
	"我们在来这里的路上发现了一些隐藏在路上的东西，就在 %townname% 的 %terrain% %distance% %direction% 附近。或许当地人会知道怎样称呼它，那里真值得去瞧瞧。"
];
gt.Const.Strings.RumorsContract <- [
	"我听说 %settlement% 的议会正在招聘雇佣兵, 只是不知道是为了何事。",
	"几天前，一群年轻的小伙子去了 %settlement%。他们到处寻找装备精良并愿意支付高额佣金的雇佣武装人员。但愿他们能活着回来吧。",
	"如果你们正在找工作，我听说他们正在 %settlement% 招聘佣兵。",
	"你听说他们想在 %settlement% 雇佣战士？",
	"%settlement% 的某个人前几天来过这里，想聘请强壮的小伙子来解决他们在那里遇到的问题。不过我想没多少人会跟他们走的。",
	"雇佣兵，嗯？这些天我们得到了一些。就在几天前，一群自称 %randommercenarycompany% 的队伍打这经过，往 %settlement% 的方向去了，他们说在那能弄到更多的硬币",
	"如果这是您正在寻找的工作，他们说 %settlement% 愿意支付克朗来寻找勇士。",
	"前几天听说 %settlement% 的一些花哨的胖商人正在寻找雇佣武装警卫。好吧，我才不会为了那些人送命呢，我的老婆和房子都在这呢。"
];
gt.Const.Strings.RumorsGeneral <- [
	"朋友，如果要想你的商品能卖个好价钱，你应当去任何一个大城市或者城堡，别没事老往那些破村庄跑。",
	"%randomtown% 那里的酒比这的猫尿好喝多了！",
	"今天早上来了个商人声称在这附近的山上看到过僵尸。我才不信那死骗子呢！",
	"世界上有许多长期以来被人遗忘的地方，却蕴藏着巨大的财富。",
	"如果你有机会去 %randomtown% 的酒馆，一定要尝尝那里的烤全羊，你在别的地方是吃不到那么好吃的东西的！",
	"雇佣兵在这一带是不受欢迎的。他们就像普通强盗一样杀戮、抢掠和抢劫，所以你就别妄想会有欢呼与鲜花了。",
	"如果你需要补给品，去 %townname% 的市场找 %randomname%。告诉他是我让你来的！",
	"明晚著名的 {音乐鸟 | 吟游诗人 | 故事家 | 夜莺 | 诗人} %randomname% 要来这家小酒馆，你最好不要错过！",
	"不要相信理发师的药剂！我表哥朋友的朋友的叔叔喝了一瓶后变成了癞蛤蟆，我发誓这是真的！",
	"我听说一支叫做 %randommercenarycompany% 的自由佣军喜欢收集敌人的耳朵并且戴在脖子上！",
	"我告诉你，千万别喝 %randomtown% 的水，那里的水喝了立马就会拉肚子！",
	"我堂兄 %randomname% 像你一样也是雇佣兵，加入了一支好像叫做 %randommercenarycompany% 的战团。不过从他离开镇子后就再也没他的消息了…",
	"前人的经验：如果你珍惜你的雇佣兵声誉，你最好不要欺骗雇主。不然他们会不遗余力的追捕你，说你坏话让你付出代价。",
	"那些贵族家族就像一对老夫妇；不断的吵架和争吵。要说谁受害最深？怎么可能是那些高居城堡的贵族，当然是咱们这些老百姓！",
	"我要远离沼泽与湿地。因为那里可怕的恶疾在等着你呢。",
	"我听说 %randomtown% 的议会中有一名真正的巫士，我也不确定是不是真的。",
	"我喜欢女人，无论是她们的样貌还是谈吐。难以想象没有她们的世界我该怎么办…",
	"这是你和 %companyname%！还记得我吗？我们在 %randomtown% 讨论过...好吧，我也不太记得讨论过什么了，但我们确实见过！来，喝一杯！你们最近怎么样？",
	"死亡是生命的一部分。你越早接受它，你就能在这世上得到的越多。",
	"前几天我掉了颗牙齿，你看到没？我觉得其他的牙齿也松了，快要掉了。你看出来的吗？来，摸一下，是不是松了？",
	"上帝啊，我想去尿尿，你能帮我看着这杯啤酒吗？"
];
gt.Const.Strings.RumorsCivilian <- [
	"朋友，永远别轻易相信那些贵族。因为你永远不知道他们的真正目的是什么。",
	"有没有想过放下武器安定下来呢？雇佣兵生涯往往都是短暂的。",
	"几天前有人发现 %randomname% 的农田被夷为平地。他们全家都被吊死在附近的橡树上……",
	"自从某些强盗烧了我家老头的农场我就把干草叉换成啤酒杯了。那些人早晚会有报应的。",
	"我们的民兵真可怜，总拿着生锈的长矛和虫蛀的盾牌。我希望议会能给那些可怜虫买点真正的装备吧。",
	"我们这里不需要佣兵！你们只会带来麻烦。咱们的民兵就一直很好地保护着我们。",
	"昨晚碾磨工的女儿失踪了。人们找到她时却没啥事，但她什么都不肯说。",
	"靠，%randomname% 和他的狗。不论晴雨，昼夜不停地吠叫。我再也受不了了，我真的不能……",
	"我听说老坟场的一些墓碑已经倒了。但无论如何头脑正常的人都不会去那。",
	"前几天我从一名路过的商人手上买了这把撒克逊大刀。这真的便宜，他说男人就该懂得保护自己和家人，明白不。",
	"我不信任这里的民兵。有一次，一群不法之徒来了后，他们不做任何反抗就掉头往山上跑了！",
	"我们这里有个杀人犯。一个来自 %randomtown% 的狗杂种用刀子刺进了一名商人的后背。那家伙在星期天会被处以绞刑，你应当也来看看的！",
	"上星期一名叫做 %randomfemalename% 的女人被女巫猎人烧死了。那人只来了一天就指出女巫的罪名然后烧死了她。议会那边也没反对，那名女巫猎人很快就走了。我很想知道他是谁。真庆幸他把我们从女巫手中救了出来，我猜想..."
];
gt.Const.Strings.RumorsMilitary <- [
	"跟兽人交过手吗？据说它们有两人高并且比人类强壮三倍，随手一击就能把人劈开两半！",
	"为你的战团招募啥也不懂的农夫和渔夫是件好事，但你应该在这样的城堡里寻找新兵。在这里，你发现那些真正知道剑的哪一头该指向哪里的人。",
	"我告诉你，坚固的盾牌才是真正的救命稻草。所有人战斗都会带上它。",
	"一名经历过无数战斗的驻军指挥官声称只要耸肩就能用战斧砍中兽人的头部，也不知道他是怎么做到的，管他呢。",
	"外面的世界比强盗更可怕呢。如果你走出边境你很快就会明白我的意思了。",
	"我总是依赖我的斧头来粉碎敌人的盾牌。一旦没了防护，即使最高大的战士也会很快倒下。",
	"要问我在当兵时学到了什么，那就是高地赢得战斗。相信我一次。",
	"我曾经也是一名雇佣兵，直到我的膝盖中了一箭。",
	"最近我看了一名 %randomnoble% 的比赛。该死的，那场景，那家伙。我是说那吊毛比赛的样子。最后得到了奖赏令所有女人都为他发狂。",
	"我现在老了，但我还记得我的第一场战斗。在第一根箭射出去之前我就尿裤子了，哈哈！",
	"不久之前去了 %randomtown%，那里的人告诉我有一种狼像人一样高大，牙齿像我的手指那么粗。真不想遇见它们。",
	"你知道兽人喜欢剥掉它们击败的敌人身上的东西来做盔甲吗？说真的，我不是在吹水。它们喜欢穿着这些战利品。如果你有机会遇到它们就会明白了。它们看起来就像一两个骑士的合体一样。",
	"%townname% 的第一战团。我服务过的最好的混蛋与流氓。我不会拿他们和世界做交易。",
	"我很想念我的妻子与两个女儿。在 %townname% 驻扎很久了，但作为男人总得为她们的桌子摆上食物啊。",
	"我们很快就要出去巡逻了。有时候我觉得如果不是我们一直守卫着的话，这里早完蛋了。",
	"去他妈的巡逻任务。我们才刚回来，脚上还起了水泡，现在又要出去了。我说能不能给点兽皮让我们穿呢！",
	"我数月前与地精的战斗中受了重伤。再也感觉不到我的腿了，但小伙子们硬是扛着我跑回了 %townname%。愿上帝保佑他们。",
	"你能通过那些插着头盖骨和骨骼的柱子来识别绿皮的领地。就是人类的头盖骨和骨骼。",
	"到目前为止我杀了十四个人了。额外加三个女人。你呢？",
	"我经常在岗哨楼站岗。说实在的，向过路的旅客吐唾沫是我一整天唯一的乐趣了。",
	"守卫军的情绪已经很糟糕了。他们说工资已经延迟发放好几次了，现在他们都开始失去耐心了。",
	"当我搬到 %townname% 来的时候没想到生活会如此枯燥与艰苦。但我想这也总比在田里累的直不起腰来要好......",
	"我更喜欢在战斗中使用链枷。即使敌人带着盾牌也很难抵御，我只要挥舞一下链枷就能让他们的脑袋开花！",
	"在这附近他娘的几乎不可能找到可靠的盾牌，这些破玩意总是碎成两块。为了以防万一，现在我总是在背上背块备用的。以后再让我跟拿斧子的人战斗可必须多付点钱，哈哈！",
	"总有一天我会成为战团的扛旗手。这是有史以来最勇敢的人，对于普通人来说也是最高的荣誉。我甚至见过一名骑士与咱们的扛旗手握手呢。",
	"我曾经训练过民兵，让我告诉你，当你的人还不明确职能的时候矛就是最好的武器。便宜而且命中高。当好几个人组成矛墙的话敌人还很难靠近。",
	"与地精战斗过没？那是一种阴险的狗杂碎，不要被它们的体型糊弄了。我会带上筝型盾来防御它们的弓箭。如果你有钱的话还可以带着战犬，在它们四散逃跑时追上它们。"
];
gt.Const.Strings.RumorsMiningSettlement <- [
	"有一天我的鹤嘴锄在敲打时坏掉了。飞出来的碎片蹦到我脸上。好在只是失去了一只眼睛而已！",
	"矿山就像个死亡陷阱，我们这每星期都有人挂掉。我觉得跟着你冒险还可能更长命点呢，哈哈！",
	"你知道，采矿也有它的优点。我们从不会被雨淋湿，最终了结你的是尘土而已。",
	"在另外一个矿井，%randomname% 找到了一块拳头大小的金块！但他还没来得及藏起来就被工头没收了。"
];
gt.Const.Strings.RumorsFarmingSettlement <- [
	"即使今年收成不好，地主们也不让我们休息！你要知道，那些贵族还要举办盛宴呢...",
	"如果你想准备食物补给品那就去市场找 %randomname%。他那里的东西物美价廉。",
	"我干了一辈子的农夫有时候真想加入到像你们一样的战团去冒险…好吧，现在一切都晚了。",
	"有太多无知的年轻人梦想着去冒险。我希望你能照顾好他们，并且有天能把他们安全带回家。"
];
gt.Const.Strings.RumorsFishingSettlement <- [
	"大海就像一名喜怒无常的怨妇。前一秒还平静地像镜子一样，后一秒你就发觉自己在暴风雨中拼命了。",
	"没有人知道在漆黑的深水里生活着什么，但是你可以听到老渔民们谈论比任何船只都大的巨鱼，有着像坚果壳一样能把船压碎的触须，以及藏着水底的恶魔之眼。",
	"一些老渔民会告诉你，那些在海上失踪的人被诅咒只能在海床上行走，只有当他们把其他人拖下去接替他们的位置时才会被释放。牧师说这不是真的，但我不知道为什么长辈们要这么说？",
	"我总是把我能抓到最大的鱼放在 %randomfemalename% 的门前来追求她。总有一天我会向她坦白并向她求婚！"
];
gt.Const.Strings.RumorsForestSettlement <- [
	"我做了一辈子伐木工，就像我的父亲一样。但是现在的年轻人都喜欢冒险，喜欢四处看看，你很可能会在市场周围发现一些到处闲逛的人，他们会毫不犹豫地和你一起上路。",
	"森林最深处存在着某种生物…不过没人敢与之对话，它们可能不是普通的动物......",
	"我说，你对木雕感兴趣吗？%randomname% 的作品就像真正的艺术一样闻名全国！",
	"对于像你这样的雇佣兵来说，雇佣一名伐木工对你的战团很有帮助，我说的。他们擅长挥舞巨斧！",
	"我一直听到人们说有只眼睛在森林的边缘看着他们。好像是一些卑鄙的生物在树林里筑巢。也许是它们在攻击前估量猎物的大小。",
	"从我记事起，这附近的树林里到处都是野生动物。大量的鹿、野猪、狼和熊在森林中游荡。正因为如此，家庭从小就有教授箭术的传统。你可以尝试着和我们这的年轻人比试一下箭术，你能体会到什么叫耻辱。"
];
gt.Const.Strings.RumorsTundraSettlement <- [
	"你可能认为我们的土地即荒凉又贫瘠，但一旦你住在这里，你就会爱上它！",
	"这地区的贵族和家庭依然十分强大，并决定着我们的命运。那些南方的娘娘腔永远也不会明白北方的彪悍是怎么一回事。",
	"如果你想通过贸易来快速的赚一些硬币，那就去收集兽皮吧。这里附近的兽皮是最好的。",
	"如果你在寻找有能力的人来充实你的战团，那你来对地方了。我们北方的男儿既强壮坚韧又诚实！"
];
gt.Const.Strings.RumorsSnowSettlement <- [
	"抵御刺骨寒风和严寒的最佳良药就在这里：啤酒和蜂蜜酒！",
	"两周前，%randomname% 从酒馆回家的路上失踪了。第二天早上发现他冻得像块石头一样。可以把他当作雕像卖给那些贵族收藏家了，哈哈！",
	"有传言说暴风雪中会有人影移动，还有神秘的嚎叫会随风飘荡...但我不想让你因为民间故事而不安。",
	"很久以前，有人告诉我，这片土地是绿色的，有许多令人自豪的城堡和令人敬畏的岗哨塔。可到了如今，大部分都已经被夷为平地了，到处都是雪。但他们一定还在某个地方...",
	"四年了。四年前我看到了一个快速赚硬币的机会，袭击了路边的一个小教堂。把烙铁插进了一个试图阻止我的圣人身上；现在，再多的克朗也无法偿还我精神上所欠的债。"
];
gt.Const.Strings.RumorsSteppeSettlement <- [
	"你的人穿着那些盔甲一定汗流浃背了吧。也许你应该在月亮出来的时候再出发？",
	"我告诉你，南方的葡萄酒是世界上最好的。但是你最好在用酒瓶砸别人脑袋前考虑清楚，因为它不便宜。",
	"前几个星期，一个北方的商人在大草原上迷了路。他回来后，经常胡思乱想，他说发现一些湖泊周围都是郁郁葱葱的植物和奇怪的动物。",
	"告诉你的人别打酒馆老板女儿的主意。上一个求爱者的鼻子都被削掉了。",
	"我原来是北方人，几年前刚搬到 %townname%。因为无法忍受寒冷；没完没了的风雪。所以有一天，我对自己说，%randomname%，去有太阳又温暖的地方吧，你就不用每次出去收集柴火时都瑟瑟发抖了。我就这样做了。至此我也没后悔过。"
];
gt.Const.Strings.RumorsSwampSettlement <- [
	"你喜欢蘑菇吗？嗯，我最恨它们了！但是在这片臭气熏天的沼泽里，除了咬人的蚊子和蜘蛛外，再也找不到别的东西了。",
	"商人不常来这里。他们的马车往往会陷在泥里，一旦发生这种情况，谁来帮助他们呢...",
	"曾经有一条石路通往这里，路上有商人、游客和各种各样的人。直到有一天它完全沉入了沼泽中，现在看看这个地方...",
	"晚上不要在沼泽附近闲逛！你会迷路的，真的。但在沼泽中还有更恐怖的事情呢。你问一下周围的人就知道了。"
];
gt.Const.Strings.RumorsDesertSettlement <- [
	"那些北方人为我们的丝绸和香料付了很多硬币，所以我们的商队一直在增加。商队需要护卫，你知道吗。",
	"如果我能给你一条建议，那就是：不要在沙漠里探索的太远。世界边缘有比热和沙更糟的事情。",
	"那些北方的狗无权进入我们的土地，他们应该呆在属于他们的地方！"
];
gt.Const.Strings.RumorsItemsOrcs <- [
	[
		"听说一辆运送贵重仪式武器的商队在这里的 %direction% 方向被劫了。传言的受害者身上的每一根骨头都断了，空气中还弥漫着可怕的恶臭。",
		"最近有一名顾客说他有一件叫做 %item% 的武器想出售。他说来这里的路上被绿皮兽吓了一跳并丢失在这里的 %terrain% %direction%。",
		"前几天有个旅行者告诉我，他亲眼看见一个巨大的人挥舞着一把叫做 %item% 的东西。听起来像废话，但如果你感兴趣的话你可以从这去往 %direction%。"
	],
	[
		"几天前的一个晚上一个长着漂亮脸蛋的冒险者来过这。他向着 %direction% 出发猎杀绿皮去了。他戴着一个华丽的盾牌，看起来就像个骑士，但他没有承认。",
		"他们说有一种著名的盾牌，我忘了叫什么了，曾经阻挡了一块从山上砸向营地的大圆石。这听起来这恶心，并不是说我们会知道它现在是不是兽人的战利品，藏在离%distance% %direction% 的某处。",
		"别把我的话当真，但是听说在这的 %direction% 有几个绿皮智障拿着一个不可思议的名叫 %item% 的盾牌。我都不知道它们怎么搞到的。",
		"几天前一些贵族领地遭到绿皮掠夺。还带走了一些著名的盾牌与战利品。据说那些绿皮杂种住在这里 %direction% 的某个地方。"
	],
	[
		"熟悉兽人？它们就是强壮如牛的野兽！数周前一支名叫 %randommercenarycompany% 的雇佣兵团朝着 %direction% 狩猎它们去了。然后一去不复返了，不过他们的队长穿着一件令人印象深刻的盔甲！",
		"噢，你听说过 %item% 吗？据说在数世纪前的兽人入侵时期被偷了。现在有人说在这里的 %direction% 见过它，但是我不了解细节。我不是有意让你对它抱有希望的。",
		"几天前好几个著名的盔甲师被杀了。据说兽人洗劫了他的住所并带走了他的杰作，跑向这里的 %direction% 去了。可能其他人能告诉你更多情况。",
		"带有 %randomnoble% 字样的盔甲被一群绿皮永眠在这里 %direction% 的某处。他虐待仆人是出了名的，所以你在这里是找不到任何人为他哭泣的。对于他曾经吹嘘的精心制作的盔甲来说，这简直是一种耻辱，那件盔甲能买许多猪和牛呢。还有数不尽的鸡！"
	]
];
gt.Const.Strings.RumorsItemsGoblins <- [
	[
		"有一天一位非常生气的贵族跟我说有些矮小的绿皮毒死了他家的看门狗后偷走了他的传家宝。他发誓他们肯定藏在离这里 %distance% 的 %terrain% 附近，但我不认为他说服过任何人帮他找回它。至少肯定不会是我。",
		"害怕绿皮吗？几天前一群久经沙场的士兵来过这里。据说他们想从这里 %direction% 的地精那里争取一件著名的武器，但看起来他们的计划确实没有奏效而不得不撤回来。看来他们的战利品还没到手。"
	],
	[
		"一位来自 %direction% 的农夫告诉我，他看见一些矮小的，阴险的生物在他的土地上，还拿着一件巨大闪亮的盾牌发出邪恶的声音。他说那些是地精，但我说他是被一些小孩子戏耍了！",
		"他们发现这里 %direction% 最好的制盾匠死了，脖子被一根标枪给刺穿。人们还说一些矮小的生物偷走了他一半的货物。",
		"这里 %direction% 的某处居住着一群地精。我知道这一切的唯一原因是因为每一个嘚瑟的家伙都在谈论他们是如何侥幸逃脱它们的魔掌。有人还声称在逃跑时丢了一块精良的盾牌。"
	],
	[
		"有传言说一些价值连城盔甲被一群邪恶的生物从警卫室偷到 %direction% 去了。%randomname%  说一定是地精，但没人真正看清那些家伙是啥模样的。",
		"有传言说狗头人和地精对所有闪闪发光的东西都有特别的兴趣。我自己并不相信这种说法，但是我多次在%terrain%%direction%处看到阳光下闪闪发光的东西，并听说矮小而粗壮的生物漫游在那个区域。",
		"你可能有兴趣知道昨晚我们镇外的老药剂师被抢劫了，还是在一个富有的骑士拜访他的前提下。他的助手声称一个看起来像畸形小孩的矮小生物杀了骑士，并逃去了 %direction% 的 %terrain%。"
	]
];
gt.Const.Strings.RumorsItemsBandits <- [
	[
		"有消息说一群不知哪来的强盗在这里的 %direction% 通过一次鲁莽的抢劫得到了一件神奇又锋利的武器。",
		"一群贱民企图在 %distance% 的 %terrain% 掠夺一个商队。然后他们都被杀死了，但有传言说有一件价值连城的武器在那次战斗中遗失了。那个商队护卫从那以后发了疯似的到处寻找。",
		"一位糊涂的顾客告诉我他曾经被一群流氓囚禁在 %distance% %terrain%。他说那帮人有一件外形奇怪的武器。",
		"一名守卫队的队长前段时间被革职了然后加入到一个在 %direction% 的 %terrain% 的强盗营地。我的叔叔曾经在他手下工作过，而且声称那队长在离开前在军械库盗走了一件珍贵的战利品。"
	],
	[
		"The captain of the guard deserted a while ago to join a raider camp hidden %terrain% to the %direction%. My uncle, who served under him, claims he raided the armory before leaving and grabbed a real prize.",
		"我听说一面叫做 %item% 的盾牌被发现了。%randomname% 声称那面盾牌就在 %direction% 一群彪悍的强盗手中。然后 %randomname% 说了很多他自己也不了解的话题。",
		"所有人都在“抱怨”这一带都是该死的掠袭者。“猜想他们是谣言制造者”是因为他们得到了一些类似 %item%  的珍宝才那么猖獗吧。你问我在哪？噢，或许是在 %terrain%。"
	],
	[
		"我的一个朋友的朋友前些天在这里的 %direction% 被一群不法之徒抢劫了。他宣称那个强盗头目穿了一件令人震惊的盔甲！",
		"The captain of the guard deserted a while ago to join a raider camp hidden %terrain% to the %direction%. My uncle, who served under him, claims he raided the armory before leaving and grabbed a real prize.",
		"几天前一名傲慢的年轻人来过这，我猜是一名贵族，在寻找一件古老家族名叫 %item% 的传家宝。最后我看到他从这里往 %direction%  去了。"
	]
];
gt.Const.Strings.RumorsItemsUndead <- [
	[
		"我真的不是在散播谣言，但我确实看到一只僵尸从这往 %direction% 走去了。他那只腐烂的手还抓着一把非凡的武器，但我这辈子都没胆量去那里了！",
		"昨晚来了好几个醉醺醺的流浪者，告诉我们他曾经在这里 %direction% %distance% 碰到了一只僵尸，想从僵尸手里夺取一把镶着宝石的武器。那头僵尸吼了一下他就吓跑了。他好像被吓的胡言乱语了。",
		"这里流传着许多僵尸重现大陆的传言。%randomname% 还说这里的 %direction% 就有一些僵尸。对我来说这些就是废话。"
	],
	[
		"这里的 %direction% 有许多坟墓可能都被挖空了。有人说盗墓贼在寻找一面埋藏在那里的著名的盾牌。奇怪的是没人确切的见过那些盗墓贼，可能只是谣言吧。",
		"我在翻看管家的书籍时偶然发现了一张陈旧的地图，上面描述了一个古老的贵族的埋骨之地就在 %distance% %terrain%。可惜的是没人能找到那墓穴。好吧，我猜想有些东西是注定找不到的。"
	],
	[
		"可能有一件神秘盔甲永眠在 %direction% 的 %terrain% 。我也不知道那件盔甲叫什么，我只知道很多冒险者去了那里就再也没回来过。我不知道为啥要告诉你这些，但我真的喜欢你的行业。",
		"你听说过 %location% 吗？这里所有人都知道 %townname%，自打我出生以来就刻在我的脑海里了。人们都说在人类定居之前有件盔甲被诸神一直封印在那里。"
	]
];
gt.Const.Strings.RumorsItemsBarbarians <- [
	[
		"对那些野蛮人来说，没有什么是神圣的！一个全裸的牧师从 %direction% 跌跌撞撞地来到这里。他正要把一件受人尊敬的遗物带到神殿里，但他们把它拿走了。",
		"一个佣兵战团来这里猎杀野蛮人。首领挥舞着一把我从未见过的武器。他们转向 %direction% 就从此消失无踪了。",
		"当你驶出 %direction% 的 %terrain% 时，注意观察一群凶猛的野人。他们可能会把你带到他们的藏匿处，据说在那里发现了一件著名的被盗武器。"
	],
	[
		"听我说！一个未受教育的野蛮人部落在这里的 %direction% 被看到，他们的脏手拿着一个名为 %item% 的盾牌！杀了他们，把它拿回来！",
		"一个朋友的朋友在这里的 %direction% 发现了一些野人。他发誓他们带着一个精巧的盾牌。我叫马屎，因为每个人都知道他们不像我们那样使用盾牌！",
		"他们说，只有良好的防守才给予有力的进攻。有传言说，一群野蛮人在 %direction% 的 %distance% 拥有一个著名的盾牌……",
		"我曾经和这里 %direction% 的一些不那么野蛮的野蛮人做过交易。我上次拜访他们时，他们的一间小屋里挂着一个华丽的盾牌。他们可能还在那个 %terrain%。"
	],
	[
		"你看起来需要更好的盔甲，我的朋友。如果你不害怕与凶猛的野蛮人作战，在他们那里有一个强大的精美盔甲，那个营地叫做 %location%，就在 %direction% 的 %terrain%。",
		"著名的 %item% 在军械库中被守卫了几十年，但是当北方的野人来的时候，他们带走了所有的东西。据说他们某处露营的地方在 %terrain% %distance% 离这里。",
		"我来这里是为了从我已故祖父那里取走一件传家宝，只是知道它是被劫掠的野蛮人偷走的。据说他们游荡的地方在 %direction% 的 %terrain%，但我担心我永远也回不来了。",
		"你也是来找 %item% 的吗？据说它在 %direction% 的 %terrain%。如果你要我说的话，除了废话..."
	]
];
gt.Const.Strings.RumorsItemsNomads <- [
	[
		"游牧民拿走他们想要的东西，躲在沙漠里。卫兵曾经见过他们是在 %direction% 的 %terrain%。我想他们是 %distance%。",
		"南方的白天和黑夜一样明亮。我一定是绊倒了，把我珍贵的武器丢到了 %distance% 的 %direction%，但我放弃了寻找它。",
		"古代的工匠们真的知道如何制造非凡的武器。有传言说这样的武器被一个游牧部落藏在 %direction%，但谁应该从他们那里拿走－我？哈！"
	],
	[
		"一块像镜子一样反射阳光的盾牌，比在沙漠中正午的时候还要刺眼！我在哪里看到的？如果我没记错的话，那些游牧民在这里 %direction% 的 %distance%",
		"我一生都在%terrain%边境追捕游牧民族，但我从未见过像这个人一样拿着盾牌。他在他们营地的%direction%方向，距离%distance%。",
		"游牧民不仅从活着的人身上拿东西，也从死去的人身上拿！有消息说他们从在这里 %direction% 的一个坟墓里抢掠了所谓的 %item%，那里还有他们的营地。他们真的一点也不体面。"
	],
	[
		"我曾经是维齐尔的第一军需官。当我为一位贵宾订购的著名的盔甲没有到达时，我失去了我的官职。我后来得知，随行的商队在这里的 %direction% 遭到游牧民的伏击。",
		"据说在这里往%direction% %terrain%，有一套华丽的盔甲被隐藏了起来。迄今为止，很多寻宝者都没能找到它，但也许你会更有运气？",
		"最熟练的盔甲师，碰巧是我的一个朋友，被那些该死的游牧民骗了，他们带走了他的一件珍贵的盔甲。如果你在这里的 %direction% 遇到任何游牧民，彻底搜查他们的尸体！"
	]
];
gt.Const.Strings.RumorsGreaterEvil <- [
	[],
	[
		"贵族们又在吵架了，就像花园篱笆旁的两个老太婆。他们只是无法克服他们的骄傲！",
		"贵族们会拿走你所有的克朗，还有你的儿子和丈夫，他们会葬送在他们毫无意义的斗争之火中－会受到上千次的诅咒！",
		"二十年前我在军队服役。失去了一只耳朵，看到了吗？现在我的孩子在行军。从马厩里被抓出来，被迫进入前线。不同的战争，操蛋的老一套。我祈祷他保持低姿态，举起盾牌。"
	],
	[
		"绿色的潮水不断地冲走一支又一支的军队！我们都要完蛋了！完蛋了！",
		"所有人都在逃离绿皮，但不是我！我要坚守阵地，一手拿棍棒，一手拿瓦罐！送他们上路！",
		"上一次在许多名人之战中，我们几乎没有撞退绿皮，只是勉强成功，现在他们又回来了。",
		"我们每天都听到越来越多的农场和村庄被烧毁的故事。是绿皮在掠夺乡村。"
	],
	[
		"愿老天保佑我们！死者在各地的坟墓里翻腾。他们会来索命生者。忏悔，忏悔和祈祷！",
		"贵族们在处于守势，没有人知道如何阻止对我们造成威胁的亡灵。我得把我的注意力从它身上移开－掌柜的！再来一杯！",
		"也许我应该上吊自杀，结束这一切，加入行军死者的行列。这种等待快把我逼疯了！",
		"一名男子被发现死在路上。他笔直地坐在一辆驴车上，全身干涸，就像一个由皮、卷须和骨头组成的木偶。驴也是。就好像他们的血被吸了一样。",
		"可怕的鬼魂，空荡的坟墓，来自异世界的愚昧奴隶！\n来杯酒，找个女人，在你的牙齿咬紧之前！\n喝掉这杯，不要干渴，只有三天时间直到我们死去！",
		"%randomnoble% 让他的午餐死而复生。正要咬一口健康的填充鹅时，那东西从他的盘子里跳了出来，开始绕圈拍打。在生活区喷洒烤苹果。一定是一个值得记住的景象。"
	],
	[
		"你听到消息了吗？军队在 %randomtown% 集结向南进军。我只希望镀金者有一天不要反击....",
		"如果你在找硬币，你应该往南走，给那些太阳崇拜者上一课！",
		"什么…什么！？我听不见你说话！我在神谕所和那些镀金者的追随者战斗，我耳边响起了响亮的声音……",
		"想喝点汤吗？我放了牛肉和土豆在里面。不过，没有香料。它们因为战争都用断货了。",
		"牧师说如果你不能从十字军远征中回来，旧神会接纳你。知道是件好事，对吧？那些镀金狂热分子很危险。",
		"你能相信吗？%randomnoble% 雇了一些游牧民带领他的主人穿过沙漠。该死的蠢事，如果是真的。我不敢相信那些蛇。",
		"我的一个侄子在沙漠中被杀了。可怜的小伙子。为了去保卫信仰，被一支长矛刺穿了。做这事的混蛋还活着。让他们为此付出代价，我说。让这群受三倍诅咒的人付出代价！"
	]
];
