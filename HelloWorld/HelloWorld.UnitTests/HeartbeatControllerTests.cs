using Microsoft.AspNetCore.Mvc;
using System;
using Xunit;

namespace HelloWorld.UnitTests
{
	public class HeartbeatControllerTests
	{
		private readonly HeartbeatController _underTest;

		public HeartbeatControllerTests()
		{
			_underTest = new HeartbeatController();
		}

		[Fact]
		public void Get_ReturnsOkResponse()
		{
			var actual = _underTest.Get();

			Assert.IsAssignableFrom<OkResult>(actual);
		}
	}
}
