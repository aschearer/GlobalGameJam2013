package heartattacks.states 
{
	import heartattacks.Objects.Button;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class HelpState extends World
	{
		[Embed(source = "../../../res/sprites/HelpScreen.png")] private var HelpScreenImage:Class;
		[Embed(source = "../../../res/Buttons/start_normal.png")] private var HelpButtonImage:Class;
		
		private var buttonImage:Button;
		
		public function HelpState():void
		{
			this.addGraphic(new Image(HelpScreenImage));
			this.buttonImage = new Button(HelpButtonImage, 492, 465);
			this.buttonImage.x = 492;
			this.buttonImage.y = 465;
			this.buttonImage.Callback = this.OnClick;
			this.add(this.buttonImage);
			
			
		}
		
		private function OnClick():void 
		{
			FP.world = new PlayState();
		}
	}

}