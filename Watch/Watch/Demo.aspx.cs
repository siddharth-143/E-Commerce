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

public partial class Demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindUserDetails();
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
                    dlCustomers.DataSource = dt;
                    dlCustomers.DataBind();
                }
                txtSearch.Text = "";
            }
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }



    protected void OnDelete(object sender, EventArgs e)
    {
        DataListItem item = (sender as Button).NamingContainer as DataListItem;
        int id = Convert.ToInt32((item.FindControl("lblId") as Label).Text.Trim());
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "DELETE FROM Users WHERE Uid = @Uid";
        cmd.Parameters.AddWithValue("@Uid", id);
        InsertUpdateDelete(cmd);
        this.BindUserDetails();
    }

    protected void OnCancel(object sender, EventArgs e)
    {
        this.BindUserDetails();
    }

    private void InsertUpdateDelete(SqlCommand cmd)
    {
        string conString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

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
                    dlCustomers.DataSource = dtusers;
                    dlCustomers.DataBind();
                }
            }
        }
    }


}