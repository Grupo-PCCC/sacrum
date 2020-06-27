using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EN
{
    public class EN_TelefonoFeligres
    {
        public int IdPHP1;
        public int IdPHP2;
        public string Numero1 { get; set; }
        public string Numero2 { get; set; }
        public EN_TipoTelefono _tipoTelefono;


        public EN_TelefonoFeligres()
        {
            _tipoTelefono = new EN_TipoTelefono();
        }

    }
}
