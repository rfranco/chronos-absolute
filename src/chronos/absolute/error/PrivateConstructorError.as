package chronos.absolute.error
{
	import flash.errors.IllegalOperationError;

	public final class PrivateConstructorError extends IllegalOperationError
	{
		public function PrivateConstructorError()
		{
			super("Private constructor cannot be instantiated.");
		}
	}
}