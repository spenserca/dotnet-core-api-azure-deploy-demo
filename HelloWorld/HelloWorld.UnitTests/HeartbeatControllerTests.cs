using Microsoft.AspNetCore.Mvc;
using System;
using Xunit;

namespace HelloWorld.UnitTests
{
	public class HeartbeatControllerTests
	{
		private readonly HeartbeatController underTest;

		public HeartbeatControllerTests()
		{
			underTest = new HeartbeatController();
		}

		[Fact]
		public void Get_ReturnsOkResponse()
		{
			var actual = underTest.Get();

			Assert.IsAssignableFrom<OkResult>(actual);
		}
	}
}
