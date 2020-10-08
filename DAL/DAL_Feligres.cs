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
    public class DAL_Feligres
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_Feligres> Listar(string Nombre, string Apellido, DateTime Fecha1, DateTime Fecha2, string Documento, int Vivo, int EsContacto, int Estado)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", Apellido));
            parameters.Add(acceso.CrearParametro("@Fecha1", Fecha1));
            parameters.Add(acceso.CrearParametro("@Fecha2", Fecha2));
            parameters.Add(acceso.CrearParametro("@Documento", Documento));
            parameters.Add(acceso.CrearParametro("@Vivo", Vivo));
            parameters.Add(acceso.CrearParametro("@EsContacto", EsContacto));
            parameters.Add(acceso.CrearParametro("@Estado", Estado));

            DataTable tabla = acceso.Leer("PFeligres", parameters);
            List<EN_Feligres> feligress = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();
                EN_TipoDocumento TDoc = new EN_TipoDocumento();
                EN_Entidad Entidad = new EN_Entidad();
                EN_DatoEntidad DatoEntidad = new EN_DatoEntidad();
                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.CodigoInterno = (registro["Código Interno"].ToString());
                feligres.Nombre = (registro["Nombre"].ToString());
                feligres.Apellido = (registro["Apellido"].ToString());
                feligres.FechaNacimiento = Convert.ToDateTime(registro["Fecha de nacimiento"].ToString());
                feligres._TipoDocumento.Nombre = (registro["Tipo de documento"].ToString());
                feligres._TipoDocumento.Id = int.Parse(registro["IdTipoDocumento"].ToString());
                feligres.Documento = (registro["Documento"].ToString());
                feligres._DatoEntidad.Telefono = (registro["Teléfono"] is DBNull ? "" : registro["Teléfono"]).ToString();
                feligres._DatoEntidad.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                feligres._DatoEntidad.Direccion = (registro["Dirección"] is DBNull ? "" : registro["Dirección"].ToString());
                feligres.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                feligres.Vivo = int.Parse(registro["Vivo"].ToString());
                feligres._Entidad.Id = int.Parse(registro["IdEntidad"].ToString());
                feligres.EsContacto = int.Parse(registro["EsContacto"].ToString());
                feligress.Add(feligres);
            }

            return feligress;
        }

        //public int Insertar(EN_Feligres feligres)
        //{
        //    List<SqlParameter> parameters = new List<SqlParameter>();
        //    parameters.Add(acceso.CrearParametro("@Name", feligres.Nombre));
        //    parameters.Add(acceso.CrearParametro("@Surname", feligres.Apellido));
        //    parameters.Add(acceso.CrearParametro("@BirthDate", feligres.FechaNac));
        //    parameters.Add(acceso.CrearParametro("@Observation", feligres.Observacion));

        //    return acceso.Escribir("NewParishioner", parameters);


        //}

        //public int Editar(EN_Feligres feligres)
        //{
        //    List<SqlParameter> parameters = new List<SqlParameter>();
        //    parameters.Add(acceso.CrearParametro("@Id", feligres.Id));
        //    parameters.Add(acceso.CrearParametro("@Name", feligres.Nombre));
        //    parameters.Add(acceso.CrearParametro("@Surname", feligres.Apellido));
        //    parameters.Add(acceso.CrearParametro("@BirthDate", Convert.ToDateTime(feligres.FechaNac)));
        //    parameters.Add(acceso.CrearParametro("@Observation", feligres.Observacion));

        //    return acceso.Escribir("UpdateParishioner", parameters);
        //}

        public int Borrar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Id", feligres.Id));

            return acceso.Escribir("DeleteParishioner", parameters);
        }



        //public List<EN_Feligres> ListarID(int Id)

        //{
        //    int idEncontrado = Id;
        //    List<SqlParameter> parameters = new List<SqlParameter>();
        //    parameters.Add(acceso.CrearParametro("@Id", idEncontrado));
        //    DataTable tabla = acceso.Leer("ListParishId", parameters);
        //    List<EN_Feligres> parishID = new List<EN_Feligres>();

        //    foreach (DataRow registro in tabla.Rows)
        //    {
        //        EN_Feligres feligres = new EN_Feligres();
        //        feligres.Id = int.Parse(registro["Id"].ToString());
        //        feligres.Nombre = (registro["Name"].ToString());
        //        feligres.Apellido = (registro["Surname"].ToString());
        //        feligres.FechaNac = Convert.ToDateTime(registro["BirthDate"].ToString());
        //        feligres.Numero1 = (registro["NumberP"].ToString());
        //        feligres.Numero2 = (registro["NumberA"].ToString());
        //        feligres.Observacion = (registro["Observation"].ToString());
        //        parishID.Add(feligres);
        //    }

        //    return parishID;

        //}
        //public List<EN_Feligres> ListarNombre(string Name)
        //{
        //    List<SqlParameter> parameters = new List<SqlParameter>();
        //    parameters.Add(acceso.CrearParametro("@Name", Name));
        //    DataTable tabla = acceso.Leer("ListParishName", parameters);
        //    List<EN_Feligres> feligress = new List<EN_Feligres>();

        //    foreach (DataRow registro in tabla.Rows)
        //    {
        //        EN_Feligres feligres = new EN_Feligres();

        //        feligres.Id = int.Parse(registro["Id"].ToString());
        //        feligres.Nombre = (registro["Name"].ToString());
        //        feligres.Apellido = (registro["Surname"].ToString());
        //        feligres.FechaNac = Convert.ToDateTime(registro["BirthDate"].ToString());
        //        feligres.Numero1 = (registro["NumberP"].ToString());
        //        feligres.Numero2 = (registro["NumberA"].ToString());
        //        feligres.Observacion = (registro["Observation"].ToString());

        //        feligress.Add(feligres);
        //    }

        //    return feligress;
        //}

    }


}

