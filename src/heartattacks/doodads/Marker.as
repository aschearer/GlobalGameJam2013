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
			super(x - 12 + this.random(-4, 4), y + FP.camera.y - 12 + this.random(-4, 4));
			this.setHitbox(24, 24);
			this.layer = 2;
			this.type = "marker";
			var image:Image = new Image(MarkerImage);
			image.angle = this.random(0, 2 * Math.PI);
			//image.alpha = this.random(0.1, 1);
			this.graphic = image;
		}
		
		private function random(min:int, max:int):int
		{
			var delta:int = max - min;
			return Math.random() * delta + min;
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