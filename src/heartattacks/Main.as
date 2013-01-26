package heartattacks
{
	import flash.display.Sprite;
	import flash.events.Event;
	import heartattacks.states.PlayState;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	[SWF(width="800", height="600", backgroundColor="#000000")]
	public class Main extends FlxGame 
	{
		public function Main():void 
		{
			super(800, 600, PlayState);
			this.forceDebugger = true;
		}
	}
}