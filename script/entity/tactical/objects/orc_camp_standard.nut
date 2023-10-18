this.orc_camp_standard <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "兽人旗帜";
	}

	function getDescription()
	{
		return "一个明示营地主人的旗子。";
	}

	function onInit()
	{
		local variants = [
			"14"
		];
		local v = variants[this.Math.rand(0, variants.len() - 1)];
		local flip = this.Math.rand(0, 1) == 1;
		local bottom = this.addSprite("bottom");
		bottom.setBrush("orcs_" + v + "_bottom");
		bottom.setHorizontalFlipping(flip);
		local top = this.addSprite("top");
		top.setBrush("orcs_" + v + "_top");
		top.setHorizontalFlipping(flip);
		this.setSpriteOcclusion("top", 1, 2, -3);
		this.setBlockSight(false);
	}

});

