using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            if (!IsPostBack)
            {
                BindPriceData();
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
    public void BindPriceData()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                DataTable dtBrands = new DataTable();
                Int64 CartTotal = 0;
                Int64 Total = 0;

                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];               

                    if (hdPid.Value != null && hdPid.Value != "")
                    {
                        hdPid.Value += "," + PID;
                    }
                    else
                    {
                        hdPid.Value = PID;
                    }

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
                    CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                }
                divPriceDetails.Visible = true;

                spanCartTotal.InnerHtml = CartTotal.ToString();
                spanTotal.InnerHtml = "Rs.  " + Total.ToString();
                spanDiscount.InnerHtml = " " + (CartTotal - Total).ToString();

                hdCartAmount.Value = CartTotal.ToString();
                hdCartDiscount.Value = (CartTotal - Total).ToString();
                hdTotalPayed.Value = Total.ToString();
            }
            else
            {
                // empty
                Response.Redirect("~/Products.aspx");
            }
        }
        else
        {
            // empty
            Response.Redirect("~/Products.aspx");
        }
    }

    protected void btnCOD_Click(object sender, EventArgs e)
    {
        if (txtName.Text != "" && txtAddress.Text != "" && txtPinCode.Text != "" && txtMobileNumber.Text != "")
        {


            if (Session["USERID"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "COD";
                string PaymentStatus = "NotPaid";
                string EMAILID = Session["USEREMAIL"].ToString();

                //Insert Data to tblPurchase

                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPurchase values('" + USERID + "','"
                        + hdPid.Value + "','" + hdCartAmount.Value + "','" + hdCartDiscount.Value + "','"
                        + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtPinCode.Text + "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                    con.Open();
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }
                Response.Redirect("~/OrderSuccessfull.aspx");
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";
        }
    }
}