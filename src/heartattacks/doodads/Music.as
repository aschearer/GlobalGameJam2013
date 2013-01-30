package heartattacks.doodads 
{
	import flash.geom.Rectangle;
	import heartattacks.states.CreditWorld;
	import heartattacks.states.MenuState;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Music extends Entity
	{
		[Embed(source = "../../../res/Music/game_explosion.mp3")] protected static const EXPLOSION:Class;
		[Embed(source = "../../../res/Music/game_footstep.mp3")] protected static const WALKING:Class;
		[Embed(source = "../../../res/Music/game_girl_hate.mp3")] protected static const GHATE:Class;
		[Embed(source = "../../../res/Music/game_girl_like.mp3")] protected static const GLIKE:Class;
		[Embed(source = "../../../res/Music/game_heartBeat.mp3")] protected static const HEART:Class;
		[Embed(source = "../../../res/Music/game_indicator.mp3")] protected static const INDICATOR:Class;
		[Embed(source = "../../../res/Music/game_pickup.mp3")] protected static const PICKUP:Class;
		[Embed(source = "../../../res/Music/menu_click.mp3")] protected static const CLICK:Class;
		[Embed(source = "../../../res/Music/song_gameOver.mp3")] protected static const GAMEOVER:Class;
		[Embed(source = "../../../res/Music/menu_startGame.mp3")] protected static const START:Class;
		[Embed(source = "../../../res/Music/music_ending.mp3")] protected static const END:Class;
		[Embed(source = "../../../res/Music/music_gameplay.mp3")] protected static const GAMEPLAY:Class;
		[Embed(source = "../../../res/Music/music_intro.mp3")] protected static const INTRO:Class;
		[Embed(source = "../../../res/Music/music_lobby.mp3")] protected static const LOBBY:Class;
		[Embed(source = "../../../res/Music/intro_letter.mp3")] protected static const LETTER:Class;
		
		
		public static var explosion:Sfx = new Sfx(EXPLOSION);
		public static var walking:Sfx = new Sfx(WALKING);
		public static var girlhate:Sfx = new Sfx(GHATE);
		public static var girllike:Sfx = new Sfx(GLIKE);
		public static var heartbeat:Sfx = new Sfx(HEART);
		public static var indicator:Sfx = new Sfx(INDICATOR);
		public static var pickup:Sfx = new Sfx(PICKUP);
		public static var click:Sfx = new Sfx(CLICK);
		public static var gameover:Sfx = new Sfx(GAMEOVER);
		public static var startgame:Sfx = new Sfx(START);
		public static var ending:Sfx = new Sfx(END);
		public static var gameplay:Sfx = new Sfx(GAMEPLAY);
		public static var intro:Sfx = new Sfx(INTRO);
		public static var lobby:Sfx = new Sfx(LOBBY);
		public static var letter:Sfx = new Sfx(LETTER);
			
		public function Music() 
		{
			
		}
		
	}

}