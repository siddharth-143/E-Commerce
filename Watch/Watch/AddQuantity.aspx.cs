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

public partial class AddQuantity : System.Web.UI.Page
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
            string strcmd = "select ProQuntID,PID, Quantity from tblProductQuantity order by ProQuntID";
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
        txtQuantity.Text = "";
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        txtQuantity.Focus();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select ProQuntID from tblProductQuantity where Quantity='" + SQLHelper.sf(txtQuantity.Text) + "'";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Quantity name already exist !!!";
                txtQuantity.Focus();
            }
            else
            {
                strcmd = "insert into tblProductQuantity(Quantity) values('" + SQLHelper.sf(txtQuantity.Text) + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Quantity Save Successfully";
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
            txtQuantity.Text = GridView1.Rows[index].Cells[1].Text;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            string strID = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from tblProductQuantity where ProQuntID=" + strID;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Quantity Deleted Successfully";
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
            string strcmd = "select ProQuntID from tblProductQuantity where Quantity='" + SQLHelper.sf(txtQuantity.Text) + "' and ProQuntID<>" + hdfID.Value;
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Quantity name already exist !!!";
                txtQuantity.Focus();
            }
            else
            {
                strcmd = "update tblProductQuantity set Quantity='" + SQLHelper.sf(txtQuantity.Text) + "' where ProQuntID=" + hdfID.Value;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Quantity Updated Successfully";
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