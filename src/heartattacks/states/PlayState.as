package heartattacks.states 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class PlayState extends FlxState
	{
		[Embed(source="../../../res/tilesets/Tiles.png")] private var ImgTiles:Class;

		override public function create():void
		{
			this.add(new FlxText(100, 100, 100, "Hello World!"));
			this.add(new FlxSprite(0, 0, ImgTiles));
		}
	}
}