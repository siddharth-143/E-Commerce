using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ManageOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string query = "select PurchaseID, UserID, Email, TotalPayed, DateOfPurchase, Name, Address, PinCode, MobileNumber, Qty from tblPurchase";
            DataTable dt = GetData(query, "", "");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void FilterData(object sender, EventArgs e)
    {
        string query = "SELECT PurchaseID, UserID, Email, TotalPayed, DateOfPurchase, Name, Address, PinCode, MobileNumber, Qty" +
            " FROM tblPurchase WHERE SUBSTRING(CONVERT(VARCHAR, DateOfPurchase, 120), 0, 11) BETWEEN @StartDate AND @EndDate";
        DataTable dt = GetData(query, txtStartDate.Text, txtEndDate.Text);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    private DataTable GetData(string query, string startDate, string endDate)
    {

        string constr = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                {
                    cmd.Parameters.AddWithValue("@StartDate", DateTime.Parse(startDate).ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture));
                    cmd.Parameters.AddWithValue("@EndDate", DateTime.Parse(endDate).ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture));
                }

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
    }
}