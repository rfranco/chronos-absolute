package chronos.absolute.logging.formatter
{
	import chronos.absolute.logging.Log;

	public class SimpleLogFormatter implements ILogFormatter
	{
		private var _useShortLoggerName:Boolean;

		public function SimpleLogFormatter(useShortLoggerName:Boolean = false)
		{
			_useShortLoggerName = useShortLoggerName;
		}

		public function formatLog(log:Log):String
		{
			var loggerName:String = getLoggerName(log.loggerName);
			return "[" + log.level.name + "] " + log.time + " - " + loggerName + " - " + log.message;
		}

		protected function getLoggerName(name:String):String
		{
			if (_useShortLoggerName)
			{
				var index:int = name.lastIndexOf(".");
				if (index != -1) name = name.substring(index + 1);
			}
			return name;
		}

		public function toString():String
		{
			return "[SimpleLogFormatter]";
		}
	}
}
