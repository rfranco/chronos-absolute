package chronos.absolute.logging.formatter
{
	import chronos.absolute.logging.Log;

	public interface ILogFormatter
	{
		function formatLog(log:Log):String;
	}
}
