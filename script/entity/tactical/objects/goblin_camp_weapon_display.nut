this.goblin_camp_weapon_display <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "武器陈列";
	}

	function getDescription()
	{
		return "几杆长柄被展示出来，用来表明领地或警告入侵者。";
	}

	function onInit()
	{
		local variants = [
			"06",
			"08"
		];
		local v = variants[this.Math.rand(0, variants.len() - 1)];
		local flip = this.Math.rand(0, 1) == 1;
		local bottom = this.addSprite("bottom");
		bottom.setBrush("goblins_" + v + "_bottom");
		bottom.setHorizontalFlipping(flip);
		local top = this.addSprite("top");
		top.setBrush("goblins_" + v + "_top");
		top.setHorizontalFlipping(flip);
		this.setSpriteOcclusion("top", 1, 2, -3);
		this.setBlockSight(false);
	}

});

