package heartattacks.states 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import heartattacks.doodads.Player;
	import net.pixelpracht.tmx.TmxMap;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class PlayState extends FlxState
	{
		[Embed(source = "../../../res/tilesets/Tiles.png")]
		private var MapImage:Class;
		
		[Embed(source = "../../../res/tilemaps/Map.txt", mimeType = "application/octet-stream")]
		private var Map:Class;
		
		override public function create():void
		{
			this.add(new FlxText(100, 100, 100, "Hello World!"));
		    this.add(new Player(300, 400));

			var map:FlxTilemap = new FlxTilemap();
			map.loadMap(new Map(), MapImage, 50, 50);
			this.add(map);
		}
	}
}