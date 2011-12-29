package chronos.absolute.logging
{
	import chronos.absolute.util.StringUtil;
	import chronos.absolute.error.Assert;

	public final class Logger
	{
		private var _name:String;

		private var _level:LogLevel;

		public function Logger(name:String, level:LogLevel)
		{
			_name = name;
			_level = level;
		}

		public function fatal(message:String, ...params):void
		{
			if (LogLevel.FATAL.value >= _level.value)
			{
				log(LogLevel.FATAL, message, params);
			}
		}

		public function error(message:String, ...params):void
		{
			if (LogLevel.ERROR.value >= _level.value)
			{
				log(LogLevel.ERROR, message, params);
			}
		}

		public function warn(message:String, ...params):void
		{
			if (LogLevel.WARN.value >= _level.value)
			{
				log(LogLevel.WARN, message, params);
			}
		}

		public function info(message:String, ...params):void
		{
			if (LogLevel.INFO.value >= _level.value)
			{
				log(LogLevel.INFO, message, params);
			}
		}

		public function debug(message:String, ...params):void
		{
			if (LogLevel.DEBUG.value >= _level.value)
			{
				log(LogLevel.DEBUG, message, params);
			}
		}

		public function trace(message:String, ...params):void
		{
			if (LogLevel.TRACE.value >= _level.value)
			{
				log(LogLevel.TRACE, message, params);
			}
		}

		private function log(level:LogLevel, message:String, params:Array):void
		{
			var log:Log = new Log(_name, level, message, params);
			log.dispatch();
		}

		public function get name():String
		{
			return _name;
		}

		public function get level():LogLevel
		{
			return _level;
		}

		public function set level(level:LogLevel):void
		{
			Assert.notNull(level, "'level' must not null");
			_level = level;
		}

		public function toString():String
		{
			return "[Logger name=" + _name + " level=" + _level + " ]";
		}
	}
}