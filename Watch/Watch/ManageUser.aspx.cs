using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class ManageUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserDetails();
            SearchCustomers();
        }
    }

    private void SearchCustomers()
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT Uid, Username, Name, Password, Email, Mobile, Gender, Usertype FROM Users";
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sql += " WHERE Name LIKE @Name + '%'";
                    cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim());
                }
                cmd.CommandText = sql;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrUserDetails.DataSource = dt;
                    rptrUserDetails.DataBind();
                }
                txtSearch.Text = "";
            }
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }


    //protected void DeleteUser()
    //{
    //    // int Uid = Convert.ToInt32();
    //    GridViewRow row = (sender as Button).NamingContainer as GridViewRow;
    //    string Uid = row.Cells[0].Text.Trim();
    //    string query = "DELETE FROM Users WHERE Uid=@Uid";
    //    string constr = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(query))
    //        {
    //            cmd.Parameters.AddWithValue("@Uid", Uid);
    //            cmd.Connection = con;
    //            con.Open();
    //            cmd.ExecuteNonQuery();
    //            con.Close();
    //        }
    //    }
    //}




    private void BindUserDetails()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from users", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusers = new DataTable();
                    sda.Fill(dtusers);
                    rptrUserDetails.DataSource = dtusers;
                    rptrUserDetails.DataBind();
                }
            }
        }
    }

    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(CS))
    //    {
    //        SqlCommand cmd = new SqlCommand("select Uid, Username, Name, Password, Email, Mobile, Gender, Usertype" +
    //            "from Users" +
    //            "where( (Word LIKE '%' + @Uid + '%')");
    //        con.Open();
    //        cmd.ExecuteNonQuery();
    //        txtSearch.Text = string.Empty;
    //    }
    //    BindUserDetails();
    //}

}