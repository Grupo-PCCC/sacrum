using EN;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



namespace COMMON
{
    public class Audit
    {

        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);
        public int Id { get; set; }

        public EN_Usuario _usuario;
        public DateTime Fecha { get; set; }

        public string Nick { get; set; }
        public string Accion { get; set; }
        public Audit()
        {
            _usuario = new EN_Usuario();
        }

        public bool EscribirLog(Audit L)
        {
            bool answ;
            SqlCommand cmd = new SqlCommand("EscribirLog", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Fecha", L.Fecha);
            cmd.Parameters.AddWithValue("@Accion", L.Accion);
            cmd.Parameters.AddWithValue("@IdUsuario", L._usuario.Id);
            cmd.ExecuteNonQuery();
            answ = true;
            Conexion.Close();
            Conexion.Dispose();
            return answ;
        }

        public List<Audit> ListarLog(int idUsuario, DateTime fecha1, DateTime fecha2, string texto)
        {
            SqlCommand cmd = new SqlCommand("VW_Log", Conexion);
            var List = new List<Audit>();
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@Fecha1", fecha1);
            cmd.Parameters.AddWithValue("@Fecha2", fecha2);
            cmd.Parameters.AddWithValue("@Texto", texto);
            var rdr = cmd.ExecuteReader();
            while (rdr != null && rdr.Read())
            {
                var reg = new Audit();
                reg.Fecha = (DateTime)rdr["FechaAccion"];
                reg.Nick = (string)rdr["Usuario"];
                reg.Accion = (string)rdr["Accion"];
                List.Add(reg);

            }
            Conexion.Close();
            Conexion.Dispose();
            return List;
        }
    }
}


