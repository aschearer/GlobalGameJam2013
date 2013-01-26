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
		private var heading = 0;
		private var speed = 0.4;
		
		public function Player(x:Number, y:Number ) 
		{
			super(x, y);
			this.loadGraphic(playerImage, true, true, 25, 29, true);
			
			addAnimation("walk", [0, 1, 0], 8, false );
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			play("walk");
			
			
			 this.x += Math.sin(heading) * speed ;
			 this.y -= Math.cos(heading) * speed ; 
			
		if (FlxG.mouse.pressed())
		{
			
		  if (FlxG.mouse.screenX <= this.x )
		  { 
			  this.heading -= Math.PI / 128;
			  
			  }
			  
		  if (FlxG.mouse.screenX >= this.x)
		  {
			  this.heading += Math.PI / 128;
			 
			  }
	    }
          
		}
		
	}

}