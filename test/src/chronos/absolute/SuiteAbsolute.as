package chronos.absolute
{
	import chronos.absolute.collection.SuiteCollection;
	import chronos.absolute.core.SuiteCore;
	import chronos.absolute.error.SuiteError;
	import chronos.absolute.util.SuiteUtil;

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
