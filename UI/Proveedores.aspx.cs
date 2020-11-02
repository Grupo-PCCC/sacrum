using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EN;
using BL;
using COMMON;


namespace UI
{
    public partial class Proveedores : System.Web.UI.Page
    {
        BL_Proveedor BL_Proveedor = new BL_Proveedor();
        BL_Entidad BL_Entidad = new BL_Entidad();
        BL_DatoEntidad BL_DatoEntidad = new BL_DatoEntidad();
        Audit L = new Audit();
        int flag = 0;
        int FlagIDEntidad;
        int IDEntidad;
        int EntidadID;

        private static class Variables
        {
            public static int IdDir;
            public static int IdTel;
            public static int IdMail;
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            Enlazar();


            VerificarSesion();

            if (!IsPostBack)

            {

                this.Form.Attributes.Add("autocomplete", "off");

            }
        }
        private void VerificarSesion()
        {

            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

        }



        public void Enlazar()
        {
            string RazonSocial = txtRazonSocialBuscar.Text.Trim().ToString();
            int Estado = 1;
            dgvProveedor.DataSource = BL_Proveedor.Listar(RazonSocial, Estado);
            dgvProveedor.DataBind();

            lblResultado.Text = "Registros: " + Convert.ToString(dgvProveedor.Rows.Count);
        }


        protected void btnGrabar_Click(object sender, EventArgs e)

        {

            FlagIDEntidad = 0;
            flag = 0;
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
                FlagIDEntidad = 0;

            }
            else
            {
                FlagIDEntidad = 1;
                IDEntidad = Convert.ToInt32(hid.Value);
            }


            if (txtRazonSocial.Text == "")
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el proveedor", "alert('Debe ingresar una Razón Social para guardar el proveedor')", true);
            }

            else
            {
                flag = 0;
            }

            if (txtRazonSocial.Text == "" && flag == 0)
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el proveedor", "alert('Debe ingresar una Razón Social para guardar el proveedor')", true);
            }

            if (flag == 0)
            {
                string Tabla = "Proveedor";
                EN_Proveedor Proveedor = new EN_Proveedor();
                Audit L = new Audit();
                Proveedor.Id = int.Parse(hid.Value);
                Proveedor.RazonSocial = txtRazonSocial.Text.ToString();
                Proveedor.Observaciones = txtObservaciones.Text.ToString();
                Proveedor.IdTipoEntidad = 2;
                Proveedor.Tabla = Tabla;
                int IdEntidad = Convert.ToInt32(hid.Value);
                if (IdEntidad != 0)
                {

                    List<EN_Proveedor> EditarProveedor = BL_Proveedor.ProveedorId(IdEntidad);
                    var ProveedorId = EditarProveedor[0];
                    Proveedor.IdEntidad = ProveedorId.IdEntidad;
                }
                BL_Proveedor.Grabar(Proveedor);
                int idInsertado = BL_Entidad.UltimoIdEntidad();
                L.Accion = "El usuario " + LoginCache.Nick + " registró el proveedor " + txtRazonSocial.Text;
                L.Fecha = DateTime.Now;
                L._usuario.Id = LoginCache.Id;
                L.EscribirLog(L);

                void NuevoDatoEntidad(int IdTipoDatoEntidad, string NombreDato, string Valor)
                {
                    EN_DatoEntidad nuevoDato = new EN_DatoEntidad();
                    nuevoDato._Entidad.Id = IdTipoDatoEntidad;
                    nuevoDato._TipoDatoEntidad.Id = 1;
                    nuevoDato.NombreDato = NombreDato;
                    nuevoDato.Valor = Valor;
                    nuevoDato.Detalle = "";
                    BL_DatoEntidad.Insertar(nuevoDato);
                }
                void EditarDatoEntidad(int IdDatoEntidad, string Valor)
                {
                    EN_DatoEntidad EditarDato = new EN_DatoEntidad();
                    EditarDato.Id = IdDatoEntidad;
                    EditarDato.Valor = Valor;
                    BL_DatoEntidad.Editar(EditarDato);
                }
                if (FlagIDEntidad == 1)
                {


                    if (txtDireccion.Text != "")
                    {
                        if (Variables.IdDir == 0)
                        {
                            NuevoDatoEntidad(int.Parse(hid.Value), "dire", txtDireccion.Text);
                        }
                        else
                        {
                            EditarDatoEntidad(Variables.IdDir, txtDireccion.Text);
                        }

                    }
                    if (txtMail.Text != "")
                    {

                        if (Variables.IdMail == 0)
                        {
                            NuevoDatoEntidad(int.Parse(hid.Value), "mail", txtMail.Text);
                        }
                        else
                        {
                            EditarDatoEntidad(Variables.IdMail, txtMail.Text);
                        }
                    }
                    if (txtTelefono.Text != "")
                    {
                        if (Variables.IdTel == 0)
                        {
                            NuevoDatoEntidad(int.Parse(hid.Value), "tel", txtTelefono.Text);
                        }
                        else
                        {
                            EditarDatoEntidad(Variables.IdTel, txtTelefono.Text);
                        }
                    }

                }
                if (FlagIDEntidad == 0)
                {
                    if (txtDireccion.Text != "")
                    {

                        NuevoDatoEntidad(idInsertado, "dire", txtDireccion.Text);
                    }
                    if (txtMail.Text != "")
                    {
                        NuevoDatoEntidad(idInsertado, "mail", txtMail.Text);
                    }
                    if (txtTelefono.Text != "")
                    {

                        NuevoDatoEntidad(idInsertado, "tel", txtTelefono.Text);
                    }

                }

                hid.Value = "0";
                txtRazonSocial.Text = "";
                txtObservaciones.Text = "";
                txtDireccion.Text = "";
                txtMail.Text = "";
                txtTelefono.Text = "";
                FlagIDEntidad = 0;

                Enlazar();
                lblResultado.Text = "Registros: " + Convert.ToString(dgvProveedor.Rows.Count);
            }

        }

        protected void ViewProveedor_RowCommand1(object sender, GridViewCommandEventArgs e)
        {


            int Id = int.Parse(dgvProveedor.DataKeys[int.Parse(e.CommandArgument.ToString())].Value.ToString());
            List<EN_Proveedor> EditarProveedor = BL_Proveedor.ProveedorId(Id);
            var ProveedorId = EditarProveedor[0];

            switch (e.CommandName)
            {
                case "Borrar":
                    {

                        ProveedorId.Estado = 0;
                        ProveedorId.IdEntidad = Id;
                        BL_Proveedor.Baja(ProveedorId);
                        Enlazar();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvProveedor.Rows.Count);
                        break;

                    }
                case "Seleccionar":
                    {
                        hid.Value = ProveedorId.IdEntidad.ToString();
                        EntidadID = ProveedorId.Id;
                        txtRazonSocial.Text = ProveedorId.RazonSocial;
                        txtObservaciones.Text = ProveedorId.Observaciones;
                        txtTelefono.Text = ProveedorId.Telefono;
                        Variables.IdTel = ProveedorId.IdTelefono;
                        txtDireccion.Text = ProveedorId.Direccion;
                        Variables.IdDir = ProveedorId.IdDireccion;
                        txtMail.Text = ProveedorId.Mail;
                        Variables.IdMail = ProveedorId.IdMail;
                        ModalPopupExtender1.Show();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvProveedor.Rows.Count);
                        break;
                    }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            txtRazonSocial.Text = string.Empty;
            ModalPopupExtender1.Show();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            txtRazonSocial.Text = string.Empty;
            txtObservaciones.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtMail.Text = string.Empty;
            ModalPopupExtender1.Dispose();
            ModalPopupExtender1.Hide();
        }

        protected void dgvProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProveedor.PageIndex = e.NewPageIndex;
            Enlazar();
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}