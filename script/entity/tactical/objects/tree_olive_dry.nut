this.tree_olive_dry <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "死树(Dead Tree)";
	}

	function getDescription()
	{
		return "这棵枯树已经死了很久了。阻挡移动和视线。";
	}

	function onInit()
	{
		local v = this.Math.rand(1, 2);
		local flip = this.Math.rand(0, 1) == 1;
		local bottom = this.addSprite("bottom");
		bottom.setBrush("steppe_tree_0" + v + "_bottom");
		bottom.setHorizontalFlipping(flip);
		bottom.varyColor(0.03, 0.03, 0.03);
		bottom.Scale = 0.7 + this.Math.rand(0, 30) / 100.0;
		local middle = this.addSprite("middle");
		middle.setBrush("steppe_tree_0" + v + "_middle");
		middle.setHorizontalFlipping(flip);
		middle.Color = bottom.Color;
		middle.Scale = bottom.Scale;
		this.setSpriteOcclusion("bottom", 1, -1, -2);
		this.setSpriteOcclusion("middle", 2, 2, -3);
		this.setBlockSight(true);
	}

});

