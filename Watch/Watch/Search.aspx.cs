using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            string query = "select * from tblProducts where PName like '%'+@PName+'%'";
            query += "select * from tblCategories";
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("PName", Request.QueryString["result"]);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            rptrProducts.DataSource = dt;
            rptrProducts.DataBind();
        }
        else
        {
            Response.Write("Hello");
        }
    }
}