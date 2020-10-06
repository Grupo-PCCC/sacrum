using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using COMMON;

namespace UI
{
    public partial class Index : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text != "")
            {
                if (txtContraseña.Text != "")
                {
                    BL_Login User = new BL_Login();
                    var validlogin = User.LoginUser(txtUsuario.Text, GenerarMD5.crearMD5(txtContraseña.Text));
                    if (validlogin == true)
                    {
                        /*
                        Audit L = new Audit();
                        L.Action = "El usuario " + txtUsuario.Text + " inició sesión en la aplicación";
                        L.ActionDate = DateTime.Now;
                        L.Id = LoginCache.Id;
                        L.WriteLog(L);
                        */
                        Session["usuarioNick"] = LoginCache.Nick;
                        Response.Redirect("~/Inicio.aspx");

                    }
                    else
                    {
                        Errormsg("Usuario/Contraseña inválido");
                    }
                }
                else Errormsg("Ingrese su contraseña");
            }
            else Errormsg("Ingrese su nombre de usuario");
        }
        private void Errormsg(string msg)
        {
            lblError.Text = " " + msg;
            lblError.Visible = true;
        }
    }
}