using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GeneralLayout : System.Web.UI.MasterPage
{
    private object rptrProducts;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindCategories();
        BindGender();
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
    public void BindCategories()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptCategory.DataSource = dtBrands;
                    rptCategory.DataBind();
                }
            }

        }
    }

    public void BindGender()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptGender.DataSource = dtBrands;
                    rptGender.DataBind();
                }
            }

        }
    }

    //protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        string catid = (e.Item.FindControl("hfCatID") as HiddenField).Value;
    //        Repeater rptGender = e.Item.FindControl("rptGender") as Repeater;

    //        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    //        using (SqlConnection con = new SqlConnection(CS))
    //        {
    //            //using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblProducts where CatID='{0}'",catid), con))
    //            using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * from tblGender WHERE GenderID='{0}'", catid),con))
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                {
    //                    DataTable dtBrands = new DataTable();
    //                    sda.Fill(dtBrands);
    //                    rptGender.DataSource = dtBrands;
    //                    rptGender.DataBind();
    //                }
    //            }

    //        }
    //    }
    //}
}
