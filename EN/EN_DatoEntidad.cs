using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EN
{
    public class EN_DatoEntidad
    {
        public int Id { get; set; }
        public string NombreDato { get; set; }
        public string Valor { get; set; }
        public string Detalle { get; set; }
        public string Telefono { get; set; }
        public string Mail { get; set; }
        public string Direccion { get; set; }
        
        public EN_Entidad _Entidad;

        public EN_TipoDatoEntidad _TipoDatoEntidad;

        public EN_DatoEntidad()
        {
            _Entidad = new EN_Entidad();
            _TipoDatoEntidad = new EN_TipoDatoEntidad();

        }





    }
}
