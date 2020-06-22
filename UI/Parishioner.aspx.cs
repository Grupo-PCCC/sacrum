using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EN;
using BL;


namespace UI
{
    public partial class Parishioner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarBuscarTabla(TxtParishioner.Text.ToString());
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            mostrarBuscarTabla(TxtParishioner.Text.ToString());
        }

        public void mostrarBuscarTabla (string buscar)
        {
            BL_Parishioner objBL = new BL_Parishioner();
            buscar = TxtParishioner.Text.ToString();
            ViewParishioner.DataSource = objBL.ListandoParishioner(buscar);
            ViewParishioner.DataBind();

        }
        protected void BtnNewParishioner_Click(object sender, EventArgs e)
        {
            
        }
        protected void BtnModifyParishioner_Click(object sender, EventArgs e)
        {

        }
        protected void BtnDeleteParishioner_Click(object sender, EventArgs e)
        {

        }
        //public void addParishioner()
        //{

        //}
    }
}