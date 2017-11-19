//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void getAntiMalwareSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "1";
        _pageHeader.Text = "Anti-Malware Software";
    }

    protected void getBusinessAntivirusSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "2";
        _pageHeader.Text = "Business Antivirus Software";
    }

    protected void getCompressionSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "3";
        _pageHeader.Text = "Compression Software";
    }

    protected void getDeveloperSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "4";
        _pageHeader.Text = "Developer Software";
    }

    protected void getDriverSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "5";
        _pageHeader.Text = "Drivers Software";
    }

    protected void getFileTransferSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "6";
        _pageHeader.Text = "File Transfer Software";
    }

    protected void getMultimediaSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "7";
        _pageHeader.Text = "Multimedia Software";
    }

    protected void getOfficeNewsSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "8";
        _pageHeader.Text = "Office / News Software";
    }

    protected void getNetworkingSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "9";
        _pageHeader.Text = "Networking Software";
    }

    protected void getSecuritySoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "10";
        _pageHeader.Text = "Security Software";
    }

    protected void getSystemTuningSoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "11";
        _pageHeader.Text = "System Tuning Software";
    }

    protected void getVPNsPrivacySoftware(object sender, EventArgs e)
    {
        txtCategory.Text = "12";
        _pageHeader.Text = "VPNs / Privacy Software";
    }

    protected void gvSoftware_SelectedIndexChanged(object sender, EventArgs e)
    {
        String ID = gvSoftware.SelectedRow.Cells[3].Text;
        Session["Software ID"] = ID;

        Response.Redirect("ProductPage.aspx");
    }

}