package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Girl extends Entity
	{
		public var TrailLength:Number = 600;
		public var TrailWidth:Number;
		public var MovementSpeed:Number = 0.6;
		
		[Embed(source = "../../../res/spritesheets/Girl.png")] protected var GirlImage:Class;
		private var spritemap:Spritemap;
		
		public function Girl() 
		{
			super(0, 0);
			this.spritemap = new Spritemap(GirlImage, 64, 128);
			this.spritemap.add("walk-forward", [1, 2, 3, 4, 5, 6], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(64, 128);
			this.layer = 2;
			
			this.TrailWidth = this.width;
		}
		
		override public function render():void
		{
			super.render();
			var center:Number = this.x + (this.width - this.TrailWidth) / 2;
			Draw.rect(center, this.y + FP.camera.y, this.TrailWidth, -this.TrailLength, 0xFFFFFF, 0.2);
		}
	}

}