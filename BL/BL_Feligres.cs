﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using EN;
using DAL;


namespace BL
{
    public class BL_Feligres
    {

        DAL_Feligres DAL_Feligres = new DAL_Feligres();
        public int Grabar(EN_Feligres feligres)
        {
            int res = 0;
            if (feligres.Id == 0)
            {
                res = DAL_Feligres.Insertar(feligres);
            }
            else
            {
                res = DAL_Feligres.Editar(feligres);
            }
            return res;
        }

        public int Borrar(EN_Feligres feligres)
        {
            return DAL_Feligres.Borrar(feligres);
        }

        public List<EN_Feligres> ListarTodo()
        {
            return DAL_Feligres.ListarTodo();
        }

        public List<EN_Feligres> ListarID(int Id)
        {
            return DAL_Feligres.ListarID(Id);
        }
    }
}