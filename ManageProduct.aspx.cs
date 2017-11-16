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

public partial class ManageProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        String strConnString = ConfigurationManager.ConnectionStrings["1401375ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "spSoftware_UploadImage";

        // Read the file and convert it to Byte Array
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;

        //Set the contenttype based on File Extension
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;

            case ".png":
                contenttype = "image/png";
                break;

            case ".gif":
                contenttype = "image/gif";
                break;
        }

        if (contenttype != String.Empty)
        {
            try
            {
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                //INSERT IMAGE FILE AND DATA IN DB
                cmd.Parameters.Add("@softwareID", SqlDbType.Int).Value = Convert.ToInt32(txtSoftwareID.Text);
                cmd.Parameters.Add("@softwareImage", SqlDbType.Binary).Value = bytes;
                cmd.Connection = con;

                con.Open();
                cmd.ExecuteNonQuery();
                lblmessage.ForeColor = System.Drawing.Color.Green;
                lblmessage.Text = "File Uploaded Successfully";
            }
            catch (Exception ex)
            {
                lblmessage.ForeColor = System.Drawing.Color.Red;
                lblmessage.Text = "Oops!! Something went wrong";
                //lblmessage.Text = Convert.ToString(ex);
            }
            con.Close();
            con.Dispose();
        }
        else
        {
            lblmessage.ForeColor = System.Drawing.Color.Red;
            lblmessage.Text = "File format not recognised." +
              " Please select a Image format .png .jpg OR .gif";
        }
    }

    protected void getAntiMalware(object sender, EventArgs e)
    {
        txtCategory.Text = "1";
        //_pageHeader.Text = "File Transfer Software";
    }

    protected void getBusinessAntivirus(object sender, EventArgs e)
    {
        txtCategory.Text = "2";
        //_pageHeader.Text = "File Transfer Software";
    }
}