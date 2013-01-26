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
	public class Girl extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Cat.png")] protected var girlImage:Class;
		private var spritemap:Spritemap;
		public function Girl(x:Number, y:Number) 
		{
			super(x, y);
			//this.heading = 0;
			this.spritemap = new Spritemap(girlImage, 25, 25);
			this.spritemap.add("walk", [0, 1], 4, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk");
			this.setHitbox(25, 25);
			this.layer = 2;
			
		}
		
		override public function update():void 
		{
			
			super.update();
			this.moveBy(0, -0.3, "level" );
			
		}
	}

}