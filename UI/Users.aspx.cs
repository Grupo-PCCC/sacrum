﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EN;
using BL;


namespace UI
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            mostrarBuscarTabla(TxtUsers.Text.ToString());
        }
        public void mostrarBuscarTabla (string buscar)
        {
            BL_Users objBL = new BL_Users();
            buscar = TxtUsers.Text.ToString();
            ViewUsers.DataSource = objBL.ListandoUsers(buscar);
            ViewUsers.DataBind();
        }
    }
}