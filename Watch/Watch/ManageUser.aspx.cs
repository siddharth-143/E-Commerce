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
        if (!this.IsPostBack)
        {
            if (Session["USERNAME"] != null)
            {
                this.BindUserDetails();
                SearchCustomers();
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
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
                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();
                }
                txtSearch.Text = "";
            }
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvUsers.PageIndex = e.NewPageIndex;
        this.SearchCustomers();
    }

    private void BindUserDetails()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from Users", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
            int columncount = gvUsers.Rows[0].Cells.Count;
            gvUsers.Rows[0].Cells.Clear();
            gvUsers.Rows[0].Cells.Add(new TableCell());
            gvUsers.Rows[0].Cells[0].ColumnSpan = columncount;
            gvUsers.Rows[0].Cells[0].Text = "No Records Found";
        }
    }

    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");  
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        //SqlConnection con = new SqlConnection(CS);
        //int userid = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Values["Uid"].ToString());
        //int userid = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
        //string username = gvUsers.DataKeys[e.RowIndex].Values["Name"].ToString();
        //con.Open();
        //SqlCommand cmd = new SqlCommand("delete from Users where Uid='" + userid + "'", con);
        //int result = cmd.ExecuteNonQuery();
        //con.Close();
        //if (result == 1)
        //{
        //    BindUserDetails();
        //    lblresult.ForeColor = Color.Red;
        //    lblresult.Text = username + " details deleted successfully";
        //}

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        try
        {
            int userid = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Values[0]);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Users where Uid='" + userid + "'", con);
            cmd.Parameters.AddWithValue("@Uid", userid);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            ShowMessage("Record Deleted Successfully.....!");
            gvUsers.EditIndex = -1;
            con.Close();
            BindUserDetails();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUsers.EditIndex = e.NewEditIndex;
        BindUserDetails();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        int userid = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value.ToString());
        string username = gvUsers.DataKeys[e.RowIndex].Values["Username"].ToString();
        GridViewRow row = (GridViewRow)gvUsers.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("Uid");
        //TextBox txtname=(TextBox)gr.cell[].control[];  
        //TextBox textUserUid = (TextBox)row.Cells[0].Controls[0];
        TextBox textUserName = (TextBox)row.Cells[0].Controls[0];
        TextBox textName = (TextBox)row.Cells[1].Controls[0];
        TextBox textPassword = (TextBox)row.Cells[2].Controls[0];
        TextBox textEmail = (TextBox)row.Cells[3].Controls[0];
        TextBox textMobile = (TextBox)row.Cells[4].Controls[0];
        TextBox textGender = (TextBox)row.Cells[5].Controls[0];
        TextBox textUsertype = (TextBox)row.Cells[6].Controls[0];
        //TextBox textname = (TextBox)row.FindControl("txtname");  
        //TextBox textc = (TextBox)row.FindControl("txtc");  
        gvUsers.EditIndex = -1;
        con.Open();
        //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  
        SqlCommand cmd = new SqlCommand("update Users set Username='" + textUserName.Text + "',Name='" + textName.Text + "'" +
            ",Password='" + textPassword.Text + "', Email='" + textEmail.Text + "', Mobile='" + textMobile.Text + "',Gender='" + textGender.Text + "'," +
            " UserType='" + textUsertype.Text + "' where Uid='" + userid + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        lblresult.Text = username + " Details Updated successfully";
        BindUserDetails();
        //GridView1.DataBind();         
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUsers.EditIndex = -1;
        BindUserDetails();
    }
}