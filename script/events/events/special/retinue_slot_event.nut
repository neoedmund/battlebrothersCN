this.retinue_slot_event <- this.inherit("scripts/events/event", {
	m = {
		LastSlotsUnlocked = 0
	},
	function create()
	{
		this.m.ID = "event.retinue_slot";
		this.m.Title = "在途中……";
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_26.png[/img]{%companyname% 的威信和名望不断提高。 无论你去哪里，人们都渴望着加入你们－不仅仅是佣兵，也有其他用途的追随者！ | 随着佣兵们在每一场战役中的战斗，战团的名望都在不断提高。 因为名声的提高，更多人，不仅仅是佣兵，期待加入 %companyname%。也许该是战团该招下一个追随者的时候了？ | %companyname% 需要的下属不仅仅是战士－看来随着战团名望和威信的增长，会有其他人愿意搭顺风车。 也许这些跟随者对战团有很大的用处，即使它们在战场上没有贡献。}",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "去看看我们的随行人员吧！",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Desert)
		{
			return;
		}

		local unlocked = this.World.Retinue.getNumberOfUnlockedSlots();

		if (unlocked > this.m.LastSlotsUnlocked && this.World.Retinue.getNumberOfCurrentFollowers() < unlocked)
		{
			this.m.Score = 400;
		}
	}

	function onPrepare()
	{
		this.m.LastSlotsUnlocked = this.World.Retinue.getNumberOfUnlockedSlots();
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

	function onSerialize( _out )
	{
		this.event.onSerialize(_out);
		_out.writeU8(this.m.LastSlotsUnlocked);
	}

	function onDeserialize( _in )
	{
		this.event.onDeserialize(_in);
		this.m.LastSlotsUnlocked = _in.readU8();
	}

});

