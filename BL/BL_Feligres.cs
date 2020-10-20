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

        public int Baja(EN_Feligres feligres)
        {
            return DAL_Feligres.Baja(feligres);
        }

        public List<EN_Feligres> Listar(string Nombre, string Apellido, DateTime Fecha1, DateTime Fecha2, string Documento, int Vivo, int EsContacto, int Estado)
        {
            return DAL_Feligres.Listar(Nombre, Apellido, Fecha1, Fecha2, Documento, Vivo, EsContacto, Estado);
        }

        public List<EN_Feligres> FeligresId(int Id)
        {
            return DAL_Feligres.FeligresId(Id);
        }
         
        public bool ValidarDocumento (EN_Feligres feligres)
        {
            return DAL_Feligres.ValidarDocumento(feligres);
        }
     
    }
}
