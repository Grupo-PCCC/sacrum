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
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
            }

            string Tabla = "Feligres";
            EN_Feligres Feligres = new EN_Feligres();
            //Audit L = new Audit();
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
            //L.Action = "El usuario " + LoginCache.Nick + " registró el feligrés " + txtNombre.Text + " " + txtApellido.Text;
            //L.ActionDate = DateTime.Now;
            //L.Id = LoginCache.Id;
            //L.WriteLog(L);

            void NuevoDatoEntidad(int IdTipoDatoEntidad, string NombreDato, string Valor)
            {
                EN_DatoEntidad nuevoDato = new EN_DatoEntidad();
                nuevoDato._Entidad.Id = idInsertado;
                nuevoDato._TipoDatoEntidad.Id = 1;
                nuevoDato.NombreDato = NombreDato;
                nuevoDato.Valor = Valor;
                nuevoDato.Detalle = "";
                BL_DatoEntidad.Insertar(nuevoDato);
            }

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

            Enlazar();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
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
                        txtNombre.Text = FeligresId.Nombre;
                        txtApellido.Text = FeligresId.Apellido;
                        txtFechaNac.Text = Convert.ToDateTime(FeligresId.FechaNacimiento).ToShortDateString();
                        LstTDoc.Text = FeligresId.TDoc;
                        txtDocumento.Text = FeligresId.Documento;
                        txtObservaciones.Text = FeligresId.Observaciones;
                        txtTelefono.Text = FeligresId.Telefono;
                        txtDireccion.Text = FeligresId.Direccion;
                        txtMail.Text = FeligresId.Mail;
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