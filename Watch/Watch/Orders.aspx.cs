using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCartProducts();
        }
    }
    private void BindCartProducts()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                h5NoItems.InnerText = "MY ORDERS (" + CookieDataArray.Length + "  Items)";
                DataTable dtBrands = new DataTable();
                Int64 CartTotal = 0;
                Int64 Total = 0;

                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];

                    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getProductName(" + PID + ") as PNamee,"
                            + PID + " as PIDD,PData.Name,PData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) PData where A.PID="
                            + PID + "", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {

                                sda.Fill(dtBrands);

                            }

                        }
                    }
                    CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                    Total += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                }
                rptrCartProducts.DataSource = dtBrands;
                rptrCartProducts.DataBind();
                divPriceDetails.Visible = true;

                spanCartTotal.InnerHtml = CartTotal.ToString();
                spanTotal.InnerHtml = "Rs.  " + Total.ToString();
                spanDiscount.InnerHtml = " " + (CartTotal - Total).ToString();
            }
            else
            {
                // empty
                h5NoItems.InnerText = "Your Shopping Cart is Empty";
                divPriceDetails.Visible = false;
            }
        }
        else
        {
            // empty
            h5NoItems.InnerText = "Your Shopping Cart is Empty";
            divPriceDetails.Visible = false;
        }
    }
}