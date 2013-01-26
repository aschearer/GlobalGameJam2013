package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Sheet.png")] protected var PlayerImage:Class;
		
		private var spritemap:Spritemap;
		private var heading:Number;
		
		public function Player(x:Number, y:Number ) 
		{
			super(x, y);
			this.heading = 0;
			this.spritemap = new Spritemap(PlayerImage, 25, 29);
			this.spritemap.add("walk", [0, 1], 4, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk");
			this.setHitbox(25, 29);
		}
		
		override public function update():void
		{
			if (Input.mouseDown && Input.mouseX)
			{
				var deltaX:Number = Input.mouseX < this.x ? -1 : 1;
				this.heading += deltaX * Math.PI / 128;
			}
			
			this.moveBy(Math.sin(this.heading) * .8, Math.cos(this.heading) * -.8, "level");
		}
	}

}