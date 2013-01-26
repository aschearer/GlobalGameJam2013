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
	public class Twitter extends Entity
	{ 
		[Embed(source = "../../../res/Buttons/twitter_normal.png")] protected var twitUpImage:Class;
		[Embed(source = "../../../res/Buttons/twitter_down.png")] protected var twitdownImage:Class;
		private var tUpImage:Image;
		private var tDownImage:Image;
		
		public function Twitter(x:Number, y:Number) 
		{
			super(x, y);
			this.tUpImage = new Image(twitUpImage);
			this.setHitbox(94, 77);
			this.tDownImage = new Image(twitdownImage);
			this.setHitbox(94, 77)
			this.graphic = this.tUpImage;
				
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
					this.tUpImage= this.tDownImage;
				    openURL("http://www.twitter.com","");
				}
				
			}
		}
		
		      public function openURL(url:String, target:String=null)
             {
	                navigateToURL(new URLRequest(url), target);
             }
		
		
	}

}