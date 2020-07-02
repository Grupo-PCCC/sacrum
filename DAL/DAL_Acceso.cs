using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    internal class DAL_Acceso
    {

        private SqlConnection conexion;

        private void Abrir()
        {
            conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);
            conexion.Open();
        }

        private void Cerrar()
        {
            conexion.Close();
            conexion = null;
            GC.Collect();
        }

        private SqlCommand CrearComando(string nombre, List<SqlParameter> parametros = null)
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandText = nombre;
            comando.CommandType = CommandType.StoredProcedure;

            if (parametros != null && parametros.Count > 0)
            {
                comando.Parameters.AddRange(parametros.ToArray());
            }
            return comando;
        }

        public DataTable Leer(string nombre, List<SqlParameter> parametros = null)
        {
            Abrir();

            DataTable tabla = new DataTable();
            SqlDataAdapter adaptador = new SqlDataAdapter();

            adaptador.SelectCommand = CrearComando(nombre, parametros);
            adaptador.Fill(tabla);
            adaptador = null;

            Cerrar();

            return tabla;
        }


                          


        public int Escribir(string nombre, List<SqlParameter> parametros)
        {
            int filasAfectadas = 0;
            Abrir();
            SqlCommand comando = CrearComando(nombre, parametros);

            try
            {
                filasAfectadas = comando.ExecuteNonQuery();
            }

            catch
            {
                filasAfectadas = -1;
            }
               Cerrar();
            return filasAfectadas;
        }

        public SqlParameter CrearParametro(string nombre, string valor)
        {
            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = nombre;
            parametro.Value = valor;
            parametro.DbType = DbType.String;
            return parametro;
        }

        public SqlParameter CrearParametro(string nombre, int valor)
        {
            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = nombre;
            parametro.Value = valor;
            parametro.DbType = DbType.Int32;
            return parametro;
        }
        public SqlParameter CrearParametro(string nombre, DateTime valor)
        {
            SqlParameter parametro = new SqlParameter();
            parametro.ParameterName = nombre;
            parametro.Value = valor;
            parametro.DbType = DbType.DateTime;
            return parametro;
        }

    }
}
