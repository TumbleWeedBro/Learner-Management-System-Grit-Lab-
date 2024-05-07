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
    public partial class notification : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["status"].ToString() == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnNotification_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO notifications (message, sent_date, is_read) " +
                "VALUES(@message, @sent_date, 0)", con);
                cmd.Parameters.AddWithValue("@message", txtnotification.Text.Trim());
                cmd.Parameters.AddWithValue("@sent_date", DateTime.Now);
                cmd.ExecuteNonQuery();

                Response.Redirect("notification.aspx");
                Response.Write("<script>alert('notification sent.')</script>");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        private void DeleteRecordFromDatabase(int id)
        {
            string deleteQuery = "DELETE FROM notifications " +
                "WHERE " +
                "id = @id";

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                SqlCommand command = new SqlCommand(deleteQuery, connection);
                command.Parameters.AddWithValue("@Id", id);

                connection.Open();
                command.ExecuteNonQuery();
            }
            Response.Redirect("notification.aspx");
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int idToDelete = int.Parse(row.Cells[0].Text);

            DeleteRecordFromDatabase(idToDelete);

        }


        string GenerateRandomString()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, 7)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        protected void btnAttendance_Click(object sender, EventArgs e)
        {
            string random_code = GenerateRandomString();
            txtattendance.Text = random_code;
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE attendance " +
                "SET code = @Code " +
                " WHERE id = 1", con);
            cmd.Parameters.AddWithValue("@Code", random_code);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        protected void btnSubAttendance_Click(object sender, EventArgs e)
        {
            bool attendance_bool = false;
            string attendance_code = txtSubAttendance.Text.Trim();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT 1 FROM attendance " +
              "WHERE code = @attendance_code ", con);
            cmd.Parameters.AddWithValue("@attendance_code", attendance_code);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.HasRows)
                {
                   attendance_bool = true;
                }
            }
            if (attendance_bool)
            {
                using (SqlCommand updateCmd = new SqlCommand("UPDATE grituser SET lab_attendance = lab_attendance + 1 WHERE gritters_id = @UserId", con))
                {
                    updateCmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                    int rowsAffected = updateCmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Console.WriteLine("Lab attendance updated successfully.");
                    }
                    else
                    {
                        Console.WriteLine("Lab attendance update failed.");
                    }
                }

            }


        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void txtnotification_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtattendance_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSubAttendance_TextChanged(object sender, EventArgs e)
        {

        }

    }
}