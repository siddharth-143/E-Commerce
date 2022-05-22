using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserDetails : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    string query;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindUserDetails();
        BindUserAddress();
    }

    protected void BindUserDetails()
    {
        Int64 Uid = Convert.ToInt64(Request.QueryString["id"]);
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        query = "select * from Users where Uid=" + Uid + "";
        com = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);
        lblUsername.Text = ds.Tables[0].Rows[0]["Username"].ToString();
        lblFullName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        lblEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        lblMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
        lblGender.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
        //lblAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();

    }

    protected void BindUserAddress()
    {
        Int64 Uid = Convert.ToInt64(Request.QueryString["id"]);
        BindUserDetails();
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        query = "select tblPurchase.Address from tblPurchase left join Users on Users.Uid = tblPurchase.UserID where Uid='" + Uid + "'";
        com = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        }
        else
        {
            BindUserDetails();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ManageUser.aspx");
    }
}