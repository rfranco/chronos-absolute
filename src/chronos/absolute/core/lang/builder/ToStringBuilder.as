package chronos.absolute.core.lang.builder
{
	import chronos.absolute.core.StringBuilder;

	public final class ToStringBuilder
	{
		static private var _defaultStyle:ToStringStyle = ToStringStyle.DEFAULT_STYLE;

		static public function get defaultStyle():ToStringStyle
		{
			return _defaultStyle;
		}

		static public function set defaultStyle(defaultStyle:ToStringStyle):void
		{
			_defaultStyle = defaultStyle;
		}

		private var _target:Object;

		private var _style:ToStringStyle;

		private var _builder:StringBuilder;

		public function ToStringBuilder(target:Object, style:ToStringStyle = null)
		{
			_target = target;
			_style = style || _defaultStyle;
			_builder = new StringBuilder();
			_style.appendStart(_builder, target);
		}

		public function append(fieldName:String, value:*):ToStringBuilder
		{
			_style.append(_builder, fieldName, value);
			return this;
		}

		public function appendSupper(superToString:String):ToStringBuilder
		{
			_style.appendSuper(_builder, superToString);
			return this;
		}

		public function build():String
		{
			_style.appendEnd(_builder);
			return _builder.build();
		}

		public function toString():String
		{
			return build();
		}
	}
}
