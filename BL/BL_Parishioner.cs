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

        DAL_Parishioner DAL_Parishioner = new DAL_Parishioner();
        public int Grabar(EN_Parishioner parishioner)
        {
            int res = 0;
            if (parishioner.Id == 0)
            {
                res = DAL_Parishioner.Insertar(parishioner);
            }
            else
            {
                res = DAL_Parishioner.Editar(parishioner);
            }
            return res;
        }

        public int Borrar(EN_Parishioner parishioner)
        {
            return DAL_Parishioner.Borrar(parishioner);
        }

        public List<EN_Parishioner> Listar()
        {
            return DAL_Parishioner.Listar();
        }

        public List<EN_Parishioner> Listar(int id)
        {
            return DAL_Parishioner.ListarID(id);
        }
    }
}
