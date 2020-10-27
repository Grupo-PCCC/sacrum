using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMMON;
using BL;
namespace UI
{
    public partial class Auditoria : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }


            if (!IsPostBack)

            {
                CargarlstUsuario();
                Enlazar();

            }
          

        }


        private static class Variables
        {
            public static int IdUsu;
            
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            Enlazar();
        }

        public void Enlazar()
        {
            string Texto = txtTextoBuscar.Text.Trim().ToString();
            
            
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
            
            
            Audit objBL = new Audit();
            dgvAuditoria.DataSource = objBL.ListarLog(Variables.IdUsu, Fecha1, Fecha2, Texto);
            dgvAuditoria.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvAuditoria.Rows.Count);
        }

        private void CargarlstUsuario()
        {
            BL_Usuario objBLU = new BL_Usuario();

            lstUsuario.DataSource = objBLU.ListaUsuarios();
            lstUsuario.DataTextField = "Nick";
            lstUsuario.DataValueField = "Id";
            lstUsuario.DataBind();
            lstUsuario.Items.Insert(0, new ListItem("[TODOS]", "0"));

        }






        protected void dgvAuditoria_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAuditoria.PageIndex = e.NewPageIndex;
            Enlazar();
        }

        protected void lstUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            Variables.IdUsu = int.Parse(lstUsuario.SelectedValue);
        }
    }
}
