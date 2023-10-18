local gt = this.getroottable();

if (!("Strings" in gt.Const))
{
	gt.Const.Strings <- {};
}

gt.Const.Strings.CharacterNames <- [
	"西古德",
	"齐格弗里德",
	"哈尔玛",
	"哈拉德",
	"西格博德",
	"齐格瓦德",
	"乌弗尔特",
	"卡勒",
	"伊斯本",
	"哈根",
	"埃瓦尔德",
	"维泽尔",
	"温纳尔",
	"巩特尔",
	"伊瓦尔",
	"嘉诺德",
	"博泰尔",
	"伊戈尔夫",
	"维迪坎德",
	"伊贡",
	"卡齐米尔",
	"海德利奇",
	"弗里德利奇",
	"温道尔",
	"哈索",
	"威尔瑞奇",
	"汉斯",
	"托尔海姆",
	"弗里茨",
	"玛提斯",
	"比尔克",
	"艾诺德",
	"克努特",
	"阿德尔",
	"尼尔斯",
	"艾莫尔",
	"乌尔夫ert",
	"杰斯特",
	"托斯提格",
	"波特拉姆",
	"艾博尔奇特",
	"孔诺尔德",
	"巴拉德摩尔",
	"迪尔特玛",
	"登博特",
	"埃尔文",
	"卡斯帕尔",
	"埃诺恩",
	"艾德穆德",
	"库尼尔波特",
	"阿诺尔夫",
	"艾多德",
	"梅因诺夫",
	"奥斯卡尔",
	"吉塞尔赫尔",
	"雷马尔",
	"韦恩哈德",
	"文德尔",
	"伍尼尔",
	"维嘉拉德",
	"维尔埃博拉德",
	"比亚内",
	"亨瑞克",
	"卢瑟德",
	"阿历克",
	"休伯特",
	"厄恩斯特",
	"鲁道夫",
	"哈特伯特",
	"艾思格",
	"霍里克",
	"康拉德",
	"格哈德",
	"汉克",
	"圭多",
	"提尔",
	"杰洛特",
	"哈特维格",
	"托尔本",
	"吉斯贝特",
	"布鲁诺",
	"威格马",
	"特弗里德",
	"哈康",
	"高斯温",
	"冈特伯特",
	"埃克伯特",
	"罗杰",
	"格伯哈德",
	"拉尔夫",
	"伯弗里德",
	"冈特拉姆",
	"费迪南德",
	"莱昂哈德",
	"格拉赫",
	"海尔默",
	"古斯塔夫",
	"杰罗ld",
	"Gero",
	"格拉尔夫",
	"埃梅里希",
	"卡尔",
	"德克",
	"法尔克",
	"安塞尔姆",
	"迪特黑尔姆",
	"阿尔瓦",
	"布雷希特",
	"威廉",
	"希尔德",
	"埃里克",
	"提乌德鲍德",
	"哈瓦德",
	"Hakon",
	"沃尔夫冈",
	"埃尔林",
	"科里",
	"兰道夫",
	"罗洛",
	"莱夫",
	"拉尔斯",
	"托尔斯",
	"英格玛",
	"阿斯布约恩",
	"斯泰纳尔",
	"雷恩哈特",
	"巴尔杜尔",
	"奥拉夫",
	"埃吉尔",
	"马格努斯",
	"冈纳",
	"斯韦恩",
	"卡斯腾",
	"欧根",
	"安东",
	"托瓦尔",
	"伯恩哈德",
	"埃纳",
	"莱贝雷希特",
	"朗纳",
	"奥特玛",
	"奥特温",
	"巴隆",
	"埃伯罗德",
	"博特温",
	"奥斯瓦尔德",
	"拉贝",
	"雷蒙德",
	"狼",
	"埃伯哈德",
	"格里姆沃德",
	"雨果",
	"哈尔斯坦",
	"赫弗里奇",
	"哈里伯特",
	"巴尔杜",
	"瓦尔德马尔",
	"恩格尔伯特",
	"托比昂",
	"埃兰",
	"托克尔",
	"霍斯特",
	"托里斯蒙德",
	"托莱夫",
	"埃哈德",
	"Ulf",
	"奥托",
	"赫尔曼",
	"海因里希",
	"霍尔斯",
	"提尔蒙德",
	"阿尔弗盖尔",
	"索雷尔",
	"哈特穆特",
	"洛塔尔",
	"曼弗雷德",
	"赖因霍尔德",
	"艾尔弗雷德",
	"迪特里希",
	"鲁伯特",
	"海姆拉德",
	"西格马尔",
	"弗里索",
	"兰德里奇",
	"莱恩哈德",
	"西格蒙德",
	"莱因哈特",
	"库尔特",
	"博多",
	"沃尔马",
	"利布文",
	"迪特尔",
	"乌尔里希",
	"艾克",
	"瓦拉姆",
	"马尔特",
	"格里马尔德",
	"伯托德",
	"阿尔伯里希",
	"拉邦",
	"鲁莫尔德",
	"维托尔德",
	"沃尔克",
	"伏尔喀特",
	"贝尔托夫",
	"沃尔特",
	"奥尔蒙",
	"亨伯特",
	"阿德尔马",
	"Konrad",
	"赫尔诺特",
	"拉都夫",
	"卢多尔夫",
	"吉塞尔赫",
	"阿德尔伯特",
	"耶尔马",
	"赖纳",
	"布卡德",
	"温里奇",
	"尔德里克",
	"威尔弗里德",
	"罗伯特",
	"沃尔夫拉姆",
	"雷蒙德",
	"蒂尔曼",
	"诺尔曼",
	"卢德格尔",
	"阿尔文",
	"马克沃德",
	"马科尔夫",
	"哈代布兰",
	"罗德里克",
	"兰伯特",
	"迈因拉德"
];
gt.Const.Strings.CharacterNamesFemale <- [
	"英格丽",
	"赫尔加",
	"厄尔马",
	"阿德拉",
	"比伊特",
	"伯莎",
	"博格希尔",
	"布伦希尔德",
	"弗里达",
	"古德兰",
	"希尔达",
	"西格里德",
	"玛蒂尔达",
	"杰希尔德"
];
gt.Const.Strings.BarbarianNames <- [
	"斯穆德",
	"赫古尔德",
	"布劳姆",
	"格林纳",
	"哈里夫",
	"斯卡拉",
	"海勒",
	"古德尔",
	"阿斯贝克",
	"伊里德",
	"布朗德",
	"奥布伦",
	"乔马尔",
	"乔特尔",
	"乔特纳",
	"哈格",
	"埃里克",
	"哈夫古法",
	"瓦埃蒂尔",
	"弗鲁克",
	"洛基",
	"兰格瓦尔德",
	"赫尔海默",
	"布罗库尔",
	"洛克",
	"胡里克",
	"斯卡布兰德",
	"西格巴勒"
];
gt.Const.Strings.BarbarianTitles <- [
	"杀手",
	"毁灭者",
	"掠袭者",
	"掠夺者",
	"征服者",
	"the Slayer",
	"污染者",
	"剥皮者",
	"威胁者",
	"猎头者",
	"the Ravager",
	"碎颅者",
	"碎骨者",
	"屠宰者",
	"神选者",
	"战争者",
	"铁甲",
	"血污者",
	"野兽",
	"猛兽",
	"狼爪",
	"野蛮人",
	"血书",
	"破碎机",
	"永恒的"
];
gt.Const.Strings.SouthernNames <- [
	"杰米尔",
	"乌斯曼",
	"赛义德",
	"拉德万",
	"亚兹德",
	"萨希尔",
	"瓦希卜",
	"阿米拉",
	"阿斯拉姆",
	"阿提克",
	"萨丹",
	"艾曼",
	"哈坎",
	"哈法沙",
	"萨瓦尔",
	"舒亚布",
	"湖山",
	"汉顿",
	"阿顺",
	"贾比尔",
	"祖赫里",
	"吉弗利",
	"加利布",
	"塔米姆",
	"贾库巴",
	"扎瓦希尔",
	"舒雷德",
	"瓦利德",
	"穆萨",
	"乌巴德",
	"哈拉德",
	"塔里克",
	"瓦西",
	"法里斯",
	"阿巴尼",
	"穆塔",
	"Uthman",
	"Tamim",
	"塔维德",
	"扎希里",
	"米拉德",
	"努哈",
	"阿布达里",
	"朱奈德",
	"马利克",
	"纳赛尔",
	"贾哈夫",
	"亚齐尔",
	"塔哈",
	"萨布蒂",
	"哈伦",
	"菲里",
	"拉希德",
	"哈姆丁",
	"拉希尔",
	"哈扬",
	"阿斯卡里",
	"巴克德",
	"胡斯尼",
	"奥马尔"
];
gt.Const.Strings.SouthernNamesLast <- [
	"伊本萨赫",
	"阿尔达尼",
	"伊本·塔伊卜",
	"阿尔萨尔",
	"伊本哈扎姆",
	"伊本贾拉夫",
	"伊本阿巴德",
	"阿尔-塔希尔",
	"阿尔巴贾尼",
	"伊本努萨",
	"阿尔-法瑞斯",
	"阿尔瓦希里",
	"伊本努",
	"阿尔卡辛",
	"伊本侯赛因",
	"伊本卡迈勒",
	"阿尔-法德",
	"阿尔巴吉",
	"阿尔-阿班",
	"阿尔萨拉马",
	"阿尔哈达德",
	"阿尔阿凡",
	"阿尔巴克尔",
	"伊本塔苏夫",
	"阿尔-法拉第",
	"Ibn Tayib",
	"伊本阿齐德",
	"伊本瓦西",
	"阿尔-阿巴斯",
	"伊本哈姆迪",
	"阿尔巴赫里",
	"阿尔扎希尔",
	"伊本萨拉尔",
	"阿尔萨维德",
	"伊本哈姆丁",
	"伊本乌迪",
	"伊本阿西里",
	"阿尔塔巴尔",
	"阿尔艾伦迪",
	"阿尔西迪克",
	"伊本·萨卜提",
	"阿尔-法斯",
	"伊本曼苏尔",
	"阿尔萨巴格",
	"阿尔贝纳利",
	"阿尔阿齐兹",
	"伊本贾西布"
];
gt.Const.Strings.SouthernOfficerTitles <- [
	"阿尔贾兰",
	"阿尔塔拉曼基",
	"阿尔-穆迪尔",
	"阿尔贾苏尔伊本塔瓦德",
	"阿尔-贾塔米",
	"哈伦",
	"阿尔巴迪尔",
	"阿尔马尤里奇",
	"阿尔穆哈里卜",
	"阿尔塔拉布卢西伊本阿斯巴特",
	"阿尔塔苏芬伊本哈比卜",
	"伊本扎伊德",
	"伊本阿斯马利",
	"伊本易卜拉欣",
	"伊本苏哈利"
];
gt.Const.Strings.GladiatorTitles <- [
	"斗士",
	"竞技场之王",
	"无情的",
	"领头羊",
	"无与伦比的",
	"不败者",
	"残暴者",
	"弱者",
	"奴隶",
	"狮子",
	"鬣狗(the Hyena)",
	"胜利者",
	"志愿者",
	"屠夫",
	"冠军",
	"角斗士",
	"种马(the Stallion)",
	"the Beast",
	"奇迹",
	"狂怒的公牛",
	"雷鸣",
	"铁锤",
	"the Destroyer",
	"穿刺者"
];
gt.Const.Strings.NomadChampionTitles <- [
	"蝎子(the Scorpion)",
	"沙之幽灵",
	"大蛇(the Serpent)",
	"枯萎病",
	"银棍",
	"沙漠王子",
	"难以捉摸者(the Elusive)",
	"影子(the Shadow)",
	"抢掠者",
	"强盗",
	"游牧民(the Nomad) King",
	"沙贼",
	"商人的祸根",
	"沙漠老鼠",
	"黑牙",
	"蛇(the Snake)",
	"沙漠掠袭者(the Desert Raider)",
	"天灾",
	"被诅咒的人",
	"乌鸦(the Raven)",
	"the Nomad",
	"红十字",
	"镀金者之选",
	"沙蝰蛇",
	"朝圣者",
	"流放者(the Exiled)",
	"秃鹫(the Curious)",
	"海市蜃楼生活者",
	"自由王子",
	"沙滩王子",
	"尘埃舞者",
	"金秃鹫"
];
gt.Const.Strings.NomadChampionStandalone <- [
	"蝎子(The Scorpion)",
	"沙之幽灵",
	"大蛇(The Serpent)",
	"枯萎病",
	"银棍",
	"沙漠王子",
	"难以捉摸的",
	"影子",
	"抢掠者",
	"强盗",
	"游牧国王",
	"沙贼",
	"商人的祸根",
	"沙漠老鼠",
	"黑牙",
	"蛇(The Snake)",
	"沙漠掠袭者(The Desert Raider)",
	"天灾",
	"被诅咒的人",
	"乌鸦(The Raven)",
	"游牧民(The Nomad)",
	"红色",
	"流放者(the Exiled)",
	"秃鹫",
	"海市蜃楼生活者",
	"自由王子",
	"沙滩王子",
	"尘埃舞者",
	"金秃鹫"
];
gt.Const.Strings.DesertDevilChampionTitles <- [
	"The Scorpion",
	"The Ghost of the Sands",
	"毒蛇·%randomsouthernname%",
	"剑圣·%randomsouthernname%",
	"沙漠恶魔·%randomsouthernname%",
	"难以捉摸者%randomsouthernname%",
	"影子·%randomsouthernname%",
	"蛇·%randomsouthernname%",
	"旋风",
	"沙魔",
	"蝮蛇·%randomsouthernname%",
	"流放者%randomsouthernname%",
	"剑舞者·%randomsouthernname%",
	"%randomsouthernname% 斯威夫特",
	"不败的%randomsouthernname%",
	"尘舞者·%randomsouthernname%",
	"闪亮边缘·%randomsouthernname%",
	"深红边缘·%randomsouthernname%",
	"%randomsouthernname% 飞刀",
	"尘魔·%randomsouthernname%",
	"劲风",
	"黑鹰"
];
gt.Const.Strings.ExecutionerChampionTitles <- [
	"刽子手",
	"The Silver Mace",
	"The Plunderer",
	"The Traders\' Bane",
	"The Scourge",
	"The Cursed",
	"沙巨人",
	"镀金者被选中了",
	"山",
	"弯刀",
	"%randomsouthernname% 镀金者",
	"狂暴的游牧者",
	"不朽者%randomsouthernname%",
	"收头人",
	"巨人",
	"岩石(The Rock)",
	"沙尘暴",
	"碎头机",
	"伊夫利特",
	"%randomsouthernname% 狮子"
];
gt.Const.Strings.DesertStalkerChampionTitles <- [
	"the Scorpion",
	"沙潜者",
	"沙漠跟踪者",
	"老鹰",
	"the Raven",
	"鹰(the Hawk)",
	"死亡追踪者",
	"弓箭手大师",
	"猎人(the Hunter)",
	"the Headhunter",
	"the Sandviper",
	"光线",
	"镀金者之手",
	"鹰眼",
	"the Vulture",
	"the Serpent",
	"毒刺",
	"寻心者"
];
gt.Const.Strings.NobleTitles <- [
	"伯爵",
	"Count",
	"男爵",
	"Baron",
	"公爵"
];
gt.Const.Strings.VizierTitles <- [
	"战争维齐尔",
	"财政维齐尔",
	"贸易维齐尔",
	"大维齐尔",
	"主占星师",
	"大祭司"
];
gt.Const.Strings.SellswordTitles <- [
	"the Butcher",
	"狂战士",
	"狗(the Dog)",
	"猎犬",
	"血腥",
	"狼",
	"刀锋",
	"the Impaler",
	"年轻的",
	"年长者",
	"the Merciless",
	"the Red",
	"黑色的",
	"奥克班",
	"骑士杀手",
	"猎鹰"
];
gt.Const.Strings.SwordmasterTitles <- [
	"传奇",
	"大师",
	"击剑手",
	"快速",
	"快刀",
	"the Serpent",
	"the Swift",
	"刀锋舞者",
	"the Undefeated",
	"不败",
	"the Champion",
	"领域之主",
	"长老",
	"the Unmatched",
	"巧手",
	"the Flying Blade",
	"舞刀"
];
gt.Const.Strings.HedgeKnightTitles <- [
	"独狼",
	"狼",
	"猎犬",
	"钢铁侠",
	"杀手",
	"The Giant",
	"The Mountain",
	"污染者",
	"骑士杀手",
	"雇佣骑士",
	"The Scourge",
	"倒下的骑士",
	"压碎者",
	"The Exiled",
	"怒吼",
	"偷猎者",
	"砍刀"
];
gt.Const.Strings.MasterArcherNames <- [
	"%randomname% 神射手",
	"煞特",
	"%randomname% 射手大师",
	"猎人%randomname%",
	"%randomname% 狙击手",
	"百步穿杨",
	"%randomname% 快速射击",
	"%randomname% 猎头者",
	"死神眼",
	"%randomname%神枪手",
	"%randomname% 射手",
	"%randomname% 羽绘",
	"%randomname% 吹口哨的死神",
	"%randomname% 扑克",
	"老鹰",
	"%randomname% 真击",
	"%randomname% 真枪实弹"
];
gt.Const.Strings.OathbringerNames <- [
	"守誓者",
	"誓约使者·%randomname%",
	"安瑟姆的锤子",
	"安瑟姆之盾",
	"安瑟姆之剑",
	"安瑟姆的冒名顶替(Anselm\'s Stolen Valor)",
	"%randomname%  宣誓效忠",
	"%randomname% 十字军",
	"狂信者%randomname%",
	"%randomname% 虔诚的",
	"%randomname% 忠诚的",
	"%randomname% 圣骑士",
	"%randomname% 正义者"
];
gt.Const.Strings.MasonTitles <- [
	"建设者",
	"砌砖匠(Bricklayer)",
	"建筑师",
	"匠人"
];
gt.Const.Strings.MilitiaTitles <- [
	"征召兵",
	"民兵",
	"步兵"
];
gt.Const.Strings.BrawlerTitles <- [
	"汉堡",
	"搬运工",
	"岩石(the Rock)",
	"the Stallion",
	"铁颌(Ironjaw)",
	"打手"
];
gt.Const.Strings.PeddlerTitles <- [
	"the Snake",
	"黄鼠狼",
	"银舌",
	"小商贩",
	"小贩",
	"商人"
];
gt.Const.Strings.WitchhunterTitles <- [
	"夜猎者",
	"女巫猎人",
	"驱魔者",
	"折磨者"
];
gt.Const.Strings.GravediggerTitles <- [
	"掘墓人",
	"铲子",
	"格拉斯波特",
	"怪人(the Odd)"
];
gt.Const.Strings.RatcatcherTitles <- [
	"长鼻(Longnose)",
	"老鼠",
	"捕鼠者(the Ratcatcher)",
	"温热"
];
gt.Const.Strings.BastardTitles <- [
	"私生子",
	"错误",
	"绿帽子",
	"秘密之子",
	"妓女",
	"玷污之人"
];
gt.Const.Strings.PilgrimTitles <- [
	"信徒(the Believer)",
	"探索者",
	"屠杀",
	"纯净",
	"苦修者",
	"the Pilgrim"
];
gt.Const.Strings.KnightNames <- [
	"罗德里克爵士",
	"埃吉迪乌斯爵士",
	"亨利克爵士",
	"丹克沃特爵士",
	"艾森豪兹爵士",
	"杰弗拉姆爵士",
	"巴拉诺爵士",
	"威廉爵士",
	"希尔德布兰德爵士",
	"希尔玛爵士",
	"塞维林爵士",
	"斯塔克沃特爵士",
	"埃尔加斯特爵士",
	"马格纳斯爵士",
	"伯克哈德爵士",
	"西尔万爵士",
	"兰伯特爵士",
	"库诺爵士",
	"文策尔爵士",
	"多纳特爵士",
	"阿尔布雷希特爵士",
	"希尔德里奇爵士",
	"西格蒙德爵士",
	"斯坦哈特爵士",
	"赫尔曼爵士",
	"埃克哈特爵士",
	"吉多巴德爵士",
	"西奥爵士",
	"埃斯维格爵士",
	"瓦拉姆爵士",
	"卡西米尔爵士",
	"Sir Magnus",
	"怀特爵士",
	"奥托爵士",
	"西格蒙德爵士",
	"厄兰爵士",
	"埃尔肯布兰德爵士",
	"西奥德里奇爵士",
	"洛塔尔爵士",
	"沃尔夫哈特爵士",
	"巴伦爵士",
	"瓦尔德玛爵士",
	"吉塞尔赫尔爵士",
	"恩格尔伯特爵士",
	"兰塞尔爵士",
	"亨伯特爵士",
	"埃梅里希爵士",
	"格林爵士",
	"唐伯特爵士",
	"罗伯特爵士",
	"沃尔夫冈爵士",
	"提莫爵士",
	"康拉德爵士",
	"鲁伯特爵士",
	"哈拉尔德爵士",
	"罗兰爵士",
	"拉贝爵士",
	"齐格弗里德爵士",
	"库尼伯特爵士",
	"丹克拉德爵士",
	"莱贝雷希特爵士"
];
gt.Const.Strings.OrcWarlordNames <- [
	"伊尔斯卡古尔",
	"斯卡布斯卡",
	"乌罗斯",
	"库什特鲁姆",
	"哥特",
	"奥布罗克",
	"布洛克萨帕特",
	"哥拉什",
	"莫格图",
	"索克塔",
	"戈尔加什古尔",
	"马鲁克",
	"瓦拉克纳波拉什",
	"乌尔加特",
	"德加什",
	"斯卡尔克尔夫塔",
	"马尔加什波拉什",
	"博格什",
	"戈鲁克萨帕特",
	"卡洛什乌尔加特",
	"霍加斯古尔",
	"纳古克",
	"沙多克",
	"巴赫洛布",
	"科尔盖特",
	"乌鲁木克古尔",
	"纳达尔马克",
	"弗拉斯乌斯塔",
	"布鲁克佐格塔",
	"萨帕特布洛克",
	"摩西沙基",
	"加吉特布科尔",
	"印迹卡库克",
	"塔拉克塔伦",
	"德加喀山",
	"奥克斯哈克",
	"乌丹诺格",
	"特洛克奥博尔",
	"博尔瓦格",
	"肖特普",
	"沙特罗",
	"博鲁克斯卡格",
	"伊尔斯卡萨帕特",
	"格鲁扎尔图姆",
	"格罗姆克",
	"奥格鲁",
	"舒拉纳克"
];
gt.Const.Strings.BanditLeaderNames <- [
	"屠夫",
	"尖刀·%randomname%",
	"屠夫·%randomname%",
	"国王·%randomname%",
	"壮牛%randomname%",
	"The Wolf",
	"掳掠者·%randomname%",
	"%randomname%·蛇",
	"%randomname%·四指",
	"硫磺",
	"乌鸦",
	"黑乌鸦",
	"%randomtown% 的公牛",
	"%randomname%·血胡子",
	"蜂蜜酒罐·%randomname%",
	"血腥·%randomname%",
	"可怕的%randomname%",
	"猪人(the Swine)",
	"残忍的%randomname%",
	"流放者·%randomname%",
	"强盗 男爵",
	"红蝰蛇",
	"强盗·%randomname%",
	"天灾·%randomname%",
	"掠夺之王",
	"猎奴者(The Manhunter)",
	"大 %randomname%",
	"野蛮人·%randomname%",
	"臭名昭著的%randomname%",
	"%randomtown% 的威胁",
	"猩红的%randomname%",
	"咧嘴巩特尔",
	"%randomname%鬣狗",
	"%randomname% 鹰",
	"疯子·%randomname%",
	"蛮族·%randomname%",
	"掠夺者·%randomname%",
	"疯子拉尔斯",
	"自由·%randomname%",
	"黑眼睛艾因哈特",
	"奇怪的奥斯瓦尔奇",
	"疯狂的眼睛",
	"灰烬王子·%randomname%",
	"%randomtown% 的天灾",
	"荒凉·%randomname%",
	"刀锋英格拉姆",
	"扒手·%randomname%",
	"米克尔科珀哈特",
	"卡斯珀钱包",
	"水獭",
	"乔斯特皇冠继承人",
	"无齿的巴尔塔萨",
	"蜘蛛沃尔特",
	"八月掘墓人",
	"城市古德曼"
];
gt.Const.Strings.KrakenNames <- [
	"奥格-萨托斯大噬者(Ogg-Sattoth the Grand Devourer)",
	"卡阿斯鲁·毁灭者(Kha-Athlu the All-Ender)",
	"不朽者沙加鲁斯(Shaggaruth the Unending)",
	"无尽喉咙 (Gla-Oth the Endless Maw)",
	"古沼洛克·千臂打谷者(Gu-Shogg the Thousand-Armed Thresherg)",
	"万物元首·赫坦纳希提",
	"世界吞噬者夏舒塔尔(Xa-Shutar the Eater of Worlds)",
	"托霍乔斯·全能终结者(Thohochoth the All-Ender)",
	"纳克拉斯·永恒者(Naccorath the Eternal)",
	"太空浩克瑟鲁 (Xapocathlu the All-Reaching)"
];
gt.Const.Strings.AncientDeadNames <- [
	"布拉斯",
	"古德拉",
	"鸵鸟",
	"达达诺斯",
	"杜拉斯",
	"慕卡特拉",
	"科特拉斯",
	"阿扎鲁",
	"德卡洛斯",
	"阿卡马斯半岛",
	"卡瓦罗斯",
	"科摩西乌斯",
	"摩斯康",
	"菱形",
	"塔布斯",
	"阿普隆",
	"纳普康",
	"巴尔索比斯",
	"天狼星",
	"马尼斯",
	"布鲁斯",
	"泰勒福斯",
	"特雷布斯",
	"大马士革",
	"梅格鲁斯",
	"亚诺顿",
	"昔兰诺斯",
	"哈加农",
	"黑里托斯",
	"塞琉古斯",
	"提名",
	"巴克诺尔",
	"卡斯顿",
	"厄尔皮达斯",
	"亚里士德",
	"莫西姆斯",
	"雅典娜",
	"巴丘斯"
];
gt.Const.Strings.AncientDeadTitles <- [
	"归来",
	"恢复者",
	"古代",
	"the Destroyer",
	"监护人",
	"the Hunter",
	"第二个",
	"使者",
	"出土的",
	"被遗忘者",
	"保护者",
	"光荣",
	"防卫者",
	"·北方",
	"荣耀",
	"受宠者"
];
gt.Const.Strings.GoblinNames <- [
	"绿水",
	"格鲁布",
	"沙拉克斯",
	"祖古特",
	"格里斯尼克",
	"扎塔克",
	"芬克斯",
	"祖塔克尔",
	"维洛克",
	"扎托克斯",
	"纳克尼克斯",
	"韦伯",
	"陷阱",
	"拉托克斯",
	"斯克罗克",
	"乌鲁扎克",
	"德罗祖布",
	"佐格罗克",
	"库尔齐克",
	"沙托克斯",
	"维库兹",
	"卡拉",
	"德鲁克祖格",
	"塞戈克斯",
	"斯鲁兹",
	"德鲁特诺",
	"诺扎克",
	"雷克",
	"扎图什",
	"克莱克卢克斯"
];
gt.Const.Strings.GoblinTitles <- [
	"刺者",
	"潜伏者(the Insidious)",
	"喉刀",
	"刀匠",
	"剥皮者",
	"the Headhunter",
	"眼罩",
	"罗特古特",
	"Longnose",
	"切割器",
	"鼻涕虫",
	"贴纸",
	"the Elusive",
	"跟踪者",
	"暗影行者",
	"雾行者",
	"狡猾",
	"背刺者(the Backstabber)",
	"钩刃",
	"刺刀",
	"耳环人",
	"颈鲷",
	"刀杂耍者"
];
gt.Const.Strings.FallenHeroTitles <- [
	"腐朽",
	"尸魔",
	"腐烂的人",
	"被污秽的人",
	"the Returned",
	"不朽的人",
	"the Cursed",
	"腐败的",
	"坚不可摧",
	"誓言破坏者",
	"the Forgotten",
	"迷失者(the Lost)",
	"堕落的英雄",
	"残酷的",
	"the Returned",
	"堕落王子",
	"空谷幽魂",
	"幽灵",
	"没有灵魂的",
	"风缸"
];
gt.Const.Strings.NecromancerNames <- [
	"虫王",
	"不死者%randomname%",
	"%randomname% 黑色",
	"%randomname% 死灵法师",
	"木偶师",
	"瘟疫使者",
	"黑暗大师",
	"复活者",
	"%randomname% the Mad",
	"%randomname% 痴迷者",
	"苍白公爵",
	"亡灵之主",
	"%randomname% 叛教者",
	"%randomname% 知识渊博的人",
	"%randomname% 蠕虫",
	"%randomname% 邪恶的",
	"%randomname% the Mad",
	"%randomname% 先知"
];
