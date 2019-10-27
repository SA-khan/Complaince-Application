using Compliance_App.Reports;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportAppServer.DataDefModel;

namespace Compliance_App.ContentPages
{
    public partial class ReportPage : System.Web.UI.Page
    {

        ReportDocument Report = new ReportDocument();

        protected void Page_Unload(object sender, EventArgs e)
        {
            if (Report != null)
                Report.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Report.Load(Server.MapPath("~/Reports/CrystalReport1.rpt"));

            //string user = WebConfigurationManager.AppSettings["user"];
            //string pass = WebConfigurationManager.AppSettings["pass"];

            ////Report.SetDatabaseLogon(user, pass,"DESKTOP-VGAJGF1\SQLEXPRESS","DemoDatabase");
            //CrystalReportViewer1.ReportSource = Report;

            this.BindReport();

        }

        
        private void BindReport()
        {
            string query = "SELECT ID, UNIT_HOLDER_NAME, UNIT_HOLDER_EMAIL, UNIT_HOLDER_PHONE, LIST_NAME, LIST_ID, DATA_MATCHED from MatchedData";
            ReportDocument crystalReport = new ReportDocument();
            //CrystalReportViewer1.DisplayGroupTree = false;
            crystalReport.Load(Server.MapPath("~/Reports/CrystalReport1.rpt"));
            DataSet1 dsCustom = GetData(query, crystalReport);
            crystalReport.SetDataSource(dsCustom);
            CrystalReportViewer1.ReportSource = crystalReport;
        }

        private DataSet1 GetData(string query, ReportDocument crystalReport)
        {
            string conString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                DataSet1 dsCustom = new DataSet1();
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    //Get the List of all TextObjects in Section2.
                    List<TextObject> textObjects = crystalReport.ReportDefinition.Sections["Section2"].ReportObjects.OfType<TextObject>().ToList();
                    for (int i = 0; i < textObjects.Count; i++)
                    {
                        //Set the name of Column in TextObject.
                        textObjects[i].Text = string.Empty;
                        if (sdr.FieldCount > i)
                        {
                            textObjects[i].Text = sdr.GetName(i);
                        }
                    }
                    //Load all the data rows in the Dataset.
                    while (sdr.Read())
                    {
                        DataRow dr = dsCustom.Tables[0].Rows.Add();
                        for (int i = 0; i < sdr.FieldCount; i++)
                        {
                            dr[i] = sdr[i];
                        }
                    }
                }
                con.Close();
                return dsCustom;
            }
        }

    }
}