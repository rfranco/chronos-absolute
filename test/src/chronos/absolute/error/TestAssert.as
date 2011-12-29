package chronos.absolute.error
{
	public class TestAssert
	{
		[Test(expects="chronos.absolute.error.PrivateConstructorError")]
		public function constructor():void
		{
			new Assert();
		}

		[Test]
		public function isTrue():void
		{
			Assert.isTrue(1 == 1);
		}

		[Test(expects="flash.errors.IllegalOperationError")]
		public function isTrueFail():void
		{
			Assert.isTrue(1 != 1);
		}

		[Test]
		public function inRange():void
		{
			Assert.inRange(0.5, 0, 1);
		}

		[Test(expects="RangeError")]
		public function inRangeAfterFail():void
		{
			Assert.inRange(1.1, 0, 1);
		}
		
		[Test(expects="RangeError")]
		public function inRangeBeforeFail():void
		{
			Assert.inRange(-0.1, 0, 1);
		}

		[Test]
		public function notNull():void
		{
			Assert.notNull(1);
			Assert.notNull(1.0);
			Assert.notNull("");
			Assert.notNull("String");
			Assert.notNull(new Object());
		}

		[Test(expects="chronos.absolute.error.NullPointerError")]
		public function notNullFail():void
		{
			Assert.notNull(null);
		}

		[Test]
		public function instanceOf():void
		{
			Assert.instanceOf(1, int);
			Assert.instanceOf(1.0, Number);
			Assert.instanceOf("", String);
			Assert.instanceOf("String", String);
			Assert.instanceOf(new Object(), Object);
			Assert.instanceOf(new String(), Object);
		}

		[Test(expects="flash.errors.IllegalOperationError")]
		public function instanceOfFail():void
		{
			Assert.instanceOf("String", Number);
		}
	}
}
