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
    public class BL_Entidad
    {
        DAL_Entidad DAL_Entidad = new DAL_Entidad();

        public int UltimoIdEntidad()
        {
            return DAL_Entidad.UltimoIdEntidad();
        }
        /*
        public List<EN_Entidad> EntidadId(int Id)
        {
            return DAL_Entidad.EntidadId(Id);
        }
        */

    }
}
