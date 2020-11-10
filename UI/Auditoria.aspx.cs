using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using COMMON;
using BL;
using System.Data;
using System.IO;

namespace UI
{
    public partial class Auditoria : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }


            if (!IsPostBack)

            {
                CargarlstUsuario();
                Enlazar();

            }
          

        }
     

        private static class Variables
        {
            public static int IdUsu;
            
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            Enlazar();
        }

        public void Enlazar()
        {
            string Texto = txtTextoBuscar.Text.Trim().ToString();
            
            
            DateTime Fecha1;
            DateTime Fecha2;
            if (dateInicio.Text == "")
            {
                Fecha1 = Convert.ToDateTime("01-01-1900");
            }
            else
            {
                Fecha1 = Convert.ToDateTime(dateInicio.Text);
            }
            if (dateFin.Text == "")
            {
                Fecha2 = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
            }
            else
            {
                Fecha2 = Convert.ToDateTime(dateFin.Text);
            }
            
            
            Audit objBL = new Audit();
            dgvAuditoria.DataSource = objBL.ListarLog(Variables.IdUsu, Fecha1, Fecha2, Texto);
            dgvAuditoria.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvAuditoria.Rows.Count);
        }

        private void CargarlstUsuario()
        {
            BL_Usuario objBLU = new BL_Usuario();

            lstUsuario.DataSource = objBLU.ListaUsuarios();
            lstUsuario.DataTextField = "Nick";
            lstUsuario.DataValueField = "Id";
            lstUsuario.DataBind();
            lstUsuario.Items.Insert(0, new ListItem("[TODOS]", "0"));

        }






        protected void dgvAuditoria_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAuditoria.PageIndex = e.NewPageIndex;
            Enlazar();
        }

        protected void lstUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            Variables.IdUsu = int.Parse(lstUsuario.SelectedValue);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        private void ClearControls(Control control)
        {
            for (int i = control.Controls.Count - 1; i >= 0; i--)
            {
                ClearControls(control.Controls[i]);
            }
            if (!(control is TableCell))
            {
                if (control.GetType().GetProperty("SelectedItem") != null)
                {
                    LiteralControl literal = new LiteralControl();
                    control.Parent.Controls.Add(literal);
                    try
                    {
                        literal.Text = (string)control.GetType().GetProperty("SelectedItem").GetValue(control, null);
                    }
                    catch
                    {
                    }
                    control.Parent.Controls.Remove(control);
                }
                else
                if (control.GetType().GetProperty("Text") != null)
                {
                    LiteralControl literal = new LiteralControl();
                    control.Parent.Controls.Add(literal);
                    literal.Text = (string)control.GetType().GetProperty("Text").GetValue(control, null);
                    control.Parent.Controls.Remove(control);
                }
            }
            return;
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Auditoria " + DateTime.Now.ToString("dd/MM/yyyy") + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            dgvAuditoria.GridLines = GridLines.Both;
            dgvAuditoria.HeaderStyle.Font.Bold = true;
            dgvAuditoria.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }


    }
}
