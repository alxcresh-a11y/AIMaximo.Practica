using Microsoft.AspNetCore.Mvc;

namespace AIMaximo.Practica.Web.Controllers.API
{
    [ApiController]
    [Route("api/productos")]
    public class ProductoApiController : Controller
    {

        [HttpGet]
        public IActionResult Get()
        {
            return Ok();
        }
    }
}
