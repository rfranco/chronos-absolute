package chronos.absolute.core
{
	public class Enum
	{
		private var _name:String;

		private var _value:int;

		public function Enum(name:String, value:int)
		{
			_name = name;
			_value = value;
		}

		public final function get name():String
		{
			return _name;
		}

		public final function get value():int
		{
			return _value;
		}
	}
}
