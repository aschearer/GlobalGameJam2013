package heartattacks.states
{
	import heartattacks.Objects.MenuScreen;
	import heartattacks.doodads.Music;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;

	public class IntroState extends World
	{
		[Embed(source = "../../../res/sprites/IntroScreen.png")] private var IntroImage:Class;
		
		private var image:Image;
		private var timer:Number = 0;
		
		public function IntroState()
		{
			this.image = new Image(IntroImage);
			this.image.y = 50;
			this.addGraphic(this.image);
		}
		
		public override function begin():void
		{
			Music.letter.play(1);
		}
		
		public override function update():void
		{
			if (Input.mouseDown)
			{
				FP.world = new MenuState();
			}
			
			if (this.image.y > -800)
			{
				this.image.y -= 0.25;
			}
			else
			{
				this.timer += 1 / 60;
				if (this.timer > 1)
				{
					FP.world = new MenuState();					
				}
			}
		}
	}
}