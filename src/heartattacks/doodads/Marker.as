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
		private var timer:Number = 0;
		
		public function Marker(x:int, y:int) 
		{
			super(x - 32, y + FP.camera.y - 32);
			this.setHitbox(16, 16);
			this.layer = 2;
			this.type = "marker";
		}
		
		public override function update():void
		{
			this.timer += 1 / 60;
			if (this.timer > 3)
			{
				FP.world.remove(this);
			}
		}
	}
}