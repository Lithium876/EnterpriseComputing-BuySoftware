//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

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

    protected void getAntiMalwareSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "1";
    }

    protected void getBusinessAntivirusSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "2";
    }

    protected void getBackupSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "3";
    }

    protected void getDeveloperSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "4";
    }

    protected void getDriverSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "5";
    }

    protected void getFileTransferSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "6";
    }

    protected void getMultimediaSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "7";
    }

    protected void getOfficeNewsSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "8";
    }

    protected void getNetworkingSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "9";
    }

    protected void getSecuritySoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "10";
    }

    protected void getSystemTuningSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "11";
    }

    protected void getVPNsSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "12";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Read the file and convert it to Byte Array
        string filePath = fuImagePath.PostedFile.FileName;
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
            String strConnString = ConfigurationManager.ConnectionStrings["1401375ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand("spSoftware_UploadImage", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                Stream fs = fuImagePath.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);

                //INSERT IMAGE FILE AND DATA IN DB
                cmd.Parameters.AddWithValue("@softwareID", Convert.ToInt32(txtSoftwareID.Text));
                cmd.Parameters.AddWithValue("@softwareImage", bytes);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                con.Close();

                lblmessage.ForeColor = System.Drawing.Color.Green;
                lblmessage.Text = "File Uploaded Successfully";
            }
            catch (Exception ex)
            {
                lblmessage.ForeColor = System.Drawing.Color.Red;
                lblmessage.Text = "Oops!! Something went wrong";
                //lblmessage.Text = Convert.ToString(ex);
            }
        }
        else
        {
            lblmessage.ForeColor = System.Drawing.Color.Red;
            lblmessage.Text = "File format not recognised." +
              " Please select a Image format .png .jpg OR .gif";
        }
        Response.Redirect("ManageProduct.aspx", false);
    }
}