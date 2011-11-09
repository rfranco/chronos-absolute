package chronos.absolute.error
{
	import flash.errors.IllegalOperationError;

	public final class AbstractMethodError extends IllegalOperationError
	{
		public function AbstractMethodError()
		{
			super("Method must to be implemented in subclass");
		}
	}
}