using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

public partial class Payment : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    public static Int32 OrderNumber = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        hdPID.Value = Session["CartPID"].ToString();
        hdPName.Value = Request.QueryString["PName"];
        if (Session["USERNAME"] != null)
        {
            if (!IsPostBack)
            {
                BindPriceData2();
                BindOrderProducts();
                BindProductDetails();
            }
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }

    //public void BindPriceData()
    //{
    //    if (Request.Cookies["CartPID"] != null)
    //    {
    //        string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
    //        string[] CookieDataArray = CookieData.Split(',');
    //        if (CookieDataArray.Length > 0)
    //        {
    //            DataTable dtBrands = new DataTable();
    //            Int64 CartTotal = 0;
    //            Int64 Total = 0;
    //            for (int i = 0; i < CookieDataArray.Length; i++)
    //            {
    //                string PID = CookieDataArray[i].ToString().Split('-')[0];
    //                //string SizeID = CookieDataArray[i].ToString().Split('-')[1];

    //                if (hdQty.Value != null && hdQty.Value != "")
    //                {
    //                    hdQty.Value += "," + PID;
    //                }
    //                else
    //                {
    //                    hdQty.Value = PID;
    //                }


    //                using (SqlConnection con = new SqlConnection(CS))
    //                {
    //                    using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getProductName(" + PID + ") as PNamee,"
    //                       + PID + " as PIDD,PData.Name,PData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) PData where A.PID="
    //                       + PID + "", con))
    //                    {
    //                        cmd.CommandType = CommandType.Text;
    //                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                        {
    //                            sda.Fill(dtBrands);
    //                        }

    //                    }
    //                }
    //                CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
    //                Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
    //            }
    //            divPriceDetails.Visible = true;

    //            spanCartTotal.InnerText = CartTotal.ToString();
    //            spanTotal.InnerText = "Rs. " + Total.ToString();
    //            spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

    //            hdCartAmount.Value = CartTotal.ToString();
    //            hdCartDiscount.Value = (CartTotal - Total).ToString();
    //            hdTotalPayed.Value = Total.ToString();
    //            //hdQty.Value = CartQuantity.ToString();
    //        }
    //        else
    //        {
    //            //TODO Show Empty Cart
    //            Response.Redirect("~/Products.aspx");
    //        }
    //    }
    //    else
    //    {
    //        //TODO Show Empty Cart
    //        Response.Redirect("~/Products.aspx");
    //    }
    //}

    protected void BindProductDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblProducts where PID=" + PID + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    Session["CartPID"].ToString();
                }

            }
        }
    }

    private void BindPriceData2()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        string UserIDD = Session["USERID"].ToString();
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("BindPriceData", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("UserID", UserIDD);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string Pid = dt.Copy().ToString();
                    string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                    string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                    string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                    int Total1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                    int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                    spanTotal.InnerText = "Rs. " + string.Format("{0:#,###}", double.Parse(Total));
                    Session["myCartAmount"] = string.Format("{0:####}", double.Parse(Total));
                    spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###}", double.Parse(CartTotal));
                    spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString();
                    Session["TotalAmount"] = spanTotal.InnerText;
                    hdCartAmount.Value = CartTotal.ToString();
                    hdCartDiscount.Value = (CartTotal1 - Total1).ToString();
                    hdTotalPayed.Value = Total.ToString();
                    hdQty.Value = CartQuantity.ToString();
                }
                else
                {
                    Response.Redirect("Products.aspx");
                }
            }
        }
    }

    protected void btnCOD_Click(object sender, EventArgs e)
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        string PIDD = Session["CartPID"].ToString();
        if (txtName.Text != "" && txtAddress.Text != "" && txtPinCode.Text != "" && txtMobileNumber.Text != "")
        {
            if (Session["USERNAME"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "COD";
                string PaymentStatus = "NotPaid";
                string EMAILID = Session["USEREMAIL"].ToString();

                string query = "select * from tblCart where Uid=" + Session["USERID"].ToString();
                DataTable dt = new DataTable();
                dt = SQLHelper.FillData(query);

                query = "insert into tblPurchase values('" + USERID + "','" + EMAILID + "','" + dt.Rows[0]["PName"] + "','"
                        + hdCartAmount.Value + "','" + hdCartDiscount.Value + "','"
                        + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtPinCode.Text + "','" + txtMobileNumber.Text + "','" + hdQty.Value + "') select SCOPE_IDENTITY()";
                query += "Update tblProductQuantity set Quantity = Quantity - '" + hdQty.Value + "' where PID = '" + PIDD + "'";
                using (SqlConnection con = new SqlConnection(CS))
                {                 
                    SqlCommand cmd = new SqlCommand(query, con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }
                Response.Redirect("~/OrderSuccessfull.aspx");
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";
        }

    }

    private void BindOrderProducts()
    {
        //String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        //SqlConnection con = new SqlConnection(CS);
        //con.Open();
        //SqlCommand cmd = new SqlCommand("Select * from tblCart", con);
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //con.Close();
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    gvProducts.DataSource = ds;
        //    gvProducts.DataBind();
        //}
        //else
        //{
        //    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
        //    gvProducts.DataSource = ds;
        //    gvProducts.DataBind();
        //    int columncount = gvProducts.Rows[0].Cells.Count;
        //    gvProducts.Rows[0].Cells.Clear();
        //    gvProducts.Rows[0].Cells.Add(new TableCell());
        //    gvProducts.Rows[0].Cells[0].ColumnSpan = columncount;
        //    gvProducts.Rows[0].Cells[0].Text = "No Records Found";
        //}

        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        string UserIDD = Session["USERID"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCart", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);                 
                }

            }
        }
    }
}