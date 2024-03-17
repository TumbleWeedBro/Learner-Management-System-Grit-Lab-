using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grit_Management_System
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        //Make a password hash
        string passwordhash(string password)
        {
            string password_hash = "";

            return password_hash;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT * FROM users " +
                        "WHERE " +
                        "email = @email AND password_hash = password_hash AND account_status = 'admin' " +
                        "UNION " +
                        "SELECT * FROM users " +
                        "WHERE " +
                        "email = @email AND password_hash = password_hash AND account_status = 'active';"
                        , con);

                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                    cmd.Parameters.AddWithValue("@password_hash", password.Text.Trim());

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Session["UserId"] = reader["id"];
                                Session["status"] = reader["account_status"];
                                string accountStatus = reader["account_status"].ToString();
                                if (accountStatus == "active")
                                {
                                    Response.Write("<script>alert('Login Successful');</script>");
                                    Response.Redirect("/views/home/bank.aspx");
                                }
                                else if (accountStatus == "admin")
                                {
                                    Session["UserId"] = reader["id"];
                                    Response.Write("<script>alert('Login Successful');</script>");
                                    Response.Redirect("/views/admin/dashboard.aspx");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Login unsuccessful');</script>");
                            Response.Redirect("/views/logging/login.aspx");
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


        protected void email_TextChanged(object sender, EventArgs e)
        {

        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}