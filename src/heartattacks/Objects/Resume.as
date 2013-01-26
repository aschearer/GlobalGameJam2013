package heartattacks.Objects 
{
    import heartattacks.Objects.CreditsButton;
	import heartattacks.Objects.MenuScreen;
	import heartattacks.states.MenuState;
	import net.flashpunk.World;
    import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Resume extends Entity
	{
		[Embed(source = "../../../res/Buttons/restart_normal.png")] protected var reUpImage:Class;
		[Embed(source = "../../../res/Buttons/restart_down.png")] protected var reDownImage:Class;
		private var upResume:Image;
		private var downResume:Image;
		
		public function Resume(x:Number, y:Number)
		{
			super(x, y);
			this.upResume = new Image(reUpImage);
			this.setHitbox(223, 73);
			this.downResume = new Image(reDownImage);
			this.setHitbox(223, 73);
			this.graphic = this.upResume;
			
			
			}
		
			override public function render():void
		{
			super.render();
		}
		
		override public function update():void
		{
		
			if ( this.collidePoint(this.x, this.y, Input.mouseX, Input.mouseY))
			{
				if (Input.mousePressed)
				{
					this.reUpImage = this.reDownImage;
					FP.world = new MenuState();
				}
				
			}
	}

  }
}