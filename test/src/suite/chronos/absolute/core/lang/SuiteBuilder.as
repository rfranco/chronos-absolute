package suite.chronos.absolute.core.lang
{
	import chronos.absolute.core.lang.builder.TestToStringStyle;
	import chronos.absolute.core.lang.builder.TestToStringBuilder;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteBuilder
	{
		public var toStringBuilder:TestToStringBuilder;

		public var toStringStyle:TestToStringStyle;
	}
}
