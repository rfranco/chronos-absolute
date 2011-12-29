package chronos.absolute.logging
{
	public final class Log
	{
		private var _loggerName:String;

		private var _level:LogLevel;

		private var _message:String;

		private var _params:Array;

		private var _time:Date;

		public function Log(loggerName:String, level:LogLevel, message:String, params:Array)
		{
			_loggerName = loggerName;
			_level = level;
			_message = message;
			_params = params;
			_time = new Date();
		}

		public function dispatch():void
		{
			LogContext.instance.dispatchLog(this);
		}

		public function get loggerName():String
		{
			return _loggerName;
		}

		public function get level():LogLevel
		{
			return _level;
		}

		public function get message():String
		{
			return _message;
		}

		public function get params():Array
		{
			return _params;
		}

		public function get time():Date
		{
			return _time;
		}

		public function toString():String
		{
			return "[Log loggerName=" + loggerName + " level=" + level.name + " message=" + message + " ]";
		}
	}
}
