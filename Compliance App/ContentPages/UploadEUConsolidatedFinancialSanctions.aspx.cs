using Compliance_App.App_Code;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Compliance_App.ContentPages
{
    public partial class UploadEUConsolidatedFinancialSanctions : System.Web.UI.Page
    {
        InsertData cls = new InsertData();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUploadPayPak.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUploadPayPak.FileName);
                if (fileExtension != ".csv")
                {
                    lblStatus.Text = "Please Upload A File with CSV extension.";
                    trStatus.Visible = true;
                }
                else
                {
                    try
                    {
                        //Uploaded File Saves on Server.
                        FileUploadPayPak.SaveAs(Server.MapPath("~/App_Data/" + FileUploadPayPak.FileName));

                        //Internal Working

                        //string str = "";
                        string fileName = "";
                        string filename = "";
                        lblStatus.Text = string.Empty;

                        fileName = Path.GetFileName(this.FileUploadPayPak.PostedFile.FileName);
                        fileName = FileUploadPayPak.FileName;
                        filename = base.Server.MapPath("~/App_Data") + "/" + fileName;

                        using (CsvFileReader reader = new CsvFileReader(filename))
                        {
                            int i = 0;
                            CsvRow row = new CsvRow();
                            try
                            {
                                int count = row.Count;
                                Debug.WriteLine("Total Rows:" + count);
                                while (reader.ReadRow(row))
                                {
                                    i++;
                                    if (i > 1)
                                    {

                                        int result = -1;
                                        string Column1 = Convert.ToString(row[0]);
                                        string Column2 = "";
                                        string Column3 = "";
                                        string Column4 = "";

                                        try
                                        {
                                            result = cls.InsertEUConsolidatedFinancialSanctionsData(Column1, Column2, Column3, Column4);
                                        }
                                        catch (Exception ex)
                                        {
                                            lblStatus.Text = "Operation Failed: " + ex.Message;
                                        }

                                        count++;

                                    }
                                    else
                                    {
                                        //if (row[0] == "FirstName") { }
                                        //else { lblStatus.Text = "File Invalid Format."; Debug.WriteLine("File Invalid Format."); break; }
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                lblStatus.Text = "Error : " + ex.Message + ")";
                            }
                            finally
                            {
                                GC.Collect();
                            }

                        }


                        //Internal Working End

                        //Message Appeared when file uploads completely.
                        lblStatus.Text = "File Uploaded Successfully.";
                        trStatus.Visible = true;

                    }
                    catch (OutOfMemoryException ex)
                    {
                        lblStatus.Text = "Memory is not enough. Please delete old data and try again." + ex.Message;
                        trStatus.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        lblStatus.Text = "Exception: " + ex.Message;
                        trStatus.Visible = true;
                    }

                }
            }
            else
            {
                lblStatus.Text = "Please Upload A File.";
                trStatus.Visible = true;
            }
            this.UpdatePanel1.Update();
        }
    }
}