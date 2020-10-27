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
    public class BL_Proveedor
    {

        DAL_Proveedor DAL_Proveedor = new DAL_Proveedor();
        public int Grabar(EN_Proveedor proveedor)
        {
            int res = 0;
            if (proveedor.Id == 0)
            {
                res = DAL_Proveedor.Insertar(proveedor);
            }
            else
            {
                res = DAL_Proveedor.Editar(proveedor);
            }
            return res;
        }

        public int Baja(EN_Proveedor proveedor)
        {
            return DAL_Proveedor.Baja(proveedor);
        }

        public List<EN_Proveedor> Listar(string RazonSocial, int Estado)
        {
            return DAL_Proveedor.Listar(RazonSocial, Estado);
        }

        public List<EN_Proveedor> ProveedorId(int Id)
        {
            return DAL_Proveedor.ProveedorId(Id);
        }
        

    }
}
