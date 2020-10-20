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

            DataTable tabla = acceso.Leer("VW_Feligreses", parameters);
            List<EN_Feligres> feligress = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();
                EN_TipoDocumento TD = new EN_TipoDocumento();
                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.CodigoInterno = (registro["Codigo Interno"].ToString());
                feligres.Nombre = (registro["Nombre"].ToString());
                feligres.Apellido = (registro["Apellido"].ToString());
                feligres.FechaNacimiento = Convert.ToDateTime(registro["Fecha de nacimiento"].ToString());
                feligres.TDoc = (registro["Tipo de documento"].ToString());
                feligres.Documento = (registro["Documento"].ToString());
                feligres.Telefono = (registro["Telefono"] is DBNull ? "" : registro["Telefono"]).ToString();
                feligres.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                feligres.Direccion = (registro["Direccion"] is DBNull ? "" : registro["Direccion"].ToString());
                feligres.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                feligres.Vivo = int.Parse(registro["Vivo"].ToString());
                feligres.IdEntidad = int.Parse(registro["IdEntidad"].ToString());
                feligres.EsContacto = int.Parse(registro["EsContacto"].ToString());
                feligress.Add(feligres);
            }

            return feligress;
        }

        public int Insertar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@Nombre", feligres.Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", feligres.Apellido));
            parameters.Add(acceso.CrearParametro("@FechaNacimiento", feligres.FechaNacimiento));
            parameters.Add(acceso.CrearParametro("@IdTipoDocumento", feligres.TDoc));
            parameters.Add(acceso.CrearParametro("@Documento", feligres.Documento));
            parameters.Add(acceso.CrearParametro("@Vivo", feligres.Vivo));
            parameters.Add(acceso.CrearParametro("@EsContacto", feligres.EsContacto));
            parameters.Add(acceso.CrearParametro("@FechaFallecimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaIngresoCinerario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contribuyo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdMovimientoMonetario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@RazonSocial", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Nick", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contrasenia", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", DBNull.Value.ToString())); ; ;
            parameters.Add(acceso.CrearParametro("@Observaciones", feligres.Observaciones));
            parameters.Add(acceso.CrearParametro("@IdTipoEntidad", feligres.IdTipoEntidad));
            parameters.Add(acceso.CrearParametro("@Tabla", feligres.Tabla));


            return acceso.Escribir("NuevaEntidad", parameters);


        }

        public int Editar(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", feligres.Nombre));
            parameters.Add(acceso.CrearParametro("@Apellido", feligres.Apellido));
            parameters.Add(acceso.CrearParametro("@FechaNacimiento", feligres.FechaNacimiento));
            parameters.Add(acceso.CrearParametro("@IdTipoDocumento", feligres.TDoc));
            parameters.Add(acceso.CrearParametro("@Documento", feligres.Documento));
            parameters.Add(acceso.CrearParametro("@Vivo", feligres.Vivo));
            parameters.Add(acceso.CrearParametro("@EsContacto", feligres.EsContacto));
            parameters.Add(acceso.CrearParametro("@FechaFallecimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaIngresoCinerario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contribuyo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdMovimientoMonetario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@RazonSocial", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Nick", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contrasenia", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", DBNull.Value.ToString())); ; ;
            parameters.Add(acceso.CrearParametro("@Observaciones", feligres.Observaciones));
            parameters.Add(acceso.CrearParametro("@IdTipoEntidad", feligres.IdTipoEntidad));
            parameters.Add(acceso.CrearParametro("@Tabla", feligres.Tabla));
            parameters.Add(acceso.CrearParametro("@IdEntidad", feligres.IdEntidad));


            return acceso.Escribir("ModificarEntidad", parameters);
        }

        public int Baja(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", feligres.IdEntidad));
            parameters.Add(acceso.CrearParametro("@Estado", feligres.Estado));

            return acceso.Escribir("CambiarEstadoEntidad", parameters);
        }



        public List<EN_Feligres> FeligresId(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", idEncontrado));
            DataTable tabla = acceso.Leer("BuscarEntidadId", parameters);
            List<EN_Feligres> Feligres_ID = new List<EN_Feligres>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Feligres feligres = new EN_Feligres();
                feligres.Id = int.Parse(registro["Id"].ToString());
                feligres.CodigoInterno = (registro["Codigo Interno"].ToString());
                feligres.Nombre = (registro["Nombre"].ToString());
                feligres.Apellido = (registro["Apellido"].ToString());
                feligres.FechaNacimiento = Convert.ToDateTime(registro["Fecha de nacimiento"].ToString());
                feligres.TDoc = (registro["Tipo de documento"].ToString());
                feligres.Documento = (registro["Documento"].ToString());
                feligres.Telefono = (registro["Telefono"] is DBNull ? "" : registro["Telefono"]).ToString();
                feligres.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                feligres.Direccion = (registro["Direccion"] is DBNull ? "" : registro["Direccion"].ToString());
                feligres.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                feligres.Vivo = int.Parse(registro["Vivo"].ToString());
                feligres.IdEntidad = int.Parse(registro["IdEntidad"].ToString());
                feligres.EsContacto = int.Parse(registro["EsContacto"].ToString());
                Feligres_ID.Add(feligres);
            }

            return Feligres_ID;
        }

        public bool ValidarDocumento(EN_Feligres feligres)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Tabla", feligres.Tabla));
            parameters.Add(acceso.CrearParametro("@Documento", feligres.Documento));

            return acceso.Reader("ValidarDocumento", parameters);
        }

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

