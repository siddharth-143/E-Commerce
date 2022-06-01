using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    readonly Int64 myQty = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRepeater();
            BindCategories();
            BindGender();
        }
    }

    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
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

    //private void AddToCartProduction()
    //{
    //    try
    //    {
    //        if (Session["Username"] != null)
    //        {
    //            Int64 UserID = Convert.ToInt32(Session["USERID"].ToString());
    //            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
    //            string hfPName = Request.QueryString["PName"].ToString();

    //            string PName = (Session["myPName"].ToString());
    //            PName = PName + "," + PName;
    //            string strcmd = "Select * from tblProducts";
    //            DataTable dt = new DataTable();
    //            dt = SQLHelper.FillData(strcmd);
    //            strcmd = "insert into tblCart(Uid, PID, PName, PPrice, PSelPrice, Qty) values (" + UserID + "," +
    //               PID + "," + PName + "," + hfPPrice.Value.ToString() + "," + hfSelPrice.Value.ToString() + "," + myQty + ")";
    //            SQLHelper.ExecuteNonQuery(strcmd);
    //            //for (int i = 0; i < dt.Rows.Count; i++)
    //            //{
    //            //    strcmd = "insert into tblCart(Uid, PID, PName, PPrice, PSelPrice, Qty) values ('" + UserID + "'," +
    //            //        dt.Rows[i]["PID"].ToString() + "," +
    //            //        dt.Rows[i]["PName"].ToString() + "," +
    //            //        dt.Rows[i]["PPrice"].ToString() + "," +
    //            //        dt.Rows[i]["PSelPrice"].ToString() + "," +
    //            //        dt.Rows[i]["Qty"].ToString() + ")";
    //            //    SQLHelper.ExecuteNonQuery(strcmd);
    //            //}
    //        }
    //        else
    //        {
    //            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
    //            Response.Redirect("Signin.aspx");
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //}


}