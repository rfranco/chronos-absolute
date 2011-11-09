package chronos.absolute.error
{
	import flash.errors.IllegalOperationError;

	public final class EnumError extends IllegalOperationError
	{
		public function EnumError()
		{
			super("Enum constants can only be constructed as static consts in their own enum class.");
		}
	}
}