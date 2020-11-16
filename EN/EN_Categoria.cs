using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EN
{
    public class EN_Categoria
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public EN_TipoCategoria _IdTipoCategoria { get; set; }
        public EN_Categoria()
        {
            _IdTipoCategoria = new EN_TipoCategoria();

        }
    }
}
