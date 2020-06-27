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
    public class BL_Usuario
    {

        DAL_Usuario objDato = new DAL_Usuario();

        public List<EN_Usuario> ListandoUsers(string buscar)
        {
            return objDato.ListarUsers(buscar);
        }
    }
}