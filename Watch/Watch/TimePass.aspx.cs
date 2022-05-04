using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimePass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // BindCartProducts();
            BindProductCart();
            BindCartNumber();
        }
    }

    public void BindCartNumber()
    {
        if (Session["USERID"] != null)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("BindCartNumberz", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        CartBadge.InnerText = CartQuantity;

                    }
                    else
                    {
                        //_ = CartBadge.InnerText == 0.ToString();
                        CartBadge.InnerText = "0";

                    }
                }
            }
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
                h5NoItems.InnerText = "MY CART (" + CookieDataArray.Length + "  Items)";
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
                Response.Redirect("~/EmptyCart.aspx");
            }
        }
        else
        {
            // empty
            h5NoItems.InnerText = "Your Shopping Cart is Empty";
            divPriceDetails.Visible = false;
            Response.Redirect("~/EmptyCart.aspx");
        }
    }

    //protected void btnRemoveItem_Click(object sender, EventArgs e)
    //{
    //    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
    //    Button btn = (Button)(sender);
    //    string PID = btn.CommandArgument;

    //    List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
    //    CookiePIDList.Remove(PID);
    //    string CookiesPIDUpdated = String.Join(",", CookiePIDList.ToArray());
    //    if (CookiesPIDUpdated == "")
    //    {
    //        HttpCookie CartProducts = Request.Cookies["CartPID"];
    //        CartProducts.Values["CartPID"] = null;
    //        CartProducts.Expires = DateTime.Now.AddDays(-1);
    //        Response.Cookies.Add(CartProducts);
    //    }
    //    else
    //    {
    //        HttpCookie CartProducts = Request.Cookies["CartPID"];
    //        CartProducts.Values["CartPID"] = CookiesPIDUpdated;
    //        CartProducts.Expires = DateTime.Now.AddDays(30);
    //        Response.Cookies.Add(CartProducts);
    //    }
    //    Response.Redirect("~/Cart.aspx");
    //}

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            Response.Redirect("~/Payment.aspx");
        }
        else
        {
            Response.Redirect("~/SignIn.aspx?rurl=cart");
        }
    }


    private void BindProductCart()
    {
        string UserID = Session["USERID"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("BindUserCart", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@UserID", UserID);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
                if (dt.Rows.Count > 0)
                {
                    string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                    string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                    string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                    h5NoItems.InnerText = "My Cart ( " + CartQuantity + " Item(s) )";
                    int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                    int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                    spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                    spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(CartTotal)) + ".00";
                    spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString() + ".00";
                }
                else
                {
                    h5NoItems.InnerText = "Your Shopping Cart is Empty.";
                    //divAmountSect.Visible = false;

                }
            }

        }
    }

    protected void RptrCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
        //This will add +1 to current quantity using PID
        if (e.CommandName == "DoPlus")
        {
            string PID = (e.CommandArgument.ToString());
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("getUserCartItem", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PID", PID);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Int32 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                        SqlCommand myCmd = new SqlCommand("UpdateCart", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                        myCmd.Parameters.AddWithValue("@CartPID", PID);
                        myCmd.Parameters.AddWithValue("@UserID", UserID);
                        con.Open();
                        Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                        con.Close();
                        BindProductCart();
                        BindCartNumber();
                    }
                }

            }
        }
        else if (e.CommandName == "DoMinus")
        {
            string PID = (e.CommandArgument.ToString());
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("getUserCartItem", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PID", PID);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Int32 myQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());


                        SqlCommand myCmd = new SqlCommand("UpdateCart", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        myCmd.Parameters.AddWithValue("@Quantity", myQty - 1);
                        myCmd.Parameters.AddWithValue("@CartPID", PID);
                        myCmd.Parameters.AddWithValue("@UserID", UserID);
                        con.Open();
                        Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                        con.Close();
                        BindProductCart();
                        BindCartNumber();


                    }

                }
            }
        }
        else if (e.CommandName == "RemoveThisCart")
        {
            int CartPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand myCmd = new SqlCommand("DeleteThisCartItem", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                myCmd.Parameters.AddWithValue("@CartID", CartPID);
                con.Open();
                myCmd.ExecuteNonQuery();
                con.Close();
                BindProductCart();
                BindCartNumber();
            }
        }
    }
    protected void btnCart2_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
}