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
<<<<<<< HEAD
                //reg.NumberP = (string)LeerFilas["NumberP"];
                //reg.NumberA = (string)LeerFilas["NumberA"];

=======
                reg.NumberP = Convert.ToString(LeerFilas["NumberP"] is DBNull ? "" : LeerFilas["NumberP"]);
                reg.NumberA = Convert.ToString(LeerFilas["NumberA"] is DBNull ? "" : LeerFilas["NumberA"]);
                reg.Observation = (string)LeerFilas["Observation"];
                //reg._parishionerPhone.IdPHP1 = (int)LeerFilas["IdPHP1"];
                //reg._parishionerPhone.IdPHP2 = (int)LeerFilas["IdPHP2"];
>>>>>>> master
                lista.Add(reg);

            }
            Conexion.Close();
            LeerFilas.Close();
            return lista;
        }

    }
<<<<<<< HEAD
}
=======
}
>>>>>>> master
