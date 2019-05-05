using Microsoft.AspNetCore.Mvc;

namespace HelloWorld
{
	public class HeartbeatController : Controller
	{
		[HttpGet("/heartbeat")]
		public IActionResult Get() => Ok();
	}
}
