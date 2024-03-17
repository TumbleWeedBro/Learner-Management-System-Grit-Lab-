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
    public partial class gritters : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                string userId = row.Cells[0].Text;
                string account_number = row.Cells[1].Text;

                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM payments " +
                    "WHERE " +
                    "senders_account_numbers = @account_number" +
                    "DELETE FROM account " +
                    "WHERE " +
                    "users_id = @userId  AND account_status != 'admin';" +
                    "DELETE FROM users " +
                    "WHERE " +
                    "id = @userId AND account_status != 'admin'"
                    , con);

                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@account_number", account_number);
                cmd.ExecuteNonQuery();


                Response.Redirect("/views/admin/dashboard.aspx");
                Response.Write("<script>alert('Account Deleted');</script>");
            }
        }

        protected void btnSuspend_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                string userId = row.Cells[0].Text;

                SqlCommand cmd = new SqlCommand(
                    "UPDATE users " +
                    "SET account_status = 'suspended' " +
                    "WHERE " +
                    "id = @userId  AND account_status != 'admin'"
                    , con);

                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.ExecuteNonQuery();


                Response.Redirect("/views/admin/dashboard.aspx");
                Response.Write("<script>alert('Account Suspended');</script>");
            }
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                string userId = row.Cells[0].Text;

                SqlCommand cmd = new SqlCommand(
                    "UPDATE users " +
                    "SET account_status = 'active' " +
                    "WHERE " +
                    "id = @userId  AND account_status != 'admin'"
                    , con);

                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.ExecuteNonQuery();


                Response.Redirect("/views/admin/dashboard.aspx");
                Response.Write("<script>alert('Account Active');</script>");
            }


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}