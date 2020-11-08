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
            
            DataTable Tabla = acceso.Leer("VW_ListarUsuarios", null);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                _TipoUsuario = new EN_TipoUsuario();
                EN_Usuario usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Contrasenia"].ToString());
                usuario.Nombre = (registro["Nombre"].ToString());
                usuario.Apellido = (registro["Apellido"].ToString());
                usuario._tipoUsuario.Tusuario = (registro["TipoPerfil"].ToString());
                usuario.TipoUsuario = usuario._tipoUsuario.Tusuario.ToString();
                lista.Add(usuario);

            }
            return lista;


        }
        public List<EN_Usuario> ListaUsuarios()
        {

            DataTable Tabla = acceso.Leer("IdUsuario", null);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                
                EN_Usuario usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                lista.Add(usuario);

            }
            return lista;


        }

        public List<EN_Usuario> ListarUser(string nick, string nombre, string apellido, int estado, int tipoPerfil)

        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nick", nick));
            parameters.Add(acceso.CrearParametro("@Nombre", nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", apellido));
            parameters.Add(acceso.CrearParametro("@Estado", estado));
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", tipoPerfil));
            DataTable Tabla = acceso.Leer("VW_Usuarios", parameters);
            List<EN_Usuario> lista = new List<EN_Usuario>();

            foreach (DataRow registro in Tabla.Rows)
            {
                
                var usuario = new EN_Usuario();
                
                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Contrasenia"].ToString());
                usuario.Nombre = (registro["Nombre"].ToString());
                usuario.Apellido = (registro["Apellido"].ToString());
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
            DataTable tabla = acceso.Leer("VW_ListarIdUsuarios", parameters);
            List<EN_Usuario> userID = new List<EN_Usuario>();

            foreach (DataRow registro in tabla.Rows)
            {
                var usuario = new EN_Usuario();

                usuario.Id = int.Parse(registro["Id"].ToString());
                usuario.Nick = (registro["Nick"].ToString());
                usuario.Contraseña = (registro["Contrasenia"].ToString());
                usuario.Nombre = (registro["Nombre"].ToString());
                usuario.Apellido = (registro["Apellido"].ToString());
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
            parameters.Add(acceso.CrearParametro("@Contrasenia", usuario.Contraseña));
            parameters.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", usuario._tipoUsuario.Id));

            return acceso.Escribir("NewUser", parameters);


        }

        public int Editar(EN_Usuario usuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", usuario.Id));
            parameters.Add(acceso.CrearParametro("@Nick", usuario.Nick));
            parameters.Add(acceso.CrearParametro("@Nombre", usuario.Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", usuario.Apellido));
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", usuario._tipoUsuario.Id));

            return acceso.Escribir("UpdateUser", parameters);
        }

   






    }
}
