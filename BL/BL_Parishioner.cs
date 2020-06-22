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

<<<<<<< HEAD
        public List <EN_Parishioner> ListandoParishioner(string buscar)
=======
        public List<EN_Parishioner> ListandoParishioner(string buscar)
>>>>>>> master
        {
            return objDato.ListarParishioner(buscar);
        }
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> master
