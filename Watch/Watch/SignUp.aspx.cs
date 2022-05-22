using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btSignup_Click(object sender, EventArgs e)
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
                //String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                //using (SqlConnection con = new SqlConnection(CS))
                //{
                //    SqlCommand cmd = new SqlCommand("insert into Users values('" + tbUname.Text + "', '" + tbName.Text + "', '" + tbPass.Text + "', '" + tbEmail.Text + "', '" + tbMobile.Text + "','" + gender + "', 'U')", con);
                //    // SqlCommand cmd = new SqlCommand("insert into Users values('" + tbUname.Text + "', '" + tbName.Text + "', '" + tbPass.Text + "', '" + tbEmail.Text + "', '" + tbMobile.Text + "','" + ddlGender.SelectedValue + "', 'U')", con);   // For dropdown list to select gender
                //    con.Open();
                //    cmd.ExecuteNonQuery();
                //    lblMsg.Text = "Registration Successfull";
                //    lblMsg.ForeColor = Color.Green;
                //    Response.Redirect("~/Signin.aspx");
                //}

                // Using SQLHelper
                string strcmd = "select Uid from Users where Username ='" + tbUname.Text + "' and Mobile = '"+tbMobile.Text+"'";
                DataTable dt = new DataTable();
                dt = SQLHelper.FillData(strcmd);
                if (dt.Rows.Count > 0)
                {
                    lblMsg.Text = "User alredy exist";
                    lblMsg.ForeColor = Color.Red;
                }
                else
                {
                    strcmd = "insert into Users values('" + tbUname.Text + "', '" + tbName.Text + "', '" + tbPass.Text + "', '" + tbEmail.Text + "', '" + tbMobile.Text + "','" + gender + "', 'U')";
                    SQLHelper.ExecuteNonQuery(strcmd);
                    lblMsg.Text = "Registration Successfull";
                    lblMsg.ForeColor = Color.Green;
                    Response.Redirect("~/Signin.aspx");
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