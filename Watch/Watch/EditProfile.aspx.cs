using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class EditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["USERNAME"] != null)
            {
                LoadUser();
            }
            else
            {
                Response.Redirect("Signin.aspx");
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
            string strcmd = "select Username, Name, Password, Email, Mobile, Gender from Users where Username='" + Session["USERNAME"] + "'";
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

    protected void btnSave_Click(object sender, EventArgs e)
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
                strcmd = "update Users set Username='" + tbUname.Text + "',Name='" + tbName.Text + "'" +
                ",Password='" + tbPass.Text + "', Email='" + tbEmail.Text + "', Mobile='" + tbMobile.Text + "',Gender='" + gender + "' where Username='" + Session["USERNAME"] + "'";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Updated Successfull";
                lblMsg.ForeColor = Color.Green;
                Response.Redirect("~/UserHome.aspx");
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