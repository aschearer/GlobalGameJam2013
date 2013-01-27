package heartattacks.doodads.states 
{
	import flash.utils.Dictionary;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class StateMachine 
	{
		private var states:Dictionary;
		private var currentState:String;
		private var spritemap:Spritemap;
		
		public function StateMachine(spritemap:Spritemap) 
		{
			this.spritemap = spritemap;
			this.states = new Dictionary();
		}
		
		public function addState(name:String, state:IState):void
		{
			this.states[name] = state;
			if (this.states.count == 1)
			{
				this.currentState = name;
				this.enterState();
			}
		}
		
		public function get state():String
		{
			return this.currentState;
		}
		
		public function update():void
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