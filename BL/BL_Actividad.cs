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
    public class BL_Actividad
    {

        DAL_Actividad DAL_Actividad = new DAL_Actividad();
        public int Grabar(EN_Actividad actividad)
        {
            int res = 0;
            if (actividad.Id == 0)
            {
                res = DAL_Actividad.Insertar(actividad);
            }
            else
            {
                res = DAL_Actividad.Editar(actividad);
            }
            return res;
        }

        public int Baja(EN_Actividad actividad)
        {
            return DAL_Actividad.Baja(actividad);
        }

        public List<EN_Actividad> Listar(string Nombre, string Apellido, DateTime Fecha1, DateTime Fecha2, string Actividad, int Vivo, int EsContacto, int Estado)
        {
            return DAL_Actividad.Listar(Nombre);
        }

        public bool ValidarActividad(EN_Actividad actividad)
        {
            return DAL_Actividad.ValidarActividad(actividad);
        }

        public List<EN_Actividad> ListaActividades()
        {
            return DAL_Actividad.ListaTotal();
        }
    }
}
