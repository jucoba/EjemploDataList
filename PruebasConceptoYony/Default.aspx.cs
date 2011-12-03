using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Datos;

namespace PruebasConceptoYony
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        double valorTotal = 0;
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Pagos.PagosRow pr = ((System.Data.DataRowView)e.Row.DataItem).Row as Pagos.PagosRow;
                valorTotal += pr.Valor;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Total: " + valorTotal;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void MiObjDs_DataBinding(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Console.WriteLine("s");
            }
        }

        

        
    }
}
