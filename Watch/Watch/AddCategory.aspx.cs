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

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBrandsRptr();
        }
    }

    private void BindBrandsRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtcategories = new DataTable();
                    sda.Fill(dtcategories);
                    rptrCategories.DataSource = dtcategories;
                    rptrCategories.DataBind();
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into tblCategories values('" + txtBrandName.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txtBrandName.Text = string.Empty;
        }
        BindBrandsRptr();
    }
}