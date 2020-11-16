using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EN
{
    public class EN_MovimientosMonetarios
    {
        public int Id { get; set; }
        public float Valor { get; set; }
        public DateTime Fecha { get; set; }
        public string Observacion { get; set; }
        public EN_Usuario _Usuario { get; set; }
        public EN_Categoria _Categoria { get; set; }

        public string Nick { get; set; }
        
        public string Categoria { get; set; }
        public int  IdTipoCategoria { get; set; }
        public int IdUsuario { get; set; }
        public int IdCategoria { get; set; }
        public string TipoMovimiento { get; set; }
        public string TipoCategoria { get; set; }
        public EN_MovimientosMonetarios()
        {
            _Usuario = new EN_Usuario();
            _Categoria = new EN_Categoria();
        }
    }
}
