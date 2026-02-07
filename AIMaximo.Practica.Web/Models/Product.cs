namespace AIMaximo.Practica.Web.Models
{
    public class Product
    {
        public string Id { get; set; }   // este es el PK real
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }

        public Boolean Status { get; set; }
        // Campos de ProductoProveedor
        public decimal PrecioProveedor { get; set; }
        public string ClaveProveedor { get; set; }


    }
}
