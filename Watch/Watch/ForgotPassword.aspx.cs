﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btPassRes_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from Users where Email ='" + tbEmailID.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequests values('" + myGUID + "', '" + Uid + "',getdate())", con);
                cmd1.ExecuteNonQuery();

                // send email
                String ToEmailAddress = dt.Rows[0][4].ToString();
                String Username = dt.Rows[0][1].ToString();
                String EmailBody = "Hi " + Username + "<br /><br />Click the link below to reset your password <br/><br/> http://localhost:56333/RecoverPassword.aspx?Uid=" + myGUID;
                MailMessage PassRecMail = new MailMessage("xyz782200@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "xyz782200@gmail",
                    Password = "123"
                };
                SMTP.EnableSsl = true;
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.Send(PassRecMail);
                SMTP.UseDefaultCredentials = false;


                lblPassRec.Text = "Check your email to reset your password.";
                lblPassRec.ForeColor = Color.Green;
            }
            else
            {
                lblPassRec.Text = "OOPs this email id DOES NOT exist in our database !";
                lblPassRec.ForeColor = Color.Red;
            }
        }
    }
}