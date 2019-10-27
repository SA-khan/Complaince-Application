using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compliance_App.ContentPages
{
    public partial class ReportFIAMostWantedTerrorists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = getData();
            GridView1.DataBind();
        }

        private DataSet getData()
        {
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString))
            {
                SqlCommand sqlComm = new SqlCommand("GetFIAMostWantedTerroristsData", conn);
                sqlComm.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sqlComm;
                da.Fill(ds);
            }
            return ds;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("TRUNCATE TABLE FIAMostWantedTerrorists", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.DataSource = getData();
            GridView1.DataBind();
        }
    }
}