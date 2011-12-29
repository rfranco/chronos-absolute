package chronos.absolute.logging.appender
{
	import chronos.absolute.error.AbstractClassError;
	import chronos.absolute.error.AbstractMethodError;
	import chronos.absolute.error.Assert;
	import chronos.absolute.logging.Log;
	import chronos.absolute.logging.LogLevel;
	import chronos.absolute.logging.formatter.ILogFormatter;
	import chronos.absolute.logging.formatter.SimpleLogFormatter;

	[Abstract]
	public class AbstractLogAppender implements ILogAppender
	{
		private var _threshold:LogLevel;

		private var _formatter:ILogFormatter;

		public function AbstractLogAppender(formatter:ILogFormatter = null)
		{
			if (AbstractLogAppender == Object(this).constructor) throw new AbstractClassError();
			_formatter = formatter || new SimpleLogFormatter();
			_threshold = LogLevel.TRACE;
		}

		public final function appendLog(log:Log):void
		{
			if (isBelowThreshold(log.level)) return;
			appendMessage(_formatter.formatLog(log));
		}

		protected final function isBelowThreshold(level:LogLevel):Boolean
		{
			return _threshold.value > level.value;
		}

		[Abstract]
		protected function appendMessage(message:String):void
		{
			throw new AbstractMethodError();
		}

		public final function get threshold():LogLevel
		{
			return _threshold;
		}

		public final function set threshold(level:LogLevel):void
		{
			Assert.notNull(level, "'level' must not null");
			_threshold = level;
		}

		public function toString():String
		{
			return "[AbstractAppender]";
		}
	}
}