using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EN
{
    public class EN_Proveedor
    {

        public int Id { get; set; }
        public string CodigoInterno { get; set; }
        public string RazonSocial { get; set; }
        public string Telefono { get; set; }
        public int IdTelefono { get; set; }
        public string Mail { get; set; }
        public int IdMail { get; set; }
        public string Direccion { get; set; }
        public int IdDireccion { get; set; }
        public string TDoc { get; set; }
        public string Observaciones { get; set; }
        public string Tabla { get; set; }
        public int IdEntidad { get; set; }
        public int IdTipoEntidad { get; set; }
        public int Estado { get; set; }

        public EN_TipoDocumento _TipoDocumento;
        public EN_Entidad _Entidad;
        public EN_DatoEntidad _DatoEntidad;
        public EN_Proveedor()
        {
            _TipoDocumento = new EN_TipoDocumento();
            _Entidad = new EN_Entidad();
            _DatoEntidad = new EN_DatoEntidad();

        }


    }


}
