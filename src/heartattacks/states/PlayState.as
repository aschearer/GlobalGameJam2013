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
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	
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
		
		private var player:Player;
		private var level:FlxTilemap;
		
		override public function create():void
		{
			this.add(new FlxText(100, 100, 100, "Hello World!"));
			this.player = new Player(300, 400);
		    this.add(this.player);

			this.level = new FlxTilemap();
			this.level.loadMap(new Map(), MapImage, 50, 50);
			this.add(this.level);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(this.level, this.player);
		}
	}
}