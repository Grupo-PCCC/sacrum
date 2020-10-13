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
            string Nombre = "";
            string Apellido = "";
            DateTime Fecha1 = Convert.ToDateTime("01-01-1900");
            DateTime Fecha2 = Convert.ToDateTime("01-01-2020");
            string Documento = "";
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
            int Entidad = 1;
            EN_Feligres Feligres = new EN_Feligres();
            //Audit L = new Audit();
            Feligres.Id = int.Parse(hid.Value);
            Feligres.Nombre = txtNombre.Text.ToString();
            Feligres.Apellido = txtApellido.Text.ToString();
            Feligres.FechaNacimiento = Convert.ToDateTime(txtFechaNac.Text);
            Feligres.TDoc = LstTDoc.SelectedValue;
            Feligres.Documento = txtDocumento.Text.ToString();
            Feligres.Observaciones = txtObservaciones.Text.ToString();
            Feligres.Vivo = int.Parse(LstVivo.SelectedValue);
            Feligres.EsContacto = int.Parse(LstContacto.SelectedValue);
            Feligres.Tabla = Tabla;
            Feligres.IdEntidad = Entidad;
            BL_Feligres.Grabar(Feligres);
            //L.Action = "El usuario " + LoginCache.Nick + " registró el feligrés " + txtNombre.Text + " " + txtApellido.Text;
            //L.ActionDate = DateTime.Now;
            //L.Id = LoginCache.Id;
            //L.WriteLog(L);
            hid.Value = "0";
            txtNombre.Text = "";
            txtApellido.Text = "";
            LstContacto.Text = "";
            LstTDoc.Text = "";
            LstVivo.Text = "";
            txtFechaNac.Text = "";
            txtDocumento.Text = "";
            txtObservaciones.Text = "";
            Enlazar();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
        }

        protected void ViewParishioner_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int Id = int.Parse(dgvFeligres.DataKeys[int.Parse(e.CommandArgument.ToString())].Value.ToString());
            //int Id = int.Parse(dgvFeligres.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            //int Id = int.Parse(dgvFeligres.DataKeys[0][int.Parse(e.CommandArgument.ToString())].ToString());
            List<EN_Feligres> EditarFeligres = BL_Feligres.FeligresId(Id);
            var Feligres = EditarFeligres[0];


            switch (e.CommandName)
            {
                //case "Borrar":
                //    {
                //        BL_Parishioner.Borrar(parish);
                //        Enlazar();
                //        lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
                //        break;

                //    }
                case "Seleccionar":
                    {
                        hid.Value = Feligres.Id.ToString();
                        txtNombre.Text = Feligres.Nombre;
                        txtApellido.Text = Feligres.Apellido;
                        txtFechaNac.Text = Convert.ToDateTime(Feligres.FechaNacimiento).ToShortDateString();
                        LstTDoc.Text = Feligres.TDoc;
                        txtDocumento.Text = Feligres.Documento;
                        txtObservaciones.Text = Feligres.Observaciones;
                        Feligres.Vivo = int.Parse(LstVivo.SelectedValue);
                        Feligres.EsContacto = int.Parse(LstContacto.SelectedValue);
                        ModalPopupExtender1.Show();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
                        break;
                    }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
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
        //{
        //    mostrarBuscarTabla(TxtBuscar.Text.ToString());
        //}
        //public void mostrarBuscarTabla(string Name)
        //{
        //    BL_Feligres objBL = new BL_Feligres();
        //    Name = TxtBuscar.Text.ToString();
        //    dgvFeligres.DataSource = objBL.ListarName(Name);
        //    dgvFeligres.DataBind();
        //    lblResultado.Text = "Registros: " + Convert.ToString(dgvFeligres.Rows.Count);
        //}
    }
}