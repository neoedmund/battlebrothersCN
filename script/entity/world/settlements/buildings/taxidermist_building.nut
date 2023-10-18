this.taxidermist_building <- this.inherit("scripts/entity/world/settlements/buildings/building", {
	m = {},
	function create()
	{
		this.building.create();
		this.m.ID = "building.taxidermist";
		this.m.Name = "剥制屋";
		this.m.Description = "一个剥制师可以从你得到的各种战利品中创造有用的物品。";
		this.m.UIImage = "ui/settlements/building_13";
		this.m.UIImageNight = "ui/settlements/building_13_night";
		this.m.Tooltip = "world-town-screen.main-dialog-module.Taxidermist";
		this.m.TooltipIcon = "ui/icons/buildings/taxidermist.png";
		this.m.Sounds = [
			{
				File = "ambience/buildings/taxidermist_boiling_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_boiling_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_cooking_pot_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_cooking_pot_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_crafting_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_crafting_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_crafting_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_crafting_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_crafting_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_hammering_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_hammering_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_sawing_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/taxidermist_sawing_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [];
	}

	function onUpdateDraftList( _list )
	{
		_list.push("anatomist_background");
	}

	function onClicked( _townScreen )
	{
		_townScreen.showTaxidermistDialog();
		this.pushUIMenuStack();
	}

	function onSettlementEntered()
	{
	}

	function onSerialize( _out )
	{
		this.building.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.building.onDeserialize(_in);
	}

});

