using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EN;

namespace DAL
{
    public class DAL_Parishioner
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_Parishioner> ListarTodo()
        {
            DataTable tabla = acceso.Leer("ListParish", null);
            List<EN_Parishioner> parishioners = new List<EN_Parishioner>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Parishioner parishioner = new EN_Parishioner();

                parishioner.Id = int.Parse(registro["Id"].ToString());
                parishioner.Name = (registro["Name"].ToString());
                parishioner.Surname = (registro["Surname"].ToString());
                parishioner.BirthDate = Convert.ToDateTime(registro["BirthDate"].ToString());
                parishioner.NumberP = (registro["NumberP"].ToString());
                parishioner.NumberA = (registro["NumberA"].ToString());
                parishioner.Observation = (registro["Observation"].ToString());

                parishioners.Add(parishioner);
            }

            return parishioners;
        }

        public int Insertar(EN_Parishioner parishioner)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Name", parishioner.Name));
            parameters.Add(acceso.CrearParametro("@Surname", parishioner.Surname));
            parameters.Add(acceso.CrearParametro("@BirthDate", parishioner.BirthDate));
            parameters.Add(acceso.CrearParametro("@Observation", parishioner.Observation));

            return acceso.Escribir("NewParishioner", parameters);


        }

        public int Editar(EN_Parishioner parishioner)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", parishioner.Id));
            parameters.Add(acceso.CrearParametro("@Name", parishioner.Name));
            parameters.Add(acceso.CrearParametro("@Surname", parishioner.Surname));
            parameters.Add(acceso.CrearParametro("@BirthDate", Convert.ToDateTime(parishioner.BirthDate).ToString()));
            parameters.Add(acceso.CrearParametro("@Observation", parishioner.Observation));

            return acceso.Escribir("UpdateParishioner", parameters);
        }

        public int Borrar(EN_Parishioner parishioner)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", parishioner.Id));

            return acceso.Escribir("DeleteParishioner", parameters);
        }



        public List<EN_Parishioner> ListarID(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", idEncontrado));
            DataTable tabla = acceso.Leer("ListParishId", parameters);
            List<EN_Parishioner> parishID = new List<EN_Parishioner>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Parishioner parishioner = new EN_Parishioner();
                parishioner.Id = int.Parse(registro["Id"].ToString());
                parishioner.Name = (registro["Name"].ToString());
                parishioner.Surname = (registro["Surname"].ToString());
                parishioner.BirthDate = Convert.ToDateTime(registro["BirthDate"].ToString());
                parishioner.NumberP = (registro["NumberP"].ToString());
                parishioner.NumberA = (registro["NumberA"].ToString());
                parishioner.Observation = (registro["Observation"].ToString());
                parishID.Add(parishioner);
            }

            return parishID;

        }

    }
    //public EN_Parishioner Listar(int id)
    //{
    //    DataTable tabla = acceso.Leer("ListParish2", null);
    //    EN_Parishioner parishioner = new EN_Parishioner();
    //    DataRow registro = tabla.Rows[0];

    //    parishioner.Id = int.Parse(registro["Id"].ToString());
    //    parishioner.Name = (registro["Name"].ToString());
    //    parishioner.Surname = (registro["Surname"].ToString());
    //    parishioner.BirthDate = Convert.ToDateTime(registro["BirthDate"].ToString());
    //    parishioner.NumberP = (registro["NumberP"].ToString());
    //    parishioner.NumberA = (registro["NumberA"].ToString());
    //    parishioner.Observation = (registro["Observation"].ToString());

    //    return parishioner;
    //}



}

