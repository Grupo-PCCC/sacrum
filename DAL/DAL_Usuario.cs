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
    public class DAL_Usuario
    {
        private DAL_Acceso acceso = new DAL_Acceso();

        public EN_TipoUsuario _TipoUsuario;


        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        public List<EN_Usuario> ListaTotal()
        {
            
            DataTable Tabla = acceso.Leer("ListUser", null);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                _TipoUsuario = new EN_TipoUsuario();
                EN_Usuario usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Password"].ToString());
                usuario.Nombre = (registro["Name"].ToString());
                usuario.Apellido = (registro["Surname"].ToString());
                usuario._tipoUsuario.Tusuario = (registro["TipoPerfil"].ToString());
                usuario.TipoUsuario = usuario._tipoUsuario.Tusuario.ToString();
                lista.Add(usuario);

            }
            return lista;


        }

        public List<EN_Usuario> ListarUser(string buscar)

        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nick", buscar));
            DataTable Tabla = acceso.Leer("ListUserNick", parameters);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                
                var usuario = new EN_Usuario();
                
                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Password"].ToString());
                usuario.Nombre = (registro["Name"].ToString());
                usuario.Apellido = (registro["Surname"].ToString());
                usuario._tipoUsuario.Tusuario = (registro["TipoPerfil"].ToString());
                usuario.TipoUsuario = usuario._tipoUsuario.Tusuario.ToString();
                lista.Add(usuario);

            }
            return lista;
        }

        public List<EN_Usuario> ListarUserId(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", idEncontrado));
            DataTable tabla = acceso.Leer("ListIdUser", parameters);
            List<EN_Usuario> userID = new List<EN_Usuario>();

            foreach (DataRow registro in tabla.Rows)
            {
                var usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Password"].ToString());
                usuario.Nombre = (registro["Name"].ToString());
                usuario.Apellido = (registro["Surname"].ToString());
                usuario._tipoUsuario.Id = int.Parse(registro["TipoPerfil"].ToString());
                
                userID.Add(usuario);
            }

            return userID;
        }


            public int Insertar(EN_Usuario usuario)
        {
            
            List<SqlParameter> parameters = new List<SqlParameter>();
            usuario.Contraseña=GenerarMD5.crearMD5(usuario.Contraseña);
            parameters.Add(acceso.CrearParametro("@Nick", usuario.Nick));
            parameters.Add(acceso.CrearParametro("@Password", usuario.Contraseña));
            parameters.Add(acceso.CrearParametro("@Name", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Surname", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@UserTypeId", usuario._tipoUsuario.Id));

            return acceso.Escribir("NewUser", parameters);


        }

        public int Editar(EN_Usuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameters.Add(acceso.CrearParametro("@Nick", usuario.Nick));
            parameters.Add(acceso.CrearParametro("@Name", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Surname", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@UserTypeId", _TipoUsuario.Id));

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
