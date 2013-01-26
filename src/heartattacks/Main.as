package heartattacks
{
	import flash.display.Sprite;
	import flash.events.Event;
	import heartattacks.states.PlayState;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	[SWF(width="800", height="600", backgroundColor="#000000")]
	public class Main extends Engine
	{
		public function Main():void 
		{
			super(800, 600, 60, false);
			FP.world = new PlayState();
			
			FP.console.enable();
			FP.console.toggleKey = Key.F1;
		}
	}
}