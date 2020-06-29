using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EN;



namespace COMMON
{
    public class Audit
    {

        SqlConnection Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);
        public int Id { get; set; }

        public EN_Usuario _users;
        public DateTime ActionDate { get; set; }

        public string Nick { get; set; }
        public string Action { get; set; }
        public Audit()
        {
            _users = new EN_Usuario();
        }

        public bool WriteLog(Audit L)
        {
            bool answ;
            SqlCommand cmd = new SqlCommand("WriteLog", Conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@UserId", L.Id);
            cmd.Parameters.AddWithValue("@ActionDate", L.ActionDate);
            cmd.Parameters.AddWithValue("@Action", L.Action);
            cmd.ExecuteNonQuery();
            answ = true;
            Conexion.Close();
            Conexion.Dispose();
            return answ;
        }


        public List<Audit> ListLogAll()
        {
            SqlCommand cmd = new SqlCommand("ListAllLog", Conexion);
            var List = new List<Audit>();
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            var rdr = cmd.ExecuteReader();
            while (rdr != null && rdr.Read())
            {
                var reg = new Audit();
                reg.ActionDate = (DateTime)rdr["ActionDate"];
                reg.Nick = (string)rdr["Usuario"];
                reg.Action = (string)rdr["Action"];
                List.Add(reg);

            }
            Conexion.Close();
            Conexion.Dispose();
            return List;
        }

        public List<Audit> ListarAccionNick(string Nick)
        {
            SqlCommand cmd = new SqlCommand("ListLogAction", Conexion);
            var List = new List<Audit>();
            cmd.CommandType = CommandType.StoredProcedure;
            Conexion.Open();
            cmd.Parameters.AddWithValue("@Nick", Nick);
            var rdr = cmd.ExecuteReader();
            while (rdr != null && rdr.Read())
            {
                var reg = new Audit();
                reg.ActionDate = (DateTime)rdr["ActionDate"];
                reg.Nick = (string)rdr["Usuario"];
                reg.Action = (string)rdr["Action"];
                List.Add(reg);

            }
            Conexion.Close();
            Conexion.Dispose();
            return List;
        }
    }
}


