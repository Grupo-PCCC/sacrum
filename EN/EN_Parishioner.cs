using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EN
{
    public class EN_Parishioner
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime BirthDate { get; set; }
        public string NumberP { get; set; }
        public string NumberA { get; set; }
        public string Observation { get; set; }

        public EN_ParishionerPhone _parishionerPhone;

        //public EN_Parishioner()
        //{
        //    _parishionerPhone = new EN_ParishionerPhone();
        //}

    }
}
