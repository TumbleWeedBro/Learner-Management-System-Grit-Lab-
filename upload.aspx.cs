using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grit_Management_System
{
    public partial class upload : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["status"].ToString() != "admin")
                {
                    Response.Redirect("login.aspx");
                }
            }
            catch
            {
                Response.Redirect("login.aspx");
            }
        }
   


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO videos (video_name, lab_link) " +
                "VALUES(@video_name, @lab_link)", con);
                cmd.Parameters.AddWithValue("@video_name", txtVideo_name.Text.Trim());
                cmd.Parameters.AddWithValue("@lab_link", txtLab_link.Text.Trim());
                cmd.ExecuteNonQuery();

                Response.Redirect("upload.aspx");
                Response.Write("<script>alert('video uploaded.')</script>");

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

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
            Response.Redirect("upload.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int idToDelete = int.Parse(row.Cells[2].Text);

            DeleteRecordFromDatabase(idToDelete);

        }

        protected void txtVideo_name_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtLab_link_TextChanged(object sender, EventArgs e)
        {

        }
    }
}