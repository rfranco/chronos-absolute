package chronos.absolute.core.lang.builder
{
	public class ToStringStyle
	{
		public static const DEFAULT_STYLE:ToStringStyle = new ToStringStyle();

		protected var _useShortClassName:Boolean = true;

		protected var _contentBegin:String = "[";

		protected var _contentEnd:String = "]";

		protected var _fieldSeparator:String = ",";

		protected var _fieldNameValueSeparator:String = "=";

		public function ToStringStyle()
		{
		}

		public function appendStart(target:Object):void
		{
		}

		public function append(fieldName:String, value:*):void
		{
		}

		public function appendEnd():void
		{
		}

		public function toString():String
		{
			return "[ToStringStyle]";
		}
	}
}
