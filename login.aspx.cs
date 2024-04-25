using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grit_Management_System
{
    public partial class login1 : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public static string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2")); // "x2" formats to hexadecimal
                }
                return builder.ToString();
            }
        }
       
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string password = txtpassword.Text.Trim();
            string email = txtemail.Text.Trim();
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM grituser " +
                        "WHERE " +
                        "email = @email AND password = @password_hash AND account_status = 'admin'" +
                        "UNION " +
                        "SELECT * FROM grituser " +
                        "WHERE " +
                        "email = @email AND password = @password_hash AND account_status = 'active';"
                        , con);

                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password_hash", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Session["UserId"] = reader["gritters_id"];
                                Session["status"] = reader["account_status"];
                                string accountStatus = reader["account_status"].ToString();
                                if (accountStatus == "active")
                                {
                                    Response.Write("<script>alert('Login Successful');</script>");
                                    Response.Redirect("dashboard.aspx");
                                }
                                else if (accountStatus == "admin")
                                {
                                    Session["UserId"] = reader["gritters_id"];
                                    Response.Write("<script>alert('Login Successful');</script>");
                                    Response.Redirect("dashboard.aspx");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Login unsuccessful');</script>");
                            Response.Redirect("login.aspx");
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtpassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void email_TextChanged(object sender, EventArgs e)
        {

        }
    }  

}