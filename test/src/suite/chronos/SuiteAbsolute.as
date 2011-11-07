package suite.chronos
{
	import suite.chronos.absolute.SuiteCollection;
	import suite.chronos.absolute.SuiteCore;
	import suite.chronos.absolute.SuiteError;
	import suite.chronos.absolute.SuiteUtil;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteAbsolute
	{
		public var collection:SuiteCollection;

		public var core:SuiteCore;

		public var error:SuiteError;

		public var util:SuiteUtil;
	}
}
