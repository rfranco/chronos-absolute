package chronos.absolute.logging.appender
{
	import chronos.absolute.logging.formatter.ILogFormatter;

	public class TraceLogAppender extends AbstractLogAppender
	{
		public function TraceLogAppender(formatter:ILogFormatter = null)
		{
			super(formatter);
		}

		override protected function appendMessage(message:String):void
		{
			trace(message);
		}

		override public function toString():String
		{
			return "[TraceAppender]";
		}
	}
}