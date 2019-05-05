using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace HelloWorld
{
	public class Startup
	{
		// Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddMvcCore();
		}

		// Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app)
		{
			app.UseMvc();
		}
	}
}
