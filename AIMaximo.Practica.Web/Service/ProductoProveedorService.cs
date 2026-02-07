using AIMaximo.Practica.Web.Data;
using AIMaximo.Practica.Web.Models;
using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace AIMaximo.Practica.Web.Service
{
    public class ProductoProveedorService
    {
        private readonly DbHelper _dbHelper;

        public ProductoProveedorService(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // LISTAR PROVEEDORES POR PRODUCTO
        public List<ProductoProveedor> ListarPorProducto(string idProducto)
        {
            var lista = new List<ProductoProveedor>();

            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_ProductoProveedor_Listar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_IdProducto", idProducto);

            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lista.Add(new ProductoProveedor
                {
                    IdProducto = reader.GetString("IdProducto"),
                    IdProveedor = reader.GetInt32("IdProveedor"),
                    NombreProveedor = reader.GetString("NombreProveedor"),
                    //nuevos campos
                    PrecioProveedor = reader.GetInt32("PrecioProveedor"),
                    ClaveProveedor = reader.GetString("ClaveProveedor")

                });
            }

            return lista;
        }

        // INSERTAR PROVEEDOR (usa tu SP que copia el nombre automáticamente)
        public void Insertar(ProductoProveedor item)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_ProductoProveedor_Insertar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_IdProducto", item.IdProducto);
            cmd.Parameters.AddWithValue("@p_IdProveedor", item.IdProveedor);
            cmd.Parameters.AddWithValue("@p_PrecioProveedor", item.PrecioProveedor);
            cmd.Parameters.AddWithValue("@p_ClaveProveedor", item.ClaveProveedor);

            cmd.ExecuteNonQuery();
        }

        // ELIMINAR PROVEEDOR DE UN PRODUCTO
        public void Eliminar(string idProducto, int idProveedor)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_ProductoProveedor_Eliminar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_IdProducto", idProducto);
            cmd.Parameters.AddWithValue("@p_IdProveedor", idProveedor);

            cmd.ExecuteNonQuery();
        }


        public ProductoProveedor Obtener(string idProducto, int idProveedor)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_ProductoProveedor_Obtener", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_IdProducto", idProducto);
            cmd.Parameters.AddWithValue("@p_IdProveedor", idProveedor);

            using var reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return new ProductoProveedor
                {
                    IdProducto = reader.GetString("IdProducto"),
                    IdProveedor = reader.GetInt32("IdProveedor"),
                    NombreProveedor = reader.GetString("NombreProveedor"),
                    PrecioProveedor = reader.GetDecimal("PrecioProveedor"),
                    ClaveProveedor = reader.GetString("ClaveProveedor")
                };
            }

            return null;
        }

        public void Actualizar(ProductoProveedor item)
        {
            using var conn = _dbHelper.GetConnection();
            conn.Open();

            using var cmd = new MySqlCommand("sp_ProductoProveedor_Actualizar", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_IdProducto", item.IdProducto);
            cmd.Parameters.AddWithValue("@p_IdProveedor", item.IdProveedor);
            cmd.Parameters.AddWithValue("@p_PrecioProveedor", item.PrecioProveedor);
            cmd.Parameters.AddWithValue("@p_ClaveProveedor", item.ClaveProveedor);

            cmd.ExecuteNonQuery();
        }
    }
}