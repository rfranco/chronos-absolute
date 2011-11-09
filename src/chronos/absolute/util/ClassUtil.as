package chronos.absolute.util
{
	import chronos.absolute.error.Assert;
	import chronos.absolute.error.PrivateConstructorError;

	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public final class ClassUtil
	{
		public static function createByName(className:String, ... args):*
		{
			Assert.notNull(className, "'className' must not null");
			if (args.length == 1 && args[0] is Array) args = args[0];
			var clazz:Class = getDefinitionByName(className) as Class;
			return createNewInstance(clazz, args);
		}

		public static function createNewInstance(type:Class, ... args):*
		{
			Assert.notNull(type, "'type' must not null");
			if (args.length == 1 && args[0] is Array) args = args[0];
			var instance:*;
			switch (args.length)
			{
				case 0:
					instance = new type();
					break;
				case 1:
					instance = new type(args[0]);
					break;
				case 2:
					instance = new type(args[0], args[1]);
					break;
				case 3:
					instance = new type(args[0], args[1], args[2]);
					break;
				case 4:
					instance = new type(args[0], args[1], args[2], args[3]);
					break;
				case 5:
					instance = new type(args[0], args[1], args[2], args[3], args[4]);
					break;
				case 6:
					instance = new type(args[0], args[1], args[2], args[3], args[4], args[5]);
					break;
				case 7:
					instance = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
					break;
				case 8:
					instance = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
					break;
				default:
					throw new ArgumentError("Unsupported number of Constructor args: " + args.length);
			}
			return instance;
		}

		public static function getName(value:*):String
		{
			var name:String = getQualifiedClassName(value);
			return name.replace("::", "."); 
		}

		public static function getSimpleName(value:*):String
		{
			var name:String = getName(value);
			return name.substring(name.lastIndexOf(".") + 1);
		}

		/** @private */
		public function ClassUtil()
		{
			throw new PrivateConstructorError();
		}
	}
}
