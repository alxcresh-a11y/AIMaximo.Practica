using AIMaximo.Practica.Web.Models;
using AIMaximo.Practica.Web.Service;
using Microsoft.AspNetCore.Mvc;

namespace AIMaximo.Practica.Web.Controllers
{
    public class ProductoProveedorController : Controller
    {
        private readonly ProductoProveedorService _productoProveedorService;

        public ProductoProveedorController(ProductoProveedorService productoProveedorService)
        {
            _productoProveedorService = productoProveedorService;
        }
        /*

        // POST: Agregar proveedor a un producto
        [HttpPost]
        public IActionResult Agregar(ProductoProveedor item)
        {
            if (item == null || string.IsNullOrWhiteSpace(item.IdProducto))
                return BadRequest("Datos inválidos");

            _productoProveedorService.Insertar(item);

            return RedirectToAction("Edit", "Producto", new { id = item.IdProducto });
        }
        */


        // GET: Eliminar proveedor de un producto
        public IActionResult Eliminar(string idProducto, int idProveedor)
        {
            if (string.IsNullOrWhiteSpace(idProducto))
                return BadRequest("IdProducto requerido");

            _productoProveedorService.Eliminar(idProducto, idProveedor);

            return RedirectToAction("Edit", "Producto", new { id = idProducto });
        }

        [HttpPost]
        public IActionResult Agregar(string IdProducto, int IdProveedor, decimal PrecioProveedor, string ClaveProveedor)
        {
            _productoProveedorService.Insertar(new ProductoProveedor
            {
                IdProducto = IdProducto,
                IdProveedor = IdProveedor,
                PrecioProveedor = PrecioProveedor,
                ClaveProveedor = ClaveProveedor
            });

            return RedirectToAction("Edit", "Producto", new { id = IdProducto });
        }

        public IActionResult Editar(string idProducto, int idProveedor)
        {
            var item = _productoProveedorService.Obtener(idProducto, idProveedor);

            if (item == null)
                return NotFound();

            return View(item);
        }

        [HttpPost]
        public IActionResult Editar(ProductoProveedor item)
        {
            _productoProveedorService.Actualizar(item);

            return RedirectToAction("Edit", "Producto", new { id = item.IdProducto });
        }


    }
}