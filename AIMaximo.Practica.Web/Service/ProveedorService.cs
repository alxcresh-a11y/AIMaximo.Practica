using AIMaximo.Practica.Web.Data;
using AIMaximo.Practica.Web.Models;
using MySql.Data.MySqlClient;

namespace AIMaximo.Practica.Web.Service
{
    public class ProveedorService
    {
        private readonly DbHelper _dbHelper;

        public ProveedorService(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public List<Proveedor> ObtenerProveedoresActivos()
        {
            var lista = new List<Proveedor>();

            using var conn = _dbHelper.GetConnection();
            conn.Open();

            string sql = "SELECT IdProveedor, Nombre FROM Proveedor WHERE Activo = 1";

            using var cmd = new MySqlCommand(sql, conn);
            using var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lista.Add(new Proveedor
                {
                    IdProveedor = reader.GetInt32("IdProveedor"),
                    Nombre = reader.GetString("Nombre")
                });
            }

            return lista;
        }
    }


}
