using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using EN;
using DAL;


namespace BL
{
    public class BL_Usuario
    {

        DAL_Usuario objDato = new DAL_Usuario();

        public List<EN_Usuario> ListandoUsers(string buscar)
        {
            return objDato.ListarUsers(buscar);
        }

        public List<EN_Usuario> ListaTotal()
        {
            return objDato.ListaTotal();
        }


        DAL_Usuario DAL_Usuario = new DAL_Usuario();
        public int Insertar(EN_Usuario usuario)
        {
            int res = 0;
            if (usuario.Id == 0)
            {
                res = DAL_Usuario.Insertar(usuario);
            }
            else
            {
                res = DAL_Usuario.Editar(usuario);
            }
            return res;
        }


        public int Borrar(EN_Usuario usuario)
        {
            return DAL_Usuario.Borrar(usuario);
        }


    }
}