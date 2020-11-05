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
    public class DAL_Proveedor
    {

        private DAL_Acceso acceso = new DAL_Acceso();
        public List<EN_Proveedor> Listar(string RazonSocial, int Estado)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@RazonSocial", RazonSocial));
            parameters.Add(acceso.CrearParametro("@Estado", Estado));

            DataTable tabla = acceso.Leer("VW_Proveedores", parameters);
            List<EN_Proveedor> proveedorr = new List<EN_Proveedor>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Proveedor proveedor = new EN_Proveedor();
                proveedor.Id = int.Parse(registro["Id"].ToString());
                proveedor.CodigoInterno = (registro["Codigo Interno"].ToString());
                proveedor.RazonSocial = (registro["RazonSocial"].ToString());
                proveedor.Telefono = (registro["Telefono"] is DBNull ? "" : registro["Telefono"]).ToString();
                proveedor.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                proveedor.Direccion = (registro["Direccion"] is DBNull ? "" : registro["Direccion"].ToString());
                proveedor.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                proveedor.IdEntidad = int.Parse(registro["IdEntidad"].ToString());
                proveedorr.Add(proveedor);
            }

            return proveedorr;
        }

        public int Insertar(EN_Proveedor proveedor)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            parameters.Add(acceso.CrearParametro("@Nombre", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Apellido", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaNacimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoDocumento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Documento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Vivo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@EsContacto", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaFallecimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaIngresoCinerario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contribuyo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdMovimientoMonetario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@RazonSocial", proveedor.RazonSocial));
            parameters.Add(acceso.CrearParametro("@Nick", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contrasenia", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", DBNull.Value.ToString())); ; ;
            parameters.Add(acceso.CrearParametro("@Observaciones", proveedor.Observaciones));
            parameters.Add(acceso.CrearParametro("@IdTipoEntidad", proveedor.IdTipoEntidad));
            parameters.Add(acceso.CrearParametro("@Tabla", proveedor.Tabla));


            return acceso.Escribir("NuevaEntidad", parameters);


        }

        public int Editar(EN_Proveedor proveedor)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@Nombre", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Apellido", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaNacimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoDocumento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Documento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Vivo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@EsContacto", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaFallecimiento", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@FechaIngresoCinerario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contribuyo", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdMovimientoMonetario", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@RazonSocial", proveedor.RazonSocial));
            parameters.Add(acceso.CrearParametro("@Nick", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@Contrasenia", DBNull.Value.ToString())); ;
            parameters.Add(acceso.CrearParametro("@IdTipoUsuario", DBNull.Value.ToString())); ; ;
            parameters.Add(acceso.CrearParametro("@Observaciones", proveedor.Observaciones));
            parameters.Add(acceso.CrearParametro("@IdTipoEntidad", proveedor.IdTipoEntidad));
            parameters.Add(acceso.CrearParametro("@Tabla", proveedor.Tabla));
            parameters.Add(acceso.CrearParametro("@IdEntidad", proveedor.IdEntidad));


            return acceso.Escribir("ModificarEntidad", parameters);
        }

        public int Baja(EN_Proveedor proveedor)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", proveedor.IdEntidad));
            parameters.Add(acceso.CrearParametro("@Estado", proveedor.Estado));

            return acceso.Escribir("CambiarEstadoEntidad", parameters);
        }


        
        public List<EN_Proveedor> ProveedorId(int Id)

        {
            int idEncontrado = Id;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(acceso.CrearParametro("@IdEntidad", idEncontrado));
            DataTable tabla = acceso.Leer("BuscarEntidadIdProveedor", parameters);
            List<EN_Proveedor> proveedor_ID = new List<EN_Proveedor>();

            foreach (DataRow registro in tabla.Rows)
            {
                EN_Proveedor proveedor = new EN_Proveedor();
                proveedor.Id = int.Parse(registro["Id"].ToString());
                proveedor.CodigoInterno = (registro["Codigo Interno"].ToString());
                proveedor.RazonSocial = (registro["RazonSocial"].ToString());
                proveedor.IdTelefono= int.Parse((registro["IdTel"].ToString()));
                proveedor.Telefono = (registro["Telefono"] is DBNull ? "" : registro["Telefono"]).ToString();
                proveedor.IdMail= int.Parse(registro["IdMail"].ToString());
                proveedor.Mail = (registro["Mail"] is DBNull ? "" : registro["Mail"].ToString());
                proveedor.IdDireccion= int.Parse(registro["IdDir"].ToString());
                proveedor.Direccion = (registro["Direccion"] is DBNull ? "" : registro["Direccion"].ToString());
                proveedor.Observaciones = (registro["Observaciones"] is DBNull ? "" : registro["Observaciones"].ToString());
                proveedor.IdEntidad = int.Parse(registro["IdEntidad"].ToString());proveedor_ID.Add(proveedor);
            }

            return proveedor_ID;
        }
        

    }


}