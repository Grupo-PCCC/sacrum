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
    public class DAL_Usuario
    {
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public List<EN_Usuario> ListarUsers(string buscar)
        {
            var lista = new List<EN_Usuario>();
            SqlDataReader LeerFilas;
            SqlCommand cmd = new SqlCommand("ListUser", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Nick", buscar);

            LeerFilas = cmd.ExecuteReader();

            while (LeerFilas != null && LeerFilas.Read())

            {
                var reg = new EN_Usuario();
                reg.Id = (int)LeerFilas["Id"];
                reg.Nick = (string)LeerFilas["Nick"];
                reg.Contraseña = (string)LeerFilas["Password"];
                reg.Nombre = (string)LeerFilas["Name"];
                reg.Apellido = (string)LeerFilas["Surname"];
                reg.TipoUsuario= (string)LeerFilas["TipoPerfil"];
                lista.Add(reg);

            }
            Conexion.Close();
            LeerFilas.Close();
            return lista;
        }

    }
}
