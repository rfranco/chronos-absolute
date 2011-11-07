package suite.chronos.absolute
{
	import suite.chronos.absolute.collection.SuiteCollections;
	import suite.chronos.absolute.collection.SuiteIterator;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteCollection
	{
		public var collection:SuiteCollections;

		public var iterator:SuiteIterator;
	}
}
