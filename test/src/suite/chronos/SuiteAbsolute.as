package suite.chronos
{
	import suite.chronos.absolute.SuiteError;
	import suite.chronos.absolute.SuiteUtil;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteAbsolute
	{
		public var error:SuiteError;

		public var util:SuiteUtil;
	}
}
