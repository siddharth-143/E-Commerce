using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GeneralLayout : System.Web.UI.MasterPage
{
    private object rptrProducts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategories();
            BindGender();
            // BindCartNumber();
            BindCartNumber2();
            SearchCustomers();
            if (Session["USERNAME"] != null)
            {
                btnSignup.Visible = false;
                btnSigin.Visible = false;
                btnSignOut.Visible = true;
            }
            else
            {
                btnSignup.Visible = true;
                btnSigin.Visible = true;
                btnSignOut.Visible = false;
            }
        }
    }
    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerHtml = ProductCount.ToString();
        }
        else
        {
            pCount.InnerHtml = 0.ToString();
        }
    }

    public void BindCartNumber2()
    {
        if (Session["USERID"] != null)
        {
            string UserIDD = Session["USERID"].ToString();
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
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
                        pCount.InnerText = CartQuantity;

                    }
                    else
                    {
                        pCount.InnerText = 0.ToString();
                    }
                }
            }
        }
    }

    //protected void btnLogin_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/SignIn.aspx");
    //}

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        //string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        //Button btn = (Button)(sender);
        //string PID = btn.CommandArgument;

        //List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        //CookiePIDList.Remove(PID);
        //string CookiesPIDUpdated = String.Join(",", CookiePIDList.ToArray());
        //if (CookiesPIDUpdated != null)
        //{
        //    HttpCookie CartProducts = Request.Cookies["CartPID"];
        //    CartProducts.Values["CartPID"] = CookiesPIDUpdated;
        //    CartProducts.Expires = DateTime.Now;
        //    Response.Cookies.Add(CartProducts);
        //}

        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        if (Request.Cookies["ASP.NET_SessionId"] != null)
        {
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(0);
            Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", string.Empty));
        }
        if (Request.Cookies["AuthToken"] != null)
        {
            Response.Cookies["AuthToken"].Value = string.Empty;
            Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(0);
            Response.Cookies.Add(new HttpCookie("AuthToken", ""));
        }
        Response.Redirect("~/Default.aspx");
    }

    //protected void btnSignOut_Click(object sender, EventArgs e)
    //{
    //    Session["Username"] = null;

    //    Response.Redirect("Default.aspx");
    //}

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

    private void SearchCustomers()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT PID, PName, PPrice, PSelPrice, PBrandID, PCategoryID, PGender, PDescription, FreeDelivery, 30DayRet," +
                    "COD FROM tblProducts";
                if (!string.IsNullOrEmpty(txtSearch1.Text.Trim()))
                {
                    sql += " WHERE Name LIKE @PName + '%'";
                    cmd.Parameters.AddWithValue("@PName", txtSearch1.Text.Trim());
                }
                cmd.CommandText = sql;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    //rptrBrands.DataSource = dt;                   
                    //rptrBrands.DataBind();
                }
                txtSearch1.Text = "";
            }
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.SearchCustomers();
    }

    //protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        string catid = (e.Item.FindControl("hfCatID") as HiddenField).Value;
    //        Repeater rptGender = e.Item.FindControl("rptGender") as Repeater;

    //        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
    //        using (SqlConnection con = new SqlConnection(CS))
    //        {
    //            //using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * FROM tblProducts where CatID='{0}'",catid), con))
    //            using (SqlCommand cmd = new SqlCommand(string.Format("SELECT * from tblGender WHERE GenderID='{0}'", catid),con))
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
    //                {
    //                    DataTable dtBrands = new DataTable();
    //                    sda.Fill(dtBrands);
    //                    rptGender.DataSource = dtBrands;
    //                    rptGender.DataBind();
    //                }
    //            }

    //        }
    //    }
    //}
}
