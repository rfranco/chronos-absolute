package chronos.absolute.error
{
	import flash.errors.IllegalOperationError;

	public final class AbstractClassError extends IllegalOperationError
	{
		public function AbstractClassError()
		{
			super("Abstract class cannot be instantiated.");
		}
	}
}