using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchCustomers();
    }
    private void SearchCustomers()
    {
        string constr = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string search = txtSearch.Text;
                string sql = "SELECT Uid, Username, Name, Email, Mobile, Gender FROM Users";
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sql += " WHERE Name LIKE '%" + search + "%' OR Username LIKE '" + search + "' OR Gender LIKE '" + search + "' OR Mobile LIKE '" + search + "' OR Email LIKE '" + search + "'";
                    //sql += " WHERE Name LIKE @Name + '%'";
                    cmd.Parameters.AddWithValue("@Name", txtSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", txtSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", txtSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtSearch.Text.Trim());
                }
                cmd.CommandText = sql;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvCustomers.DataSource = dt;
                    gvCustomers.DataBind();
                }
            }
        }
    }
    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvCustomers.PageIndex = e.NewPageIndex;
        this.SearchCustomers();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Uid = "";
        int index = 0;
        if (e.CommandName == "Details")
        {
            index = Convert.ToInt32(e.CommandArgument);
            // User ID
            Uid = gvCustomers.Rows[index].Cells[0].Text;
            Response.Redirect("~/UserDetails.aspx?id=" + Uid);
        }
        if (e.CommandName == "Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);
            // User ID
            Uid = gvCustomers.Rows[index].Cells[0].Text;
            Response.Redirect("~/EditUser.aspx?id=" + Uid);
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            Uid = gvCustomers.Rows[index].Cells[0].Text;
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