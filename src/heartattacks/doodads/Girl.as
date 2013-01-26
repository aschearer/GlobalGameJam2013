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
		
		[Embed(source = "../../../res/spritesheets/Girl.png")] protected var GirlImage:Class;
		private var spritemap:Spritemap;
		
		public function Girl(x:Number, y:Number) 
		{
			super(x, y);
			this.spritemap = new Spritemap(GirlImage, 64, 128);
			this.spritemap.add("walk-forward", [1, 2, 3, 4, 5, 6], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(128, 64);
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