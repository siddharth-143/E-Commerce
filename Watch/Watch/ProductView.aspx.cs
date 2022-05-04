using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

public partial class ProductView : System.Web.UI.Page
{
    readonly Int64 myQty = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null)
        {
            if (!IsPostBack)
            {
                BindProductImage2();
                BindProductDetails();
                BindCartNumber();
            }
        }
        else
        {
            Response.Redirect("~/Products.aspx");
        }
    }

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
                    rptrProductDetails.DataSource = dtBrands;
                    rptrProductDetails.DataBind();
                    Session["CartPID"] = Convert.ToInt32(dtBrands.Rows[0]["PID"].ToString());
                    Session["myPName"] = dtBrands.Rows[0]["PName"].ToString();
                    Session["myPPrice"] = dtBrands.Rows[0]["PPrice"].ToString();
                    Session["myPSelPrice"] = dtBrands.Rows[0]["PSelPrice"].ToString();

                }

            }
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


    private void BindProductImages()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblProductImages where PID=" + PID + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrImages.DataSource = dtBrands;
                    rptrImages.DataBind();
                }

            }
        }
    }

    private void BindProductImage2()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("BindProductImages", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@PID", PID);
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrImages.DataSource = dt;
                rptrImages.DataBind();
            }
        }
    }

    protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
        string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
        string GenderID = (e.Item.FindControl("hfGenderID") as HiddenField).Value;
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblProducts where BrandID='" + BrandID + "' and CategoryID=" + CatID + " and GenderID=" + GenderID + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProductDetails.DataSource = dt;
                    rptrProductDetails.DataBind();
                }
            }
        }
    }


    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        //if (Session["USERNAME"] != null)
        //{
        //    Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        //    if (Request.Cookies["CartPID"] != null)
        //    {
        //        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        //        CookiePID = CookiePID + "," + PID;

        //        HttpCookie CartProducts = new HttpCookie("CartPID");
        //        CartProducts.Values["CartPID"] = CookiePID;
        //        CartProducts.Expires = DateTime.Now.AddDays(30);
        //        Response.Cookies.Add(CartProducts);
        //    }
        //    else
        //    {
        //        HttpCookie CartProducts = new HttpCookie("CartPID");
        //        CartProducts.Values["CartPID"] = PID.ToString();
        //        CartProducts.Expires = DateTime.Now.AddDays(30);
        //        Response.Cookies.Add(CartProducts);
        //    }
        //    Response.Redirect("~/ProductView.aspx?PID=" + PID);
        //}
        //else
        //{
        //    Response.Redirect("~/SignIn.aspx?rurl=cart");
        //}

        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
        AddToCartProduction();
        Response.Redirect("ProductView.aspx?PID=" + PID);
    }

    private void AddToCartProduction()
    {
        if (Session["Username"] != null)
        {
            Int64 UserID = Convert.ToInt32(Session["USERID"].ToString());
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("IsProductExistInCart", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.Parameters.AddWithValue("@PID", PID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Int64 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                        SqlCommand myCmd = new SqlCommand("UpdateCart", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                        myCmd.Parameters.AddWithValue("@CartPID", PID);
                        myCmd.Parameters.AddWithValue("@UserID", UserID);
                        Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                    }
                    else
                    {
                        SqlCommand myCmd = new SqlCommand("InsertCart", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        myCmd.Parameters.AddWithValue("@UID", UserID);
                        myCmd.Parameters.AddWithValue("@PID", Session["CartPID"].ToString());
                        myCmd.Parameters.AddWithValue("@PName", Session["myPName"].ToString());
                        myCmd.Parameters.AddWithValue("@PPrice", Session["myPPrice"].ToString());
                        myCmd.Parameters.AddWithValue("@PSelPrice", Session["myPSelPrice"].ToString());
                        myCmd.Parameters.AddWithValue("@Qty", myQty);
                        Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                        con.Close();
                    }
                }
            }
        }
        else
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            Response.Redirect("Signin.aspx?rurl=" + PID);
        }
    }

    public void BindCartNumber()
    {
        if (Session["USERID"] != null)
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
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
                        CartBadge.InnerText = 0.ToString();
                    }
                }
            }
        }
    }

    protected override void InitializeCulture()
    {
        CultureInfo ci = new CultureInfo("en-IN");
        ci.NumberFormat.CurrencySymbol = "₹";
        Thread.CurrentThread.CurrentCulture = ci;

        base.InitializeCulture();
    }

    protected void btnCart2_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
}