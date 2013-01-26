package heartattacks.Objects 
{
	import com.greensock.loading.data.ImageLoaderVars;
	import flash.geom.Rectangle;
	import heartattacks.states.MenuState;
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
	public class CreditScreen extends Entity
	{ 
		[Embed(source = "../../../res/Buttons/credit_screen.png")] protected var credImage:Class;
		private var screen:Image;
		
		public function CreditScreen(x:Number, y:Number) 
		{
			super(x, y);
			this.screen = new Image(credImage)
			this.graphic = this.screen;
		}
		
			
		override public function render():void
		{
			super.render();
		}
		
	}

}