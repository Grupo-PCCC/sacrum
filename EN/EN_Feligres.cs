using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EN
{
    public class EN_Feligres
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNac { get; set; }
        public string Numero1 { get; set; }
        public string Numero2 { get; set; }
        public string Observacion { get; set; }

        public EN_TelefonoFeligres _telefonoFeligres;

        //public EN_Parishioner()
        //{
        //    _parishionerPhone = new EN_ParishionerPhone();
        //}

    }
}
