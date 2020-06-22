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
        BL_Parishioner BL_Parishioner = new BL_Parishioner();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Enlazar();
            }
        }

   

        public void Enlazar()
        {
            ViewParishioner.DataSource = BL_Parishioner.Listar();
            ViewParishioner.DataBind();
        }


        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(hid.Value))
            {
                hid.Value = "0";
            }

            EN_Parishioner par = new EN_Parishioner();

            par.Id = int.Parse(hid.Value);
            par.Name = TxtName.Text.ToString();
            par.Surname = TxtSurname.Text.ToString();
            par.BirthDate = Convert.ToDateTime(TxtBirthdate.Text);
            par.NumberP = TxtNumP.Text.ToString();
            par.NumberA = TxtNumA.Text.ToString();
            par.Observation = TxtObs.Text.ToString();

            BL_Parishioner.Grabar(par);
            Enlazar();
        }
       
        protected void ViewParishioner_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int id = int.Parse(ViewParishioner.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text);
            EN_Parishioner par = BL_Parishioner.Listar(id);

            switch (e.CommandName)
            {
                case "Borrar":
                    {
                        BL_Parishioner.Borrar(par);
                        Enlazar();
                        break;
                    }
                case "Seleccionar":
                    {
                        hid.Value = par.Id.ToString();
                        TxtName.Text = par.Name;
                        TxtSurname.Text = par.Surname;
                        TxtBirthdate.Text = Convert.ToDateTime(par.BirthDate).ToString();
                        TxtNumP.Text = par.NumberP;
                        TxtNumA.Text = par.NumberA;
                        TxtObs.Text = par.Observation;

                        break;
                    }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            hid.Value = "0";

            TxtName.Text = "";
            TxtSurname.Text = "";
            TxtBirthdate.Text = "";
            TxtNumP.Text = "";
            TxtNumA.Text = "";
            TxtObs.Text = "";
        }
    }
}