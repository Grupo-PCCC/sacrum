using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EN;

namespace DAL
{
    public class DAL_Login
    {
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public bool Login(string Nick, string Password)
        {
            SqlCommand cmd = new SqlCommand("SelectUser", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Nick", Nick);
            cmd.Parameters.AddWithValue("@Password", Password);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                return true;
            }
            else
                return false;
        }

    }
}
