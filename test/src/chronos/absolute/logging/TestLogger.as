package chronos.absolute.logging
{
	public class TestLogger
	{
		[Test(expects="chronos.absolute.error.NullPointerError")]
		public function setLogLevelNull():void
		{
			var logger:Logger = LogContext.getLogger(TestLogger);
			logger.level = null;
		}
	}
}