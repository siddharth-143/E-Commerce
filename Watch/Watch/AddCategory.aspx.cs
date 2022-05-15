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

public partial class AddCategory : System.Web.UI.Page
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
            string strcmd = "select CatID, CatName from tblCategories order by CatID";
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
        txtCatName.Text = "";
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        txtCatName.Focus();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select CatID from tblCategories where CatName='" + SQLHelper.sf(txtCatName.Text) + "'";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Brand name already exist !!!";
                txtCatName.Focus();
            }
            else
            {
                strcmd = "insert into tblCategories(CatName) values('" + SQLHelper.sf(txtCatName.Text) + "')";
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
            txtCatName.Text = GridView1.Rows[index].Cells[1].Text;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            string strID = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from tblCategories where CatID=" + strID;
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
            string strcmd = "select CatID from tblCategories where CatName='" + SQLHelper.sf(txtCatName.Text) + "' and CatID<>" + hdfID.Value;
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Brand name already exist !!!";
                txtCatName.Focus();
            }
            else
            {
                strcmd = "update tblCategories set CatName='" + SQLHelper.sf(txtCatName.Text) + "' where CatID=" + hdfID.Value;
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