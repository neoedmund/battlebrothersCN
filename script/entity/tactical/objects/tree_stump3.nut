this.tree_stump3 <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "树桩(Tree Stump)";
	}

	function getDescription()
	{
		return "被砍倒的树的残留物。";
	}

	function onInit()
	{
		local body = this.addSprite("body");
		body.setBrush("snow_forest_treetrunk_02");
		body.setHorizontalFlipping(this.Math.rand(0, 100) < 50);
		body.Scale = 0.4 + this.Math.rand(0, 30) / 100.0;
		body.Rotation = this.Math.rand(-5, 5);
	}

});

