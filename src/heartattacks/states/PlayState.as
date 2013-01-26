package heartattacks.states 
{
	import heartattacks.doodads.Player;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class PlayState extends FlxState
	{


		override public function create():void
		{
			this.add(new FlxText(100, 100, 100, "Hello World!"));
		    this.add(new Player(300, 400));
		}
	}
}