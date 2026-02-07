using AIMaximo.Practica.Web.Data;
using AIMaximo.Practica.Web.Models;
using MySql.Data.MySqlClient;

namespace AIMaximo.Practica.Web.Service
{
    public class ProductService
    {
        private readonly DbHelper _dbHelper;
        public ProductService(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public List<Product> ObtenerProductos() {
            var lista = new List<Product>();

            using (var connection = _dbHelper.GetConnection())
            {
                connection.Open();

                using (var cmd = new MySqlCommand("sp_Producto_Listar", connection))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new Product
                            {
                                Id = reader.GetString("Id"),
                                Nombre = reader.GetString("Nombre"),
                                Precio = reader.GetDecimal("Precio"),
                                Status = reader.GetBoolean("Activo"),
                                Descripcion = reader["Descripcion"] == DBNull.Value ? "" : reader.GetString("Descripcion")
                            });
                        }
                    }
                }
            }

            return lista;
        }

        public void InsertarProducto(Product producto)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_Producto_Insertar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_Id", producto.Id);
            cmd.Parameters.AddWithValue("@p_Nombre", producto.Nombre);
            cmd.Parameters.AddWithValue("@p_Precio", producto.Precio);
            cmd.Parameters.AddWithValue("@p_Descripcion",
            string.IsNullOrWhiteSpace(producto.Descripcion)
             ? DBNull.Value : producto.Descripcion);


            cmd.ExecuteNonQuery();
        }

        public void ActualizarProducto(Product producto)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_Producto_Actualizar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_Id", producto.Id);
            cmd.Parameters.AddWithValue("@p_Nombre", producto.Nombre);
            cmd.Parameters.AddWithValue("@p_Precio", producto.Precio);
            cmd.Parameters.AddWithValue("@p_Descripcion",
           string.IsNullOrWhiteSpace(producto.Descripcion)
           ? DBNull.Value: producto.Descripcion);


            cmd.ExecuteNonQuery();
        }

        public void EliminarProducto(String id)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_Producto_Eliminar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_Id", id);

            cmd.ExecuteNonQuery();
        }

        public List<Product> BuscarProductos(string texto)
        {
            var lista = new List<Product>();

            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_Producto_Buscar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_Texto", texto);

            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lista.Add(new Product
                {
                    Id = reader.GetString("Id"),                    
                    Nombre = reader.GetString("Nombre"),
                    Descripcion = reader.GetString("Descripcion"),
                    Precio = reader.GetDecimal("Precio"),           
                    Status = reader.GetBoolean("Activo")

                });
            }

            return lista;
        }


    }
}
