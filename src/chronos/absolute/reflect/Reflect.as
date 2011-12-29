package chronos.absolute.reflect
{
	import chronos.absolute.error.PrivateConstructorError;

	public final class Reflect
	{
		/** @private */
		public function Reflect()
		{
			throw new PrivateConstructorError();
		}
	}
}
