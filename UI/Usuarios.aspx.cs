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
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Inicio.aspx");
            }
            mostrarBuscarTabla(TxtBusqueda.Text.ToString());
        }

        public void mostrarBuscarTabla (string buscar)
        {
            BL_Usuario objBL = new BL_Usuario();
            buscar = TxtBusqueda.Text.ToString();
            dgvUsuarios.DataSource = objBL.ListandoUsers(buscar);
            dgvUsuarios.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            mostrarBuscarTabla(TxtBusqueda.Text.ToString());
        }

        protected void dgvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvUsuarios.PageIndex = e.NewPageIndex;
            mostrarBuscarTabla(TxtBusqueda.Text.ToString());
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            
        }
    }
}