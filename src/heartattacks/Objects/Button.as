package heartattacks.Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Button extends Entity
	{
		public function Button(image:Class, x:Number, y:Number) 
		{
			super(x, y);
			this.graphic = new Image(image);
			this.setHitboxTo(this.graphic);
		}
		
		public var Callback:Function;
		
		public override function update():void
		{
			if (Input.mouseDown && this.collidePoint(this.x, this.y, Input.mouseX, Input.mouseY))
			{
				Callback();
			}
		}
		
	}

}