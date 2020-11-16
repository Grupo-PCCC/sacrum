using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using EN;
using DAL;

namespace BL
{
    public class BL_MovimientosMonetarios
    {
        DAL_MovimientosMonetarios DAL_MovimientosMonetarios = new DAL_MovimientosMonetarios();
        public List<EN_MovimientosMonetarios> Listar(DateTime fecha1, DateTime fecha2, float valor1, float valor2, int idTipoCategoria, int idCategoria, int idUsuario)
        {
            return DAL_MovimientosMonetarios.Listar(fecha1, fecha2, valor1, valor2, idTipoCategoria, idCategoria, idUsuario);
        }
    }
}