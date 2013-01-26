package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Girl extends Entity
	{
		public var TrailLength:Number = 200;
		public var TrailWidth:Number;
		public var MovementSpeed:Number = 0.6;
		
		[Embed(source = "../../../res/spritesheets/Cat.png")] protected var girlImage:Class;
		private var spritemap:Spritemap;
		
		public function Girl(x:Number, y:Number) 
		{
			super(x, y);
			this.spritemap = new Spritemap(girlImage, 25, 25);
			this.spritemap.add("walk", [0, 1], 4, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk");
			this.setHitbox(25, 25);
			this.layer = 2;
			
			this.TrailWidth = this.width;
		}
		
		override public function render():void
		{
			super.render();
			var center:Number = this.x + (this.width - this.TrailWidth) / 2;
			Draw.rect(center, this.y, this.TrailWidth, -this.TrailLength, 0xFFFFFF, 0.2);
		}
		
		override public function update():void 
		{
			super.update();
			this.moveBy(0, this.MovementSpeed, "level" );
			
		}
	}

}