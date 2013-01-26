package heartattacks.Objects 
{
	import flash.geom.Rectangle;
	import heartattacks.states.CreditWorld;
	import heartattacks.states.MenuState;
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
	public class CreditsButton extends Entity
	{ 
		[Embed(source = "../../../res/Buttons/credits_normal.png")] protected var credUpImage:Class;
		[Embed(source = "../../../res/Buttons/credits_down.png")] protected var credDownImage:Class;
		private var creditsUpImage:Image;
		private var creditsDownImage:Image;
		
		public function CreditsButton(x:Number, y:Number) 
		{
			super(x, y);
			this.creditsUpImage = new Image(credUpImage);
			this.setHitbox(223, 73);
			
			this.creditsDownImage = new Image(credDownImage);
			this.setHitbox(223, 73);
			this.graphic = this.creditsUpImage;
			
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
					this.creditsUpImage = this.creditsDownImage;
				    FP.world = new CreditWorld();
				}
				
			}
		}
		
	}

}