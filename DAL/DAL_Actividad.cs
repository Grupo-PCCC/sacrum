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
    public class DAL_Actividad
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_Actividad> Listar(string Nombre)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", Nombre));

            DataTable tabla = acceso.Leer("VW_Actividades", parameters);
            List<EN_Actividad> actividadd = new List<EN_Actividad>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Actividad actividad = new EN_Actividad();
                EN_TipoDocumento TD = new EN_TipoDocumento();
                actividad.Id = int.Parse(registro["Id"].ToString());
                actividad.Nombre = (registro["Nombre"].ToString());
                actividad.Observaciones = (registro["Observacion"] is DBNull ? "" : registro["Observacion"].ToString());
                actividadd.Add(actividad);
            }

            return actividadd;
        }

        public int Insertar(EN_Actividad actividad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@Nombre", actividad.Nombre));
            parameters.Add(acceso.CrearParametro("@Observacion", actividad.Observaciones));

            return acceso.Escribir("NuevaActividad", parameters);


        }

        public int Editar(EN_Actividad actividad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", actividad.Nombre));
            parameters.Add(acceso.CrearParametro("@Observacion", actividad.Observaciones));
            

            return acceso.Escribir("ModificarActividad", parameters);
        }

        public int Baja(EN_Actividad actividad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", actividad.Id));

            return acceso.Escribir("BorrarActividad", parameters);
        }

        public bool ValidarActividad(EN_Actividad actividad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", actividad.Nombre));

            return acceso.Reader("ValidarActividad", parameters);
        }

        public List<EN_Actividad> ListaTotal()
        {

            DataTable Tabla = acceso.Leer("ListarActividades", null);
            List<EN_Actividad> lista = new List<EN_Actividad>();

            foreach (DataRow registro in Tabla.Rows)
            {
                EN_Actividad actividad = new EN_Actividad();

                actividad.Id = int.Parse(registro["Id"].ToString());
                actividad.Nombre = (registro["Nombre"].ToString());
                lista.Add(actividad);

            }
            return lista;


        }
    }
}