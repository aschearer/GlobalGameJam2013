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
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class FaceBook extends Entity
	{ 
		[Embed(source = "../../../res/Buttons/facebook_normal.png")] protected var faceUpImage:Class;
		[Embed(source = "../../../res/Buttons/facebook_down.png")] protected var facedownImage:Class;
		private var fUpImage:Image;
		private var fDownImage:Image;
		
		public function FaceBook(x:Number, y:Number) 
		{
			super(x, y);
			this.fUpImage = new Image(faceUpImage);
			this.setHitbox(94, 77);
			this.fDownImage = new Image(facedownImage);
			this.setHitbox(94, 77)
			this.graphic = this.fUpImage;
				
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
					this.fUpImage= this.fDownImage;
				    openURL("https://www.facebook.com/pages/The-Heart-attacks/207940402680744","");
				}
				
			}
		}
		
		      public function openURL(url:String, target:String=null)
             {
	                navigateToURL(new URLRequest(url), target);
             }
		
		
	}

}