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
    public partial class Parishioner : System.Web.UI.Page
    {
        BL_Feligres BL_Feligres = new BL_Feligres();
        BL_Entidad BL_Entidad = new BL_Entidad();
        BL_DatoEntidad BL_DatoEntidad = new BL_DatoEntidad();
        Audit L = new Audit();
        int flag = 0;
        bool documentoInvalido = true;
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
            string Nombre = txtNombreBuscar.Text.Trim().ToString();
            string Apellido = txtApellidoBuscar.Text.Trim().ToString();
            DateTime Fecha1;
            DateTime Fecha2;
            if (dateInicio.Text == "")
            {
                Fecha1 = Convert.ToDateTime("01-01-1900");
            }
            else
            {
                Fecha1 = Convert.ToDateTime(dateInicio.Text);
            }
            if (dateFin.Text == "")
            {
                Fecha2 = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            }
            else
            {
                Fecha2 = Convert.ToDateTime(dateFin.Text);
            }

            string Documento = txtDocumentoBuscar.Text.Trim().ToString();
            int Vivo = 1;
            int EsContacto = 0;
            int Estado = 1;
            dgvFeligres.DataSource = BL_Feligres.Listar(Nombre, Apellido, Fecha1, Fecha2, Documento, Vivo, EsContacto, Estado);
            dgvFeligres.DataBind();

            lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
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


            if (txtNombre.Text == "" && txtApellido.Text == "" && txtDocumento.Text == "")
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el feligrés", "alert('Debe ingresar un Nombre, Apellido y Documento para guardar el feligrés')", true);
            }

            else
            {
                flag = 0;
            }

            if (txtNombre.Text == "" && flag == 0)
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el feligrés", "alert('Debe ingresar un Nombre para guardar el feligrés')", true);
            }

            if (txtApellido.Text == "" && flag == 0)
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el feligrés", "alert('Debe ingresar un Apellido para guardar el feligrés')", true);
            }

            if (txtDocumento.Text == "" && flag == 0)
            {
                flag = 1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Debe ingresar un Nombre, Apellido y Documento para guardar el feligrés", "alert('Debe ingresar un Documento para guardar el feligrés')", true);
            }

            if (FlagIDEntidad == 0 & flag == 0 && txtDocumento.Text != "")
            {

                EN_Feligres documentoIngresado = new EN_Feligres();
                documentoIngresado.Documento = txtDocumento.Text;
                documentoIngresado.Tabla = "Feligres";
                documentoInvalido = BL_Feligres.ValidarDocumento(documentoIngresado);
                if (documentoInvalido == false)
                {
                    flag = 0;
                }
                else
                {
                    flag = 1;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "El documento ingresado pertenece a un feligrés existente", "alert('El documento ingresado pertenece a un feligrés existente')", true);
                }

            }



            //validar documento con SP ValidarDocumento. Recibe como parametro la tabla (feligres o fallecido) y el documento.
            //el metodo recibe un string y hace execute reader

            if (flag == 0)
            {
                string Tabla = "Feligres";
                EN_Feligres Feligres = new EN_Feligres();
                Audit L = new Audit();
                Feligres.Id = int.Parse(hid.Value);
                Feligres.Nombre = txtNombre.Text.ToString();
                Feligres.Apellido = txtApellido.Text.ToString();
                Feligres.FechaNacimiento = Convert.ToDateTime(txtFechaNac.Text);
                Feligres.TDoc = LstTDoc.SelectedValue;
                Feligres.Documento = txtDocumento.Text.ToString();
                Feligres.Observaciones = txtObservaciones.Text.ToString();
                Feligres.Vivo = 1;
                Feligres.EsContacto = 0;
                Feligres.IdTipoEntidad = 1;
                Feligres.Tabla = Tabla;
                int IdEntidad = Convert.ToInt32(hid.Value);
                if (IdEntidad != 0)
                {

                    List<EN_Feligres> EditarFeligres = BL_Feligres.FeligresId(IdEntidad);
                    var FeligresId = EditarFeligres[0];
                    Feligres.IdEntidad = FeligresId.IdEntidad;
                }
                BL_Feligres.Grabar(Feligres);
                int idInsertado = BL_Entidad.UltimoIdEntidad();
                L.Accion = "El usuario " + LoginCache.Nick + " registró el feligrés " + txtNombre.Text + " " + txtApellido.Text;
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



                    if (Variables.IdDir == 0)
                    {
                        NuevoDatoEntidad(int.Parse(hid.Value), "dire", txtDireccion.Text);
                    }
                    else
                    {
                        EditarDatoEntidad(Variables.IdDir, txtDireccion.Text);
                    }




                    if (Variables.IdMail == 0)
                    {
                        NuevoDatoEntidad(int.Parse(hid.Value), "mail", txtMail.Text);
                    }
                    else
                    {
                        EditarDatoEntidad(Variables.IdMail, txtMail.Text);
                    }


                    if (Variables.IdTel == 0)
                    {
                        NuevoDatoEntidad(int.Parse(hid.Value), "tel", txtTelefono.Text);
                    }
                    else
                    {
                        EditarDatoEntidad(Variables.IdTel, txtTelefono.Text);
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
                txtNombre.Text = "";
                txtApellido.Text = "";
                LstTDoc.Text = "";
                txtFechaNac.Text = "";
                txtDocumento.Text = "";
                txtObservaciones.Text = "";
                txtDireccion.Text = "";
                txtMail.Text = "";
                txtTelefono.Text = "";
                FlagIDEntidad = 0;

                Enlazar();
                lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
            }

        }

        protected void ViewParishioner_RowCommand1(object sender, GridViewCommandEventArgs e)
        {


            int Id = int.Parse(dgvFeligres.DataKeys[int.Parse(e.CommandArgument.ToString())].Value.ToString());
            List<EN_Feligres> EditarFeligres = BL_Feligres.FeligresId(Id);
            var FeligresId = EditarFeligres[0];

            switch (e.CommandName)
            {
                case "Borrar":
                    {

                        FeligresId.Estado = 0;
                        FeligresId.IdEntidad = Id;
                        BL_Feligres.Baja(FeligresId);
                        Enlazar();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
                        break;

                    }
                case "Seleccionar":
                    {
                        hid.Value = FeligresId.IdEntidad.ToString();
                        EntidadID = FeligresId.Id;
                        txtNombre.Text = FeligresId.Nombre;
                        txtApellido.Text = FeligresId.Apellido;
                        txtFechaNac.Text = Convert.ToDateTime(FeligresId.FechaNacimiento).ToShortDateString();
                        LstTDoc.Text = FeligresId.TDoc;
                        txtDocumento.Text = FeligresId.Documento;
                        txtObservaciones.Text = FeligresId.Observaciones;
                        txtTelefono.Text = FeligresId.Telefono;
                        Variables.IdTel = FeligresId.IdTelefono;
                        txtDireccion.Text = FeligresId.Direccion;
                        Variables.IdDir = FeligresId.IdDireccion;
                        txtMail.Text = FeligresId.Mail;
                        Variables.IdMail = FeligresId.IdMail;
                        ModalPopupExtender1.Show();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
                        break;
                    }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            txtDocumento.Text = string.Empty;
            ModalPopupExtender1.Show();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtFechaNac.Text = string.Empty;
            txtObservaciones.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtMail.Text = string.Empty;
            ModalPopupExtender1.Dispose();
            ModalPopupExtender1.Hide();
        }

        protected void dgvFeligres_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvFeligres.PageIndex = e.NewPageIndex;
            Enlazar();
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void dgvFeligres_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}