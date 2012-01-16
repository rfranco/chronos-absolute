package suite.chronos.absolute.core
{
	import suite.chronos.absolute.core.lang.SuiteBuilder;

	import chronos.absolute.core.lang.TestDisposable;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteLang
	{
		public var builder:SuiteBuilder;

		public var disposable:TestDisposable;
	}
}
