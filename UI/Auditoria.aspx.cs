using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMMON;

namespace UI
{
    public partial class Auditoria : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Inicio.aspx");
            }

            mostrarTabla();

        }



        public void mostrarTabla()
        {
            Audit L = new Audit();
            var Lista= L.ListLogAll();
            dgvAuditoria.DataSource = Lista;
            dgvAuditoria.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvAuditoria.Rows.Count);
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}