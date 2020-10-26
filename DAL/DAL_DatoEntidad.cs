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
    public class DAL_DatoEntidad
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public int Insertar(EN_DatoEntidad datoEntidad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@IdEntidad", datoEntidad._Entidad.Id));
            parameters.Add(acceso.CrearParametro("@IdTipoDatoEntidad", datoEntidad._TipoDatoEntidad.Id));
            parameters.Add(acceso.CrearParametro("@NombreDato", datoEntidad.NombreDato));
            parameters.Add(acceso.CrearParametro("@Valor", datoEntidad.Valor));
            parameters.Add(acceso.CrearParametro("@Detalle", datoEntidad.Detalle));

            return acceso.Escribir("NuevoDatoEntidad", parameters);

        }

        public int Editar(EN_DatoEntidad datoEntidad)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", datoEntidad.Id));
            parameters.Add(acceso.CrearParametro("@Valor", datoEntidad.Valor));
            return acceso.Escribir("ModificarDatoEntidad", parameters);

        }
    }
}
