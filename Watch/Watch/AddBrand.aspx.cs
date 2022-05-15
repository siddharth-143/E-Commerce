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

public partial class AddBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBrands();

        }
    }

    private void LoadBrands()
    {
        try
        {
            string strcmd = "select BrandID, Name from tblBrands order by BrandID";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }

    private void Clear()
    {
        hdfID.Value = "";
        txtBrandName.Text = "";
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        txtBrandName.Focus();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select BrandID from tblBrands where Name='" + SQLHelper.sf(txtBrandName.Text) + "'";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Brand name already exist !!!";
                txtBrandName.Focus();
            }
            else
            {
                strcmd = "insert into tblBrands(Name) values('" + SQLHelper.sf(txtBrandName.Text) + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Brand Save Successfully";
                LoadBrands();
                Clear();
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
        lblMsg.Text = "";
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = 0;
        if (e.CommandName == "Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);     // return index no
            hdfID.Value = GridView1.Rows[index].Cells[0].Text;
            txtBrandName.Text = GridView1.Rows[index].Cells[1].Text;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            string strID = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from tblBrands where BrandID=" + strID;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Brand Deleted Successfully";
                LoadBrands();
            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message;
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select BrandID from tblBrands where Name='" + SQLHelper.sf(txtBrandName.Text) + "' and BrandID<>" + hdfID.Value;
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Brand name already exist !!!";
                txtBrandName.Focus();
            }
            else
            {
                strcmd = "update tblBrands set Name='" + SQLHelper.sf(txtBrandName.Text) + "' where BrandID=" + hdfID.Value;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Brand Updated Successfully";
                LoadBrands();
                Clear();
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
        }
    }
}

// Previous My Function


//protected void btnAdd_Click(object sender, EventArgs e)
//{
//    if (Session["USERNAME"] != null)
//    {
//        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
//        using (SqlConnection con = new SqlConnection(CS))
//        {
//            SqlCommand cmd = new SqlCommand("insert into tblBrands values('" + txtBrandName.Text + "')", con);
//            con.Open();
//            SqlDataAdapter sda = new SqlDataAdapter(cmd);
//            DataTable dt = new DataTable();
//            cmd.ExecuteNonQuery();
//            txtBrandName.Text = string.Empty;
//        }
//        BindBrandsRptr();
//    }
//    else
//    {
//        Response.Redirect("~/SignIn.aspx?rurl=AdminHome");
//    }
//}

//private void BindBrandsRptr()
//{
//    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
//    using (SqlConnection con = new SqlConnection(CS))
//    {
//        using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
//        {
//            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
//            {
//                DataTable dtbrands = new DataTable();
//                sda.Fill(dtbrands);
//                rptrBrands.DataSource = dtbrands;
//                rptrBrands.DataBind();
//            }
//        }
//    }
//}