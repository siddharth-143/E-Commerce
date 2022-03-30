using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GeneralLayout : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["USERNAME"] != null)
        {
            btnSignup.Visible = false;
            btnSigin.Visible = false;
            btnSignOut.Visible = true;
        }
        else
        {
            btnSignup.Visible = true;
            btnSigin.Visible = true;
            btnSignOut.Visible = false;
        }
    }
    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerHtml = ProductCount.ToString();
        }
        else
        {
            pCount.InnerHtml = 0.ToString();
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/Default.aspx");
    }
}
