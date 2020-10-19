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
    }
}
