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
    public class BL_DatoEntidad
    {
        DAL_DatoEntidad DAL_DatoEntidad = new DAL_DatoEntidad();

        public int Insertar(EN_DatoEntidad datoEntidad)
        {
            int res = 0;
            res = DAL_DatoEntidad.Insertar(datoEntidad);
            return res;
        }
    }
}
