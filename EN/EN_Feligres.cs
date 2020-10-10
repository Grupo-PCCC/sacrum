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
        public string CodigoInterno { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string  Documento { get; set; }
         
        public string Telefono { get; set; }

        public string Mail { get; set; }

        public string Direccion { get; set; }
        public string TDoc { get; set; }
        public string Observaciones { get; set; }
        public int Vivo { get; set; }

        public string Tabla { get; set; }

        public int IdEntidad { get; set; }
        public int EsContacto { get; set; }

        public EN_TipoDocumento _TipoDocumento;
        public EN_Entidad _Entidad;
        public EN_DatoEntidad _DatoEntidad;
        public EN_Feligres()
        {
            _TipoDocumento = new EN_TipoDocumento();
            _Entidad = new EN_Entidad();
            _DatoEntidad = new EN_DatoEntidad();

        }
        
       
    }
 
    
}
