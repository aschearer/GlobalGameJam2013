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
		private var count:int;
		
		public function StateMachine(spritemap:Spritemap) 
		{
			this.spritemap = spritemap;
			this.states = new Dictionary();
			this.count = 0;
		}
		
		public function addState(name:String, state:IState):void
		{
			this.states[name] = state;
			this.count++;
			if (this.count == 1)
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
			this.states[this.currentState].update(this.spritemap);
		}
		
		private function enterState():void
		{
			this.states[this.currentState].onEnter(this.spritemap);
			this.states[this.currentState].setCallback(this.onStateFinished);
		}
		
		private function onStateFinished(nextState:String):void
		{
			this.currentState = nextState;
			this.enterState();
		}
	}

}