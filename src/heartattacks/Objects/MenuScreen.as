package heartattacks.Objects 
{
    import net.flashpunk.FP;
    import flash.geom.Rectangle;
	import heartattacks.states.MenuState;
	import heartattacks.states.PlayState;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class MenuScreen extends Entity
	{
		[Embed(source = "../../../res/Buttons/start_normal.png")] protected var DownImage:Class;
		[Embed(source = "../../../res/Buttons/start_down.png")] protected var UpImage:Class;
		private var upImage:Image;
		private var downImage:Image;
		
		public function MenuScreen(x:Number,y:Number) 
		{
			super(x, y);
			this.upImage = new Image(UpImage);		
			this.setHitbox(223, 73);
		   
			
			this.downImage = new Image(DownImage);
			this.setHitbox(223, 73);
			this.graphic = this.upImage;
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
					this.UpImage = this.DownImage;
					FP.world = new PlayState();
				}
				
			}
		}
		
	}

}