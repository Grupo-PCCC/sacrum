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
    public class BL_Parishioner
    {

        DAL_Parishioner objDato = new DAL_Parishioner();

        public List<EN_Parishioner> ListandoParishioner(string buscar)
        {
            return objDato.ListarParishioner(buscar);
        }
    }
}