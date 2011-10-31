package chronos.absolute.error
{
	import chronos.absolute.util.StringUtil;

	import flash.errors.IllegalOperationError;

	public final class Assert
	{
		public static function isTrue(expression:*, message:String = null, ... rest):void
		{
			if (!expression)
			{
				if (message == null) message = "This expression must be true.";
				else message = StringUtil.substitute(message, rest);
				throw new IllegalOperationError(message);
			}
		}

		public static function inRange(expression:*, message:String = null, ... rest):void
		{
			if (!expression)
			{
				if (message == null) message = "This argument is outside the acceptable range.";
				else message = StringUtil.substitute(message, rest);
				throw new RangeError(message);
			}
		}

		public static function notNull(object:*, message:String = null, ... rest):void
		{
			if (object == null)
			{
				if (message == null) message = "This argument is required, it must not null.";
				else message = StringUtil.substitute(message, rest);
				throw new NullPointerError(message);
			}
		}

		public static function instanceOf(object:*, type:Class, message:String = null, ... rest):void
		{
			if (!(object is type))
			{
				if (message == null) message = "This argument is not of type '" + type + "'.";
				else message = StringUtil.substitute(message, rest);
				throw new IllegalOperationError(message);
			}
		}

		/** @private */
		public function Assert()
		{
			throw new PrivateConstructorError();
		}
	}
}
