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
    public class DAL_Users
    {
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public List<EN_Users> ListarUsers(string buscar)
        {
            var lista = new List<EN_Users>();
            SqlDataReader LeerFilas;
            SqlCommand cmd = new SqlCommand("ListUser", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Nick", buscar);

            LeerFilas = cmd.ExecuteReader();

            while (LeerFilas != null && LeerFilas.Read())

            {
                var reg = new EN_Users();
                reg.Id = (int)LeerFilas["Id"];
                reg.Nick = (string)LeerFilas["Nick"];
                reg.Password = (string)LeerFilas["Password"];
                reg.Name = (string)LeerFilas["Name"];
                reg.Surname = (string)LeerFilas["Surname"];
                reg.UserType= (string)LeerFilas["TipoPerfil"];
                lista.Add(reg);

            }
            Conexion.Close();
            LeerFilas.Close();
            return lista;
        }

    }
}
