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
            ViewParishioner.DataSource = BL_Parishioner.ListarTodo();
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
            hid.Value = "0";

            TxtName.Text = "";
            TxtSurname.Text = "";
            TxtBirthdate.Text = "";
            TxtNumP.Text = "";
            TxtNumA.Text = "";
            TxtObs.Text = "";
        }
       
        protected void ViewParishioner_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            int Id = int.Parse(ViewParishioner.Rows[int.Parse(e.CommandArgument.ToString())].Cells[2].Text);
            List <EN_Parishioner> listparishID = BL_Parishioner.ListarID(Id);
            var parish = listparishID[0];
            

            switch (e.CommandName)
            {
                case "Borrar":
                    {
                        BL_Parishioner.Borrar(parish);
                        Enlazar();
                        break;
                    }
                case "Seleccionar":
                    {
                        hid.Value = parish.Id.ToString();
                        TxtName.Text = parish.Name;
                        TxtSurname.Text = parish.Surname;
                        TxtBirthdate.Text = Convert.ToDateTime(parish.BirthDate).ToString();
                        TxtNumP.Text = parish.NumberP;
                        TxtNumA.Text = parish.NumberA;
                        TxtObs.Text = parish.Observation;
                        ModalPopupExtender1.Show();
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