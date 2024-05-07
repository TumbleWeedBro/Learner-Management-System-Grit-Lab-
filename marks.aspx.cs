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
    public partial class marks : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Create an empty list of integers
            List<string> data_list = new List<string>();

            if (fileUpload.HasFile && Path.GetExtension(fileUpload.FileName).Equals(".csv", StringComparison.OrdinalIgnoreCase))
            {
                try
                {
                    string filePath = Server.MapPath("") + fileUpload.FileName;
                    fileUpload.SaveAs(filePath);

                    // Read the CSV file into a DataTable
                    DataTable dataTable = new DataTable();
                    using (StreamReader reader = new StreamReader(filePath))
                    {
                        string line;
                        bool isFirstLine = true;
                        while ((line = reader.ReadLine()) != null)
                        {
                            string[] parts = line.Split(',');
                            if (isFirstLine)
                            {
                                foreach (string header in parts)
                                {
                                    dataTable.Columns.Add(header.Trim());
                                }
                                isFirstLine = false;
                            }
                            else
                            {
                                foreach (string content in parts)
                                {
                                    data_list.Add(content.Replace("\"", ""));
                                }

                                SaveToDatabase(data_list);
                                data_list.Clear();
                            }
                        }
                    }

                    // Save data to the database
                    
                    Response.Redirect("marks.aspx");



                }
                catch 
                {
                
                }
            }
            else
            {
                Response.Redirect("marks.aspx");
            }
        }

        private void SaveToDatabase(List<string> data_list)
        {
            SqlConnection con = new SqlConnection(strcon);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO lab_marks(jbscode,week,marks) " +
                "VALUES(@jbscode, @week, @marks)", con);
                cmd.Parameters.AddWithValue("@jbscode", data_list[0]);
                cmd.Parameters.AddWithValue("@week", data_list[1]);
                cmd.Parameters.AddWithValue("@marks", data_list[2]);

            cmd.ExecuteNonQuery();
            con.Close();





        }





    }
}