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
    public partial class dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public int attendance_week1 { get; set; }
        public int attendance_week2 { get; set; }
        public int attendance_week3 { get; set; }
        public int attendance_week4 { get; set; }
        public int attendance_week5 { get; set; }
        public int attendance_week6 { get; set; }
        public int attendance_week7 { get; set; }
        public int attendance_week8 { get; set; }
        public int attendance_week9 { get; set; }
        public int attendance_week10 { get; set; }
        public int attendance_week11 { get; set; }
        public int attendance_week12 { get; set; }
        public int attendance_week13 { get; set; }


        public int labs_week1 { get; set; }
        public int labs_week2 { get; set; }
        public int labs_week3 { get; set; }
        public int labs_week4 { get; set; }
        public int labs_week5 { get; set; }
        public int labs_week6 { get; set; }
        public int labs_week7 { get; set; }
        public int labs_week8 { get; set; }
        public int labs_week9 { get; set; }
        public int labs_week10 { get; set; }
        public int labs_week11 { get; set; }
        public int labs_week12 { get; set; }
        public int labs_week13 { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Session["status"].ToString() == "admin")
            {
                // Check if the "gritters_id" parameter is present in the query string
                if (Request.QueryString["gritters_id"] != null)
                {

                    // Get the "gritters_id" value from the query string
                    int grittersId = Convert.ToInt32(Request.QueryString["gritters_id"]);
                    Response.Write("<script>alert('Gritters ID: " + grittersId + "');</script>");
                    try
                    {
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand(
                                "SELECT * FROM lab_attendance ", con);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        attendance_week1 = int.Parse(reader["week1"].ToString());
                                        attendance_week2 = int.Parse(reader["week2"].ToString());
                                        attendance_week3 = int.Parse(reader["week3"].ToString());
                                        attendance_week4 = int.Parse(reader["week4"].ToString());
                                        attendance_week5 = int.Parse(reader["week5"].ToString());
                                        attendance_week6 = int.Parse(reader["week6"].ToString());
                                        attendance_week7 = int.Parse(reader["week7"].ToString());
                                        attendance_week8 = int.Parse(reader["week8"].ToString());
                                        attendance_week9 = int.Parse(reader["week9"].ToString());
                                        attendance_week10 = int.Parse(reader["week10"].ToString());
                                        attendance_week11 = int.Parse(reader["week11"].ToString());
                                        attendance_week12 = int.Parse(reader["week12"].ToString());
                                        attendance_week13 = int.Parse(reader["week13"].ToString());


                                    }
                                }
                            }
                            cmd = new SqlCommand(
                            "SELECT * FROM labs_completed ", con);
                            cmd.Parameters.AddWithValue("@grittersId", grittersId);
                            using (SqlDataReader read = cmd.ExecuteReader())
                            {
                                if (read.HasRows)
                                {
                                    while (read.Read())
                                    {
                                        labs_week1 = int.Parse(read["week1"].ToString());
                                        labs_week2 = int.Parse(read["week2"].ToString());
                                        labs_week3 = int.Parse(read["week3"].ToString());
                                        labs_week4 = int.Parse(read["week4"].ToString());
                                        labs_week5 = int.Parse(read["week5"].ToString());
                                        labs_week6 = int.Parse(read["week7"].ToString());
                                        labs_week8 = int.Parse(read["week8"].ToString());
                                        labs_week9 = int.Parse(read["week9"].ToString());
                                        labs_week10 = int.Parse(read["week10"].ToString());
                                        labs_week11 = int.Parse(read["week11"].ToString());
                                        labs_week12 = int.Parse(read["week12"].ToString());
                                        labs_week13 = int.Parse(read["week13"].ToString());


                                    }
                                }

                            }
                            Response.Redirect("dashboard.aspx");
                        }


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");

                    }
                }


            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void ddlWeeks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
    }
}