package chronos.absolute.collection
{
	import chronos.absolute.collection.collection.SuiteCollections;
	import chronos.absolute.collection.iterator.SuiteIterator;
	import chronos.absolute.collection.set.SuiteSet;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SuiteCollection
	{
		public var collection:SuiteCollections;

		public var iterator:SuiteIterator;

		public var set:SuiteSet;
	}
}
