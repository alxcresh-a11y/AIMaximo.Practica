using AIMaximo.Practica.Web.Models;
using AIMaximo.Practica.Web.Service;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace AIMaximo.Practica.Web.Controllers
{
    public class ProductoController : Controller
    {
        private readonly ProductService _productoService;
        private readonly ProductoProveedorService _productoProveedorService;
        private readonly ProveedorService _proveedorService;

        public ProductoController(
            ProductService productoService,
            ProductoProveedorService productoProveedorService,
            ProveedorService proveedorService)
        {
            _productoService = productoService;
            _productoProveedorService = productoProveedorService;
            _proveedorService = proveedorService;
        }

        // GET: Producto / Buscador
        public IActionResult Index(string buscar)
        {
            var productos = string.IsNullOrWhiteSpace(buscar)
                ? _productoService.ObtenerProductos()
                : _productoService.BuscarProductos(buscar);

            ViewBag.Buscar = buscar;
            return View(productos);
        }

        // GET: Producto/Create
        public IActionResult Create()
        {
            ViewBag.ListaProveedores = _proveedorService.ObtenerProveedoresActivos();
            return View();
        }

        // POST: Producto/Create
        [HttpPost]
        public IActionResult Create(Product producto, string IdProveedor)
        {
            // Generar Id
            producto.Id = GenerarIdProducto(producto.Nombre);

            // Guardar producto
            _productoService.InsertarProducto(producto);

            // Guardar proveedor del producto
            _productoProveedorService.Insertar(new ProductoProveedor
            {
                IdProducto = producto.Id,
                IdProveedor = int.Parse(IdProveedor),
                PrecioProveedor = producto.PrecioProveedor,
                ClaveProveedor = producto.ClaveProveedor

            });

            // return RedirectToAction("Edit", new { id = producto.Id });
            return RedirectToAction("Index");
        }



        // GET: Producto/Edit/5
        public IActionResult Edit(string id)
        {
            var producto = _productoService.ObtenerProductos()
                                           .FirstOrDefault(x => x.Id == id);

            if (producto == null)
                return NotFound();

            //  Cargar proveedores del producto
            ViewBag.Proveedores = _productoProveedorService.ListarPorProducto(id);

            // Cargar lista de proveedores disponibles
            ViewBag.ListaProveedores = _proveedorService.ObtenerProveedoresActivos();

            return View(producto);
        }

        // POST: Producto/Edit
        [HttpPost]
        public IActionResult Edit(Product producto)
        {
            _productoService.ActualizarProducto(producto);
            return RedirectToAction("Index");
        }

        // GET: Producto/Delete/5
        public IActionResult Delete(string id)
        {
            _productoService.EliminarProducto(id);
            return RedirectToAction("Index");
        }

        private string GenerarIdProducto(string nombre)
        {
            // Tomar solo letras y números del nombre
            string letras = new string(nombre
                .Where(char.IsLetterOrDigit)
                .Take(4)
                .ToArray())
                .ToUpper();

            // Si el nombre tiene menos de 4 caracteres, completar con X
            while (letras.Length < 4)
                letras += "X";

            // Generar 4 números aleatorios
            Random rnd = new Random();
            int numeros = rnd.Next(1000, 9999);

            return $"{letras}-{numeros}";
        }
    }
}