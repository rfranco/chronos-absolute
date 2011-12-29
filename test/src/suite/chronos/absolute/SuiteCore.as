package suite.chronos.absolute
{
	import chronos.absolute.core.TestStringBuilder;
	import chronos.absolute.core.TestEnum;

	import suite.chronos.absolute.core.SuiteLang;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteCore
	{
		public var lang:SuiteLang;

		public var enum:TestEnum;

		public var stringBuilder:TestStringBuilder;
	}
}
