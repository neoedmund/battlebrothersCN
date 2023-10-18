this.terrifying_nightmares_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.terrifying_nightmares";
		this.m.Name = "可怕的噩梦";
		this.m.Description = "这个定居点的居民受到噩梦的恐吓。为了安全起见，许多人宁愿整夜保持清醒。";
		this.m.Icon = "ui/settlement_status/settlement_effect_25.png";
		this.m.Rumors = [
			"前几天我经过 %settlement%。那里有点不对劲。苍白的脸，疲惫的眼睛和蹒跚的行走。就像他们一个星期没睡觉一样！",
			"我刚收到我在 %settlement% 的姑姑的一封信，信中说整个城市都在做可怕的噩梦。我不知道，她总是小题大做。",
			"晚上睡个好觉的最好方法是努力工作和一品脱啤酒！我想起来了，应该有人告诉 %settlement% 那边的人们；据我所知，全镇人都睡不着觉。"
		];
	}

	function getAddedString( _s )
	{
		return _s + "遭受" + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + "不再遭受" + this.m.Name;
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RecruitsMult *= 0.75;
	}

});

