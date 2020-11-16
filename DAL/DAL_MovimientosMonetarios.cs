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
    public class DAL_MovimientosMonetarios
    {
        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_MovimientosMonetarios> Listar(DateTime fecha1, DateTime fecha2, float valor1, float valor2, int idTipoCategoria, int idCategoria, int idUsuario)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Fecha1", fecha1));
            parameters.Add(acceso.CrearParametro("@Fecha2", fecha2));
            parameters.Add(acceso.CrearParametro("@Precio1", Convert.ToString(valor1)));
            parameters.Add(acceso.CrearParametro("@Precio2", Convert.ToString(valor2)));
            parameters.Add(acceso.CrearParametro("@IdTipoCategoria", idTipoCategoria));
            parameters.Add(acceso.CrearParametro("@IdCategoria", idCategoria));
            parameters.Add(acceso.CrearParametro("@IdUsuario", idUsuario));

            DataTable tabla = acceso.Leer("VW_MovimientosMonetarios", parameters);
            List<EN_MovimientosMonetarios> movimientoss = new List<EN_MovimientosMonetarios>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_MovimientosMonetarios movimiento = new EN_MovimientosMonetarios();
                EN_TipoDocumento TD = new EN_TipoDocumento();
                movimiento.Id = int.Parse(registro["Id"].ToString());
                movimiento.Fecha = Convert.ToDateTime(registro["Fecha"].ToString());
                movimiento.Categoria = (registro["NombreCategoria"].ToString());
                movimiento.Valor = float.Parse(registro["Valor"].ToString());
                movimiento.TipoMovimiento = (registro["Tipo de movimiento"].ToString());
                movimiento.Nick = (registro["Usuario"].ToString());
                movimiento.IdCategoria = int.Parse(registro["IdCategoria"].ToString());
                movimiento.IdTipoCategoria = int.Parse(registro["IdTipoCategoria"].ToString());
                movimiento.IdUsuario = int.Parse(registro["IdUsuario"].ToString());
                movimientoss.Add(movimiento);
            }

            return movimientoss;
        }
    }
}
