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
        public EN_Usuario _IdUsuario { get; set; }
        public EN_Categoria _IdCategoria { get; set; }
        public EN_MovimientosMonetarios()
        {
            _IdUsuario = new EN_Usuario();
            _IdCategoria = new EN_Categoria();
        }
    }
}
