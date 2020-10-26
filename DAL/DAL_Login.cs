using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EN;
using COMMON;

namespace DAL
{
    public class DAL_Login
    {
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public bool Login(string Nick, string Contrasenia)
        {
            SqlCommand cmd = new SqlCommand("IniciarSesion", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Nick", Nick);
            cmd.Parameters.AddWithValue("@Contrasenia", Contrasenia);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    LoginCache.Id = reader.GetInt32(0);
                    LoginCache.Nick = reader.GetString(4);
                    LoginCache.Nombre = reader.GetString(2);
                    LoginCache.Apellido = reader.GetString(3);


                }
                return true;

            }
            else
                return false;
        }

    }
}
