package chronos.absolute.util
{
	import chronos.absolute.error.Assert;
	import chronos.absolute.error.PrivateConstructorError;

	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public final class ClassUtil
	{
		public static function createByName(className:String, ... args):Object
		{
			Assert.notNull(className, "'className' must not null");
			if (args.length == 1 && args[0] is Array) args = args[0];
			var clazz:Class = getDefinitionByName(className) as Class;
			return createNewInstance(clazz, args);
		}

		public static function createNewInstance(type:Class, ... args):Object
		{
			Assert.notNull(type, "'type' must not null");
			if (args.length == 1 && args[0] is Array) args = args[0];
			switch (args.length)
			{
				case 0:
					return new type();
				case 1:
					return new type(args[0]);
				case 2:
					return new type(args[0], args[1]);
				case 3:
					return new type(args[0], args[1], args[2]);
				case 4:
					return new type(args[0], args[1], args[2], args[3]);
				case 5:
					return new type(args[0], args[1], args[2], args[3], args[4]);
				case 6:
					return new type(args[0], args[1], args[2], args[3], args[4], args[5]);
				case 7:
					return new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
				case 8:
					return new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
				default:
					throw new ArgumentError("Unsupported number of Constructor args: " + args.length);
			}
		}

		public static function getName(type:Class):String
		{
			return getQualifiedClassName(type).replace("::", ".");
		}

		public static function getSimpleName(type:Class):String
		{
			var name:String = getName(type);
			return name.substring(name.lastIndexOf(".") + 1);
		}

		/** @private */
		public function ClassUtil()
		{
			throw new PrivateConstructorError();
		}
	}
}
