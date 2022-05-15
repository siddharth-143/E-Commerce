using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ManageUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Uid = "";
        int index = 0;
        if (e.CommandName == "Details")
        {
            index = Convert.ToInt32(e.CommandArgument);
            // User ID
            Uid = GridView1.Rows[index].Cells[0].Text;
            Response.Redirect("~/UserDetails.aspx?id=" + Uid);
        }
        if (e.CommandName == "Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);
            // User ID
            Uid = GridView1.Rows[index].Cells[0].Text;
            Response.Redirect("~/EditUser.aspx?id=" + Uid);
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            Uid = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from Users where Uid=" + Uid;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "User Delete Successfully !!!";
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
    }
}