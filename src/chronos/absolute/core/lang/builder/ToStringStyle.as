package chronos.absolute.core.lang.builder
{
	import chronos.absolute.util.ClassUtil;
	import chronos.absolute.core.StringBuilder;

	public class ToStringStyle
	{
		public static const DEFAULT_STYLE:ToStringStyle = new ToStringStyle();

		protected var _useShortClassName:Boolean = true;

		protected var _contentStart:String = "[";

		protected var _contentEnd:String = "]";

		protected var _fieldSeparator:String = ",";

		protected var _fieldNameValueSeparator:String = "=";

		public function ToStringStyle()
		{
		}

		public function appendStart(builder:StringBuilder, target:Object):ToStringStyle
		{
			builder
				.append(getClassName(target))
				.append(_contentStart);
			return this;
		}

		public function appendSuper(builder:StringBuilder, superToString:String):ToStringStyle
		{
			appendToString(builder, superToString);
			return this;
		}

		public function appendToString(builder:StringBuilder, toString:String):ToStringStyle
		{
			if (toString != null)
			{
				var start:int = toString.indexOf(_contentStart) + _contentStart.length;
				var end:int = toString.lastIndexOf(_contentEnd);
				if (start != end && start >= 0 && end >= 0)
				{
					var fields:String = toString.substring(start, end);
					builder
						.append(fields)
						.append(_fieldSeparator);
				}
			}
			return this;
		}

		public function append(builder:StringBuilder, fieldName:String, value:*):ToStringStyle
		{
			builder
				.append(fieldName)
				.append(_fieldNameValueSeparator)
				.append(value)
				.append(_fieldSeparator);
			return this;
		}

		public function appendEnd(builder:StringBuilder):ToStringStyle
		{
			builder.removeLast();
			if (builder.length > 1)
			{
				builder.append(_contentEnd);
			}
			return this;
		}

		protected function getClassName(target:Object):String
		{
			var className:String;
			if (_useShortClassName)
			{
				className = ClassUtil.getSimpleName(target);
			}
			else
			{
				className = ClassUtil.getName(target);
			}
			return className;
		}

		public final function get useShortClassName():Boolean
		{
			return _useShortClassName;
		}

		public final function get contentStart():String
		{
			return _contentStart;
		}

		public final function get contentEnd():String
		{
			return _contentEnd;
		}

		public final function get fieldSeparator():String
		{
			return _fieldSeparator;
		}

		public final function get fieldNameValueSeparator():String
		{
			return _fieldNameValueSeparator;
		}
	}
}
