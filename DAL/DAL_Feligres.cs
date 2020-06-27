﻿using System;
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
    public class DAL_Feligres
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_Feligres> ListarTodo()
        {
            DataTable tabla = acceso.Leer("ListParish", null);
            List<EN_Feligres> feligress = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();

                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.Nombre = (registro["Name"].ToString());
                feligres.Apellido = (registro["Surname"].ToString());
                feligres.FechaNac = Convert.ToDateTime(registro["BirthDate"].ToString());
                feligres.Numero1 = (registro["NumberP"].ToString());
                feligres.Numero2 = (registro["NumberA"].ToString());
                feligres.Observacion = (registro["Observation"].ToString());

                feligress.Add(feligres);
            }

            return feligress;
        }

        public int Insertar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Name", feligres.Nombre));
            parameters.Add(acceso.CrearParametro("@Surname", feligres.Apellido));
            parameters.Add(acceso.CrearParametro("@BirthDate", feligres.FechaNac));
            parameters.Add(acceso.CrearParametro("@Observation", feligres.Observacion));

            return acceso.Escribir("Newfeligres", parameters);


        }

        public int Editar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", feligres.Id));
            parameters.Add(acceso.CrearParametro("@Name", feligres.Nombre));
            parameters.Add(acceso.CrearParametro("@Surname", feligres.Apellido));
            parameters.Add(acceso.CrearParametro("@BirthDate", Convert.ToDateTime(feligres.FechaNac)));
            parameters.Add(acceso.CrearParametro("@Observation", feligres.Observacion));

            return acceso.Escribir("Updatefeligres", parameters);
        }

        public int Borrar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", feligres.Id));

            return acceso.Escribir("Deletefeligres", parameters);
        }



        public List<EN_Feligres> ListarID(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", idEncontrado));
            DataTable tabla = acceso.Leer("ListParishId", parameters);
            List<EN_Feligres> parishID = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();
                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.Nombre = (registro["Name"].ToString());
                feligres.Apellido = (registro["Surname"].ToString());
                feligres.FechaNac = Convert.ToDateTime(registro["BirthDate"].ToString());
                feligres.Numero1 = (registro["NumberP"].ToString());
                feligres.Numero2 = (registro["NumberA"].ToString());
                feligres.Observacion = (registro["Observation"].ToString());
                parishID.Add(feligres);
            }

            return parishID;

        }

    }
    //public EN_feligres Listar(int id)
    //{
    //    DataTable tabla = acceso.Leer("ListParish2", null);
    //    EN_feligres feligres = new EN_feligres();
    //    DataRow registro = tabla.Rows[0];

    //    feligres.Id = int.Parse(registro["Id"].ToString());
    //    feligres.Name = (registro["Name"].ToString());
    //    feligres.Surname = (registro["Surname"].ToString());
    //    feligres.BirthDate = Convert.ToDateTime(registro["BirthDate"].ToString());
    //    feligres.NumberP = (registro["NumberP"].ToString());
    //    feligres.NumberA = (registro["NumberA"].ToString());
    //    feligres.Observation = (registro["Observation"].ToString());

    //    return feligres;
    //}



}
