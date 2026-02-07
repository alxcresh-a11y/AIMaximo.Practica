using Microsoft.AspNetCore.Mvc.Rendering;

namespace AIMaximo.Practica.Web.Models
{
    public class ProductEditViewModel
    {
        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }

        // Proveedor seleccionado
        public int IdProveedor { get; set; }

        // Lista para el dropdown
        public List<SelectListItem> Proveedores { get; set; }
    }
}
