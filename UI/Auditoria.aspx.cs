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
                Response.Redirect("~/Login.aspx");
            }

            mostrarTabla();

        }



        public void mostrarTabla()
        {
            int idUsuario=0;
            DateTime fecha1 = new DateTime(2008, 6, 1, 7, 47, 0);
            DateTime fecha2 = new DateTime(9999, 6, 1, 7, 47, 0);
            string texto = "";
            Audit L = new Audit();
            var Lista= L.ListarLog(idUsuario,fecha1,fecha2,texto);
            dgvAuditoria.DataSource = Lista;
            dgvAuditoria.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvAuditoria.Rows.Count);
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            mostrarBuscarTabla(TxtBusqueda.Text.ToString());
        }
                     
        public void mostrarBuscarTabla(string Nick)
        {
            int idUsuario = 0;
            DateTime fecha1 = new DateTime(2008, 6, 1, 7, 47, 0);
            DateTime fecha2 = new DateTime(9999, 6, 1, 7, 47, 0);
            string texto = "";
            Audit objBL = new Audit();
            Nick = TxtBusqueda.Text.ToString();
            dgvAuditoria.DataSource = objBL.ListarLog(idUsuario, fecha1, fecha2, texto);
            dgvAuditoria.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvAuditoria.Rows.Count);
        }

        protected void dgvAuditoria_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAuditoria.PageIndex = e.NewPageIndex;
            mostrarTabla();
        }
    }
}