package heartattacks.doodads 
{
	import org.flixel.*;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	 
	public class Player extends FlxSprite
	{
		[Embed(source = "../../../res/spritesheets/Sheet.png")] protected var playerImage:Class;
		
		
		public function Player(x:Number, y:Number ) 
		{
			super(x, y);
			this.loadGraphic(playerImage, true, true, 25, 29, true);
			
			addAnimation("walk", [0, 1, 0], 8, false );
			
		}
		
		override public function update():void
		{
			this.y -= 0.9;
			play("walk");
			

				
			if (FlxG.keys.D || FlxG.keys.RIGHT)
			{
				this.x += 0.9
				play("walk");
			}
			
			if (FlxG.keys.A || FlxG.keys.LEFT)
			{
				this.x -= 0.9
				play("walk");
			}
          
		}
		
	}

}