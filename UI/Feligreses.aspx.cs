using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EN;
using BL;
using Cache;


namespace UI
{
    public partial class Parishioner : System.Web.UI.Page
    {
        BL_Feligres BL_Parishioner = new BL_Feligres();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Enlazar();
            }
            VerificarSesion();
        }
        private void VerificarSesion()
        {
            
            if (Session["usuarioName"] == null)
            {
                Response.Redirect("~/Inicio.aspx");
            }
        }

   

        public void Enlazar()
        {
            dgvFeligres.DataSource = BL_Parishioner.ListarTodo();
            dgvFeligres.DataBind();
        }


        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
            }

            EN_Feligres par = new EN_Feligres();

            par.Id = int.Parse(hid.Value);
            par.Nombre = txtNombre.Text.ToString();
            par.Apellido = txtApellido.Text.ToString();
            par.FechaNac = Convert.ToDateTime(txtFechaNac.Text);
            par.Numero1 = txtNum1.Text.ToString();
            par.Numero2 = txtNum2.Text.ToString();
            par.Observacion = txtObservaciones.Text.ToString();

            BL_Parishioner.Grabar(par);
            Enlazar();
            hid.Value = "0";

            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNac.Text = "";
            txtNum1.Text = "";
            txtNum2.Text = "";
            txtObservaciones.Text = "";
        }
       
        protected void ViewParishioner_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int Id = int.Parse(dgvFeligres.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text);
            List <EN_Feligres> listparishID = BL_Parishioner.ListarID(Id);
            var parish = listparishID[0];
            

            switch (e.CommandName)
            {
                case "Borrar":
                    {
                        BL_Parishioner.Borrar(parish);
                        Enlazar();
                        break;
                    }
                case "Seleccionar":
                    {
                        hid.Value = parish.Id.ToString();
                        txtNombre.Text = parish.Nombre;
                        txtApellido.Text = parish.Apellido;
                        txtFechaNac.Text = Convert.ToDateTime(parish.FechaNac).ToString("dd-MM-yyyy");
                        txtNum1.Text = parish.Numero1;
                        txtNum2.Text = parish.Numero2;
                        txtObservaciones.Text = parish.Observacion;
                        ModalPopupExtender1.Show();
                        break;
                    }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";

            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNac.Text = "";
            txtNum1.Text = "";
            txtNum2.Text = "";
            txtObservaciones.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            hid.Value = "0";

            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNac.Text = "";
            txtNum1.Text = "";
            txtNum2.Text = "";
            txtObservaciones.Text = "";
        }
    }
}