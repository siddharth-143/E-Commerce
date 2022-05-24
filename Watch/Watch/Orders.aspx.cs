using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    string query;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            lblSuccess.Text = "Login Success, Welcome " + Session["USERNAME"].ToString() + "";
            if (GridView1.Rows.Count > 0)
            {
                GridView1.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                lblMsg.Text = "No Orders";
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Int64 PurchaseID = Convert.ToInt64(Request.QueryString["PurchaseID"]);
        int index = 0;
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            string strID = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from tblPurchase where PurchaseID ="+strID;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Order Cancel Successfully";
            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message;
            }
        }
    }
}