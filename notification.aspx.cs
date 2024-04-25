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
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void txtnotification_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}