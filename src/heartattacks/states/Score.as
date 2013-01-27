package heartattacks.states 
{
	import net.flashpunk.World;
	import net.flashpunk.*;
	import flash.events.Event;
	import heartattacks.doodads.HeartMeter;
	import heartattacks.doodads.Player;
	import heartattacks.doodads.Girl;
	import heartattacks.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Score extends Entity
	{
	    Text.size = 20;
		private static  var score:int = new int;
		private static var heartB:int = new int;
		public var ScoreText:Text = new Text("", 10, 5);	
		public var ScoreEntity:Entity = new Entity (10, 5, ScoreText);
		public var HeartText:Text = new Text("", 100, 5);	
		public var HeartEntity:Entity = new Entity (100, 5, HeartText);
		
		
		private var player:Player;
		
		public function Score(player) 
		{
           this.player = player;
			heartB = 0;
			player.CurrentScore += score;
			player.HeartRate += heartB;
			this.graphic = ScoreText;
		}
		
		override public function update():void
		{
			super.update();
			this.graphic.scrollY = 0;
			ScoreText.text = "Score: " + player.CurrentScore.toString();
			HeartText.text = "Heartbeat: " + heartB.toString();
			
		}
		
	}

}