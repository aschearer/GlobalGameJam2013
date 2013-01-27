package heartattacks.doodads 
{
	import com.greensock.TweenLite;
	import flash.utils.Dictionary;
	import heartattacks.doodads.states.NervousState;
	import heartattacks.doodads.states.StartledState;
	import heartattacks.doodads.states.WalkingState;
	import heartattacks.doodads.states.AngryState;
	import heartattacks.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Girl extends Entity
	{
		public var percentageToBoy:Number;
		
		[Embed(source = "../../../res/spritesheets/Girl.png")] protected var GirlImage:Class;
		private var spritemap:Spritemap;
		
		private var timeToLetDownGaurd:Number = 0;
		private var level:Level;
		private var states:Dictionary;
		private var currentState:String;
		
		public function Girl(level:Level) 
		{
			super(0, 0);
			this.level = level;
			this.spritemap = new Spritemap(GirlImage, 64, 128);
			this.spritemap.add("walk-forward", [1, 2, 3, 4, 5, 6], 12, true);
			this.spritemap.add("notice-forward", [8, 9, 10, 11, 12, 13], 12, true);
			this.spritemap.add("startled-backward", [15, 16, 17, 18], 12, true);
			this.spritemap.add("notice-backward", [20, 21, 22, 23], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(64, 128);
			this.layer = 2;
			this.percentageToBoy = 0;
			this.states = new Dictionary();
			this.states["walking-state"] = new WalkingState(this, level);
			this.states["nervous-state"] = new NervousState(this);
			this.states["startled-state"] = new StartledState(this);
			this.states["angry-state"] = new AngryState();
			this.currentState = "walking-state";
			this.enterState();
		}
		
		public override function render():void
		{
			super.render();
			Draw.circle(this.centerX, this.centerY + FP.camera.y, 200);
		}
		
		public function get isWaiting():Boolean
		{
			return this.currentState == "angry-state" ||
					this.currentState == "startled-state";
		}
		
		override public function update():void
		{
			this.states[this.currentState].update();
		}
		
		private function enterState():void
		{
			this.states[this.currentState].onEnter();
			this.spritemap.play(this.states[this.currentState].animationName);
			this.states[this.currentState].setCallback(this.onStateFinished);
		}
		
		private function onStateFinished(nextState:String):void
		{
			this.currentState = nextState;
			this.enterState();
		}
	}
}