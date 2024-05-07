using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grit_Management_System
{
    public partial class users_view : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        // Declare variables to hold retrieved data
        public string name { get; set; }
        public string surname { get; set; }
        public string studentNumber { get; set; }
        public string Course { get; set; }
        public string year { get; set; }
        public string accountStatus { get; set; }
        public string jbs_code { get; set; }
        public string lab_attendance { get; set; }
        public string labs_completed { get; set; }
        public string grit_session { get; set; }
        public int grittersId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            grittersId = 0;
            if (!IsPostBack && Session["status"].ToString() != null)
            {
                // Check if the "gritters_id" parameter is present in the query string
                if (Request.QueryString["gritters_id"] != null || Session["UserId"] != null)
                {
                 
                    // Get the "gritters_id" value from the query string
                    if  (Session["status"].ToString() == "admin")
                    {
                         grittersId = Convert.ToInt32(Request.QueryString["gritters_id"]);
                    }
                    else if (Session["status"].ToString() != null)
                    {
                         grittersId = int.Parse(Session["UserId"].ToString());
                    }
                    check_labs();
                    Response.Write("<script>alert('Gritters ID: " + grittersId + "');</script>");
                    try
                    {
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand(
                                "SELECT * FROM grituser " +
                                "WHERE " +
                                "gritters_id = @grittersId "
                                , con);

                            cmd.Parameters.AddWithValue("@grittersId", grittersId);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        name = reader["name"].ToString();
                                        surname = reader["surname"].ToString();
                                        studentNumber = reader["student_number"].ToString();
                                        Course = reader["course"].ToString();
                                        year = reader["uni_year"].ToString();
                                        accountStatus = reader["account_status"].ToString();
                                        jbs_code = reader["jbscode"].ToString();
                                        grit_session = reader["grit_session"].ToString();

                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Login unsuccessful');</script>");
                                    Response.Redirect("dashboard.aspx");
                                }
                            }
                        }


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");

                    }
                }



            }
        }
        void check_labs()
        {
            int completed = 0;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" SELECT lab_marks.*, grituser.gritters_id " +
                "FROM lab_marks LEFT JOIN grituser ON lab_marks.jbscode = grituser.jbscode AND grituser.gritters_id = @gritters_id" +
                " WHERE grituser.gritters_id IS NOT NULL",con);

                if(Session["status"].ToString() == "admin")
                {
                    cmd.Parameters.AddWithValue("@gritters_id", grittersId.ToString());
                }
                else if(Session["status"].ToString() == "active")
                {
                    cmd.Parameters.AddWithValue("@gritters_id", Session["UserId"].ToString());
                }
                
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            completed += 1;
                        }
                    }


                }

                labs_completed = completed.ToString();
                

            }
        }

    }


}