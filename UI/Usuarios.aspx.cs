using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMMON;
using BL;
using EN;

namespace UI
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
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
            hid.Value = "0";
            ModalPopupExtender1.Show();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            EN_Usuario par = new EN_Usuario();
            Audit L = new Audit();
            par.Id = int.Parse(hid.Value);
            par.Nick = txtNick.Text.ToString();
            par.Nombre = txtNombre.Text.ToString();
            par.Apellido = txtApellido.Text.ToString();
            par.TipoUsuario = TxtTipodeUsuario.Text.ToString();

         //   EN_Usuario.Grabar(par);

            L.Action = "El usuario " + LoginCache.Nick + " registró el usuario " + txtNombre.Text + " " + txtNombre.Text;
            L.ActionDate = DateTime.Now;
            L.Id = LoginCache.Id;
            L.WriteLog(L);
            hid.Value = "0";    
            txtNick.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            TxtTipodeUsuario.Text = "";
           // Enlazar();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}