//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Convert.ToString(Session["Software ID"]);

        lblSoftwareName.Text = ID;
    }
    protected void btn_ClickCheckOut(object sender, EventArgs e)
    {
        TextBox amount = (TextBox)dvSoftwareDetails.FindControl("txtAmount");
        Label cost = (Label)dvSoftwareDetails.FindControl("SoftwareCostLabel");
        Software software = new Software();

        software.SoftwareId = lblSoftwareName.Text;
        software.SoftwareAmount = Convert.ToInt32(amount.Text);
        software.SoftwareCost = cost.Text;
        
        Session["Software"] = software;
        Response.Redirect("CheckOut.aspx");
    }
}