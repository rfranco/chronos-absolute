package chronos.absolute.logging.appender
{
	import chronos.absolute.logging.Log;
	import chronos.absolute.logging.LogLevel;

	public interface ILogAppender
	{
		function appendLog(log:Log):void;

		function get threshold():LogLevel;

		function set threshold(level:LogLevel):void;
	}
}
