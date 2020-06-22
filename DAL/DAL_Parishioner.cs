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
    public class DAL_Parishioner
    {
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public List<EN_Parishioner> ListarParishioner(string buscar)
        {
            var lista = new List<EN_Parishioner>();
            SqlDataReader LeerFilas;
            SqlCommand cmd = new SqlCommand("ListParish", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Name", buscar);

            LeerFilas = cmd.ExecuteReader();

            while (LeerFilas != null && LeerFilas.Read())

            {
                var reg = new EN_Parishioner();
                reg.Id = (int)LeerFilas["Id"];
                reg.Name = (string)LeerFilas["Name"];
                reg.Surname = (string)LeerFilas["Surname"];
                reg.BirthDate = (DateTime)LeerFilas["BirthDate"];
                //reg.NumberP = (string)LeerFilas["NumberP"];
                //reg.NumberA = (string)LeerFilas["NumberA"];

                lista.Add(reg);

            }
            Conexion.Close();
            LeerFilas.Close();
            return lista;
        }

    }
}
