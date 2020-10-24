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
    public class DAL_Entidad
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public int UltimoIdEntidad()
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            int id = Convert.ToInt32(acceso.Scalar("UltimoIdEntidad", parameters));

            return id;

        }


        public List<EN_Feligres> EntidadId(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", idEncontrado));
            DataTable tabla = acceso.Leer("BuscarEntidadId", parameters);
            List<EN_Feligres> Feligres_ID = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();
                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.CodigoInterno = (registro["Codigo Interno"].ToString());
                feligres.Nombre = (registro["Nombre"].ToString());
                feligres.Apellido = (registro["Apellido"].ToString());
                feligres.FechaNacimiento = Convert.ToDateTime(registro["Fecha de nacimiento"].ToString());
                feligres.TDoc = (registro["Tipo de documento"].ToString());
                feligres.Documento = (registro["Documento"].ToString());
                feligres.Telefono = (registro["Telefono"] is DBNull ? "" : registro["Telefono"]).ToString();
                feligres.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                feligres.Direccion = (registro["Direccion"] is DBNull ? "" : registro["Direccion"].ToString());
                feligres.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                feligres.Vivo = int.Parse(registro["Vivo"].ToString());
                feligres.IdEntidad = int.Parse(registro["IdEntidad"].ToString());
                feligres.EsContacto = int.Parse(registro["EsContacto"].ToString());
                Feligres_ID.Add(feligres);
            }

            return Feligres_ID;
        }




    }
}
