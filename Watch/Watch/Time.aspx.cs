using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Time : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRepeater();
            //BindCategories();
            //BindGender();
        }
    }
    private void BindProductRepeater()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        Int64 CatID = Request.QueryString["cat"] == null ? 0 : Convert.ToInt64(Request.QueryString["cat"]);
        Int64 GenderID = Request.QueryString["gen"] == null ? 0 : Convert.ToInt64(Request.QueryString["gen"]);

        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (CatID > 0)
                {
                    cmd.Parameters.AddWithValue("@PCategoryID", CatID);
                }
                if (GenderID > 0)
                {
                    cmd.Parameters.AddWithValue("@PGender", GenderID);
                }
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrProducts.DataSource = dtBrands;
                    rptrProducts.DataBind();
                }

            }
        }
    }

    //public void BindCategories()
    //{
    //    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

    //    using (SqlConnection con = new SqlConnection(CS))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("select * from tblCategories", con))
    //        {
    //            cmd.CommandType = CommandType.Text;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dtBrands = new DataTable();
    //                sda.Fill(dtBrands);
    //                rptCategory.DataSource = dtBrands;
    //                rptCategory.DataBind();
    //            }
    //        }

    //    }
    //}

    //public void BindGender()
    //{
    //    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;

    //    using (SqlConnection con = new SqlConnection(CS))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
    //        {
    //            cmd.CommandType = CommandType.Text;
    //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //            {
    //                DataTable dtBrands = new DataTable();
    //                sda.Fill(dtBrands);
    //                rptGender.DataSource = dtBrands;
    //                rptGender.DataBind();
    //            }
    //        }

    //    }
    //}
}