using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grit_Management_System
{
    public partial class users_view : System.Web.UI.Page
    {
<<<<<<< Updated upstream
=======
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        // Declare variables to hold retrieved data
        public string name { get; set; }
        public string surname { get; set; }
        public string studentNumber { get; set; }
        public string Course { get; set; }
        public string year { get; set; }
        public string accountStatus { get; set; }
        public string jbscode { get; set; }
>>>>>>> Stashed changes
        protected void Page_Load(object sender, EventArgs e)
        {

<<<<<<< Updated upstream
=======
                    // Get the "gritters_id" value from the query string
                    int grittersId = Convert.ToInt32(Request.QueryString["gritters_id"]);
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
                                        jbscode = reader["jbscode"].ToString();

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
>>>>>>> Stashed changes
        }
    }
}