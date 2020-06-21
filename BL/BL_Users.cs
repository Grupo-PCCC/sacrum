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
    public class BL_Users
    {

        DAL_Users objDato = new DAL_Users();

        public List<EN_Users> ListandoUsers(string buscar)
        {
            return objDato.ListarUsers(buscar);
        }
    }
}