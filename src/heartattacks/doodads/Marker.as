package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Marker extends Entity
	{
		[Embed(source = "../../../res/sprites/Marker.png")] protected var MarkerImage:Class;
		private var spritemap:Image;
		
		private var timer:Number = 0;
		
		public function Marker(x:int, y:int) 
		{
			super(x - 8, y + FP.camera.y - 8);
			this.setHitbox(16, 16);
			this.layer = 2;
			this.type = "marker";
			var image:Image = new Image(MarkerImage);
			image.alpha = 0.5;
			this.graphic = image;
		}
		
		public override function update():void
		{
			this.timer += 1 / 60;
			if (this.timer > 10)
			{
				FP.world.remove(this);
			}
		}
	}
}