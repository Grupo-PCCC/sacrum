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
    public partial class Caja : System.Web.UI.Page
    {
        BL_MovimientosMonetarios MM = new BL_MovimientosMonetarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioNick"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }


            if (!IsPostBack)

            {
                //CargarlstUsuario();
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
           
            DateTime fecha1= Convert.ToDateTime("01-01-1900");
            DateTime fecha2= Convert.ToDateTime("01-01-9999");
            float valor1 = 0;
            float valor2 = 99999999999;
            int idTipoCategoria = 0;
            int idCategoria = 0;
            int idUsuario = 0;
            
            Audit objBL = new Audit();
            dgvMovimientos.DataSource = MM.Listar(fecha1,fecha2,valor1,valor2,idTipoCategoria,idCategoria,idUsuario);
            dgvMovimientos.DataBind();
            lblResultado.Text = "Registros: " + Convert.ToString(dgvMovimientos.Rows.Count);
        }

        /*
        private void CargarlstUsuario()
        {
            BL_Usuario objBLU = new BL_Usuario();

            lstUsuario.DataSource = objBLU.ListaUsuarios();
            lstUsuario.DataTextField = "Nick";
            lstUsuario.DataValueField = "Id";
            lstUsuario.DataBind();
            lstUsuario.Items.Insert(0, new ListItem("[TODOS]", "0"));

        }
        */





        protected void dgvMovimientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvMovimientos.PageIndex = e.NewPageIndex;
            Enlazar();
        }

        protected void lstUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
         //   Variables.IdUsu = int.Parse(lstUsuario.SelectedValue);
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
            string FileName = "Caja " + DateTime.Now.ToString("dd/MM/yyyy") + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            dgvMovimientos.GridLines = GridLines.Both;
            dgvMovimientos.HeaderStyle.Font.Bold = true;
            dgvMovimientos.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)

        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)

        {

        }
    }
}