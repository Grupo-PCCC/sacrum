using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace EN
{
 
    public class EN_Usuario
    {
        public int Id { get; set; }
        public string Nick { get; set; }
        public string Contraseña { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string TipoUsuario { get; set; }

        public int IdTU { get; set; }

        public string NombreTU { get; set; }

        public EN_TipoUsuario _tipoUsuario;

       public EN_Usuario()
        {
            _tipoUsuario = new EN_TipoUsuario();
        }
    }
    


        
}
