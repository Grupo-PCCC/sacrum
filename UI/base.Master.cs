using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMMON;

namespace UI
{
    public partial class _base : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void lnkCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session["usuarioNick"] = null;
            Session.Abandon();
            Response.Redirect("~/Inicio.aspx");
        }
    }
};