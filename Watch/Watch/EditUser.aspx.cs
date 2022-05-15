using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class EditUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                hdfUid.Value = Request.QueryString["id"].ToString();
                LoadUser();
            }
        }
    }

    private void LoadUser()
    {
        try
        {
            string gender = string.Empty;
            if (rbMale.Checked)
            {
                gender = "Male";
            }
            else if (rbFemale.Checked)
            {
                gender = "Female";
            }
            string strcmd = "select Username, Name, Password, Email, Mobile, Gender, Address from Users where Uid = " + hdfUid.Value;
            DataTable dt = new DataTable();
            dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                tbUname.Text = dt.Rows[0]["UserName"].ToString();
                tbName.Text = dt.Rows[0]["Name"].ToString();
                tbPass.Text = dt.Rows[0]["Password"].ToString();
                tbCPass.Text = dt.Rows[0]["Password"].ToString();
                tbEmail.Text = dt.Rows[0]["Email"].ToString();
                tbMobile.Text = dt.Rows[0]["Mobile"].ToString();
                gender = dt.Rows[0]["Gender"].ToString();
                tbAddress.Text = dt.Rows[0]["Address"].ToString();

            }
            else
            {
                Response.Redirect("~/NotFound.aspx");
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.ToString();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        if (rbMale.Checked)
        {
            gender = "Male";
        }
        else if (rbFemale.Checked)
        {
            gender = "Female";
        }

        if (tbUname.Text != "" && tbName.Text != "" && tbPass.Text != "" && tbEmail.Text != "" && tbMobile.Text != "" && gender != "")
        {
            if (tbPass.Text == tbCPass.Text)
            {
                // Using SQLHelper
                string strcmd = "select Uid from Users where Username ='" + tbUname.Text + "' and Mobile = '" + tbMobile.Text + "'";
                DataTable dt = new DataTable();
                dt = SQLHelper.FillData(strcmd);
                //strcmd = "insert into Users values('" + tbUname.Text + "', '" + tbName.Text + "', '" + tbPass.Text + "', '" + tbEmail.Text + "', '" + tbMobile.Text + "','" + gender + "', 'U')";
                strcmd = "update Users set Username='" + tbUname.Text + "',Name='" + tbName.Text + "'" +
                ",Password='" + tbPass.Text + "', Email='" + tbEmail.Text + "', Mobile='" + tbMobile.Text + "',Gender='" + gender + "',Address='" + tbAddress.Text + "' where Uid='" + hdfUid.Value + "'";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Updated Successfull";
                lblMsg.ForeColor = Color.Green;
                //Response.Redirect("~/Signin.aspx");
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";
        }
    }

    private void Clear()
    {
        tbUname.Text = "";
        tbName.Text = "";
        tbPass.Text = "";
        tbCPass.Text = "";
        tbMobile.Text = "";
        tbEmail.Text = "";
        tbAddress.Text = "";
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ManageUser.aspx");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        string strcmd = "";
        if (rbMale.Checked)
        {
            gender = "Male";
        }
        else if (rbFemale.Checked)
        {
            gender = "Female";
        }

        if (tbUname.Text != "" && tbName.Text != "" && tbPass.Text != "" && tbEmail.Text != "" && tbMobile.Text != "" && gender != "" && tbAddress.Text != "")
        {
            if (tbPass.Text == tbCPass.Text)
            {
                // Using SQLHelper
                strcmd = "select Uid from Users where Username ='" + tbUname.Text + "' and Mobile = '" + tbMobile.Text + "'";
                DataTable dt = new DataTable();
                dt = SQLHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    lblMsg.Text = "User is already exits !!!";
                    lblMsg.ForeColor = Color.Red;
                }
                else
                {
                    strcmd = "insert into Users values('" + tbUname.Text + "', '" + tbName.Text + "', '" + tbPass.Text + "', '" + tbEmail.Text + "', '" + tbMobile.Text + "','" + gender + "', 'U','" + tbAddress.Text + "')";
                    SQLHelper.ExecuteNonQuery(strcmd);
                    lblMsg.Text = "Registred Successfull";
                    lblMsg.ForeColor = Color.Green;
                    Response.Redirect("~/ManageUser.aspx");
                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";
        }
    }
}