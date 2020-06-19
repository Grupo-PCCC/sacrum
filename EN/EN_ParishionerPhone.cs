using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EN
{
    public class EN_ParishionerPhone
    {
        public int IdPHP1;
        public int IdPHP2;
        public string NumberP { get; set; }
        public string NumberA { get; set; }
        public EN_PhoneType _phoneType;


        public EN_ParishionerPhone()
        {
            _phoneType = new EN_PhoneType();
        }

    }
}
