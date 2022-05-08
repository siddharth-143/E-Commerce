using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Timepass : System.Web.UI.Page
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
        if (e.CommandName=="Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);
            // User ID
            Uid = GridView1.Rows[index].Cells[0].Text;
            Response.Redirect("~/EditUser.aspx?id=" + Uid);
        }
        if (e.CommandName=="Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            Uid = GridView1.Rows[index].Cells[0].Text;
        }
    }
}