using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class UserHome : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    string query;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["USERNAME"] != null)
        {
            lblSuccess.Text = "Login Success, Welcome " + Session["USERNAME"].ToString() + "";
            BindUserDetails();
            BindUserAddress();
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void BindUserDetails()
    {
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        query = "select * from Users where Username='" + Session["USERNAME"] + "'";
        //query = "select Users.Username, Users.Name, Users.Email, Users.Mobile, Users.Gender from Users left join tblPurchase on Users.Uid = tblPurchase.UserID where Username ='" + Session["USERNAME"] + "'";
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
        BindUserDetails();
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        query = "select tblPurchase.Address from tblPurchase left join Users on Users.Uid = tblPurchase.UserID where Username='" + Session["USERNAME"] + "'";
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (tbAddress.Text != "")
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            // Using SQLHelper
            string strcmd = "update tblPurchase set Address ='" + tbAddress.Text + "' where UserID='" + UserID + "'";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            SQLHelper.ExecuteNonQuery(strcmd);
            lblMsg.Text = "Updated Successfull";
            lblMsg.ForeColor = Color.Green;
            //Response.Redirect("~/Signin.aspx");
            BindUserAddress();
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "Something went wrong!";
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnCancel.Visible = true;
        pHide.Visible = true;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pHide.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EditProfile.aspx");
    }
}