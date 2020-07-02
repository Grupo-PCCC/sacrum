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
        private DAL_Acceso acceso = new DAL_Acceso();
        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public List<EN_Usuario> ListaTotal()


        {
            DataTable Tabla = acceso.Leer("ListUser", null);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                EN_TipoUsuario Tipo = new EN_TipoUsuario();
                var usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Password"].ToString());
                usuario.Nombre = (registro["Name"].ToString());
                usuario.Apellido = (registro["Surname"].ToString());

                Tipo.Nombre=(registro["TipoPerfil"].ToString());
                lista.Add(registro);

            }
            return lista;


        }    

           

           


           

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
                reg.TipoUsuario = (string)LeerFilas["TipoPerfil"];
                lista.Add(reg);

            }


            Conexion.Close();
            LeerFilas.Close();
            return lista;
        }

        public int Insertar(EN_Usuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nick", usuario.Nick));
            parameters.Add(acceso.CrearParametro("@Contraseña", usuario.Contraseña));
            parameters.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@TipoUsuario", usuario.TipoUsuario));

            return acceso.Escribir("NewUser", parameters);


        }

        public int Editar(EN_Usuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameters.Add(acceso.CrearParametro("@Nick", usuario.Nick));
            parameters.Add(acceso.CrearParametro("@Name", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Surname", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@TipoUsuario", usuario.TipoUsuario));

            return acceso.Escribir("UpdateUser", parameters);
        }

        public int Borrar(EN_Usuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", usuario.Id));

            return acceso.Escribir("DeleteUser", parameters);
        }






    }
}
