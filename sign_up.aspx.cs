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
    public partial class sign_up : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtsurname_TextChanged(object sender, EventArgs e)
        {

        }
        protected void txtuni_year_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtemail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtstudentNumber_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCourseAverage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtmotivation_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnrequest_Click(object sender, EventArgs e)
        {
            

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                string email = txtemail.Text.Trim();
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM grituser WHERE email = @email", con);
                checkCmd.Parameters.AddWithValue("@email", email);
                int emailCount = (int)checkCmd.ExecuteScalar();

                if (emailCount > 0)
                {
                    Response.Write("<script>alert('Email already exists')</script>");
                    // Handle the case where the email already exists
                }
                else
                {
                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO grituser " +
                        "(name, surname, email, student_number, course_average, motivation_to_join, account_status, uni_year)" +
                        "VALUES " +
                        "(@first_name, @surname, @email, @student_number, @course_average, @motivation, @account_status, @uni_year);" +
                        "SELECT SCOPE_IDENTITY() As id;"
                        , con);

                    cmd.Parameters.AddWithValue("@first_name", txtname.Text.Trim());
                    cmd.Parameters.AddWithValue("@surname", txtsurname.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                    cmd.Parameters.AddWithValue("@student_number", (txtstudentNumber.Text.Trim())); 
                    cmd.Parameters.AddWithValue("@course_average", (txtCourseAverage.Text.Trim())); 
                    cmd.Parameters.AddWithValue("@motivation", txtmotivation.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");
                    cmd.Parameters.AddWithValue("@uni_year", (txtuni_year.Text.Trim())); 
                    cmd.ExecuteNonQuery(); 

                    con.Close(); 
                    Response.Write("<script>alert('Request successful.')</script>");
                    Response.Redirect("login.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>)");
            }



        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}