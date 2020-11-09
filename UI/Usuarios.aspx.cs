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
        BL_Usuario BL_Usuario = new BL_Usuario();
        public EN_TipoUsuario _TipoUsuario;

        private static class Variables
        {
            public static int IdTipoUsuario;

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                mostrarBuscarTabla("", "", "", 1, 0);
                CargarlstTipoUsuario();
            }
        }

        public void mostrarBuscarTabla(string usuario, string nombre, string apellido, int estado, int tipoPerfil)
        {

           
            dgvUsuarios.DataSource = BL_Usuario.ListarUser(usuario, nombre, apellido, estado, tipoPerfil);
            dgvUsuarios.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
        }
        private void CargarlstTipoUsuario()
        {
            BL_Usuario objBLU = new BL_Usuario();

            lstTipoPerfil.DataSource = objBLU.TipoUsuario();
            lstTipoPerfil.DataTextField = "NombreTU";
            lstTipoPerfil.DataValueField = "IdTU";
            lstTipoPerfil.DataBind();
            lstTipoPerfil.Items.Insert(0, new ListItem("[TODOS]", "0"));

        }

        protected void lstTipoPerfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            Variables.IdTipoUsuario = int.Parse(lstTipoPerfil.SelectedValue);
        }
        protected void BtnBuscar_Click(object sender, EventArgs e)
        {

            mostrarBuscarTabla(txtUsuario.Text.ToString(), txtNom.Text.ToString(), txtApe.Text.ToString(), 1, Variables.IdTipoUsuario);
        }

        protected void dgvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvUsuarios.PageIndex = e.NewPageIndex;
            mostrarBuscarTabla(txtUsuario.Text.ToString(), txtNom.Text.ToString(), txtApe.Text.ToString(), 1, Variables.IdTipoUsuario);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";
            ModalPopupExtender1.Show();
        }


        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
            }
            EN_Usuario par = new EN_Usuario();
            _TipoUsuario = new EN_TipoUsuario();

            par.Id = int.Parse(hid.Value);
            par.Nick = txtNick.Text.ToString();
            par.Contraseña = txtContraseña.Text.ToString();
            par.Nombre = txtNombre.Text.ToString();
            par.Apellido = txtApellido.Text.ToString();
            par._tipoUsuario.Id = int.Parse(cmbTipoUsuario.SelectedValue);
            //par._tipoUsuario.Id = int.Parse(TxtTipodeUsuario.Text);
            BL_Usuario.Insertar(par);
            Audit L = new Audit();
            L.Accion = "El usuario " + LoginCache.Nick + " registró el usuario " + txtNombre.Text + " " + txtNombre.Text;
            L.Fecha = DateTime.Now;
            L.Id = LoginCache.Id;
            L.EscribirLog(L);
            hid.Value = "0";
            txtNick.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtContraseña.Text = string.Empty;
            txtApellido.Text = string.Empty;
            cmbTipoUsuario.Text = string.Empty;
            //TxtTipodeUsuario.Text = "";
            Enlazar();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtNick.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtContraseña.Text = string.Empty;
            txtApellido.Text = string.Empty;
            cmbTipoUsuario.Text = string.Empty;
            ModalPopupExtender1.Dispose();
            ModalPopupExtender1.Hide();
        }

        public void Enlazar()
        {
            dgvUsuarios.DataSource = BL_Usuario.ListaTotal();
            dgvUsuarios.DataBind();

            lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
        }


        protected void dgvUsuarios_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int Id = int.Parse(dgvUsuarios.DataKeys[int.Parse(e.CommandArgument.ToString())].Value.ToString());
            //int Id = int.Parse(dgvFeligres.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            //int Id = int.Parse(dgvFeligres.DataKeys[0][int.Parse(e.CommandArgument.ToString())].ToString());
            List<EN_Usuario> listUserId = BL_Usuario.ListarUserId(Id);
            var User = listUserId[0];


            switch (e.CommandName)
            {

                case "Seleccionar":
                    {
                        hid.Value = User.Id.ToString();
                        txtNick.Text = User.Nick.ToString();
                        txtContraseña.Text = User.Contraseña.ToString();
                        txtNombre.Text = User.Nombre.ToString();
                        txtApellido.Text = User.Apellido.ToString();
                        cmbTipoUsuario.Text = Convert.ToInt32(User._tipoUsuario.Id).ToString();
                        //TxtTipodeUsuario.Text = Convert.ToInt32(User._tipoUsuario.Id).ToString();
                        ModalPopupExtender1.Show();
                        lblResultado.Text = "Registros: " + Convert.ToString(dgvUsuarios.Rows.Count);
                        break;

                    }
            }
        }
    }
}