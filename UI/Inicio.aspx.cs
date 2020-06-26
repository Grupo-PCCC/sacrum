using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BL;
using Cache;

namespace UI
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (TxtUser.Text != "")
            {
                if (TxtPass.Text != "")
                {
                    BL_Login User = new BL_Login();
                    var validlogin = User.LoginUser(TxtUser.Text, GenerarMD5.crearMD5(TxtPass.Text));
                    if (validlogin == true)
                    {
                        Session["usuarioName"] = LoginCache.Name;
                        Response.Redirect("~/Feligreses.aspx");

                    }
                    else
                    {
                        Errormsg("Usuario o Password invalido");
                    }
                }
                else Errormsg("Ingrese Password");
            }
            else Errormsg("Ingrese Usuario");
        }
        private void Errormsg(string msg)
        {
            msgError.Text = " " + msg;
            msgError.Visible = true;
        }
    }
}