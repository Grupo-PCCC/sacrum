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
    public class BL_Login
    {
        DAL_Login objLogin = new DAL_Login();

        public bool LoginUser(string Nick, string Password)
        {
            return objLogin.Login(Nick,Password) ;
        }
    }
}
