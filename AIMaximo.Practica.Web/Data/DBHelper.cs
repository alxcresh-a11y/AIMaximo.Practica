using MySql.Data.MySqlClient;
using Microsoft.Extensions.Configuration;

namespace AIMaximo.Practica.Web.Data
{
    public class DbHelper
    {
        private readonly string _connection;

        public DbHelper(IConfiguration configuration)
        {
            _connection = configuration.GetConnectionString("DefaultConnection");
        }

        public MySqlConnection GetConnection()
        {
            return new MySqlConnection(_connection);
        }
    }
}
