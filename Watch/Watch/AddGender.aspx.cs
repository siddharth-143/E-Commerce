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

public partial class AddGender : System.Web.UI.Page
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
            string strcmd = "select GenderID, GenderName from tblGender order by GenderID";
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
        txtGender.Text = "";
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        txtGender.Focus();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "select GenderID from tblGender where GenderName='" + SQLHelper.sf(txtGender.Text) + "'";
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Gender name already exist !!!";
                txtGender.Focus();
            }
            else
            {
                strcmd = "insert into tblGender(GenderName) values('" + SQLHelper.sf(txtGender.Text) + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Gender Save Successfully";
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
            txtGender.Text = GridView1.Rows[index].Cells[1].Text;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
        }
        if (e.CommandName == "Del")
        {
            index = Convert.ToInt32(e.CommandArgument);
            string strID = GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from tblGender where GenderID=" + strID;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Gender Deleted Successfully";
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
            string strcmd = "select GenderID from tblGender where GenderName='" + SQLHelper.sf(txtGender.Text) + "' and GenderID<>" + hdfID.Value;
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Gender name already exist !!!";
                txtGender.Focus();
            }
            else
            {
                strcmd = "update tblGender set GenderName='" + SQLHelper.sf(txtGender.Text) + "' where GenderID=" + hdfID.Value;
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Gender Updated Successfully";
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