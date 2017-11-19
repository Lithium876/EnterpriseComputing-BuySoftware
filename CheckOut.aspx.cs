using System;
using System.Collections.Generic;
using System.Linq;
//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Software software = (Software)Session["Software"];

        txtSoftwareId.Text = software.SoftwareId;
        lblAmountOutput.Text = Convert.ToString(software.SoftwareAmount);
        lblTotalCostOutput.Text = Convert.ToString(software.calculateSoftwareTotalCost());

    }
   
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        int SoftwareId;

        try
        {
            SoftwareId = Convert.ToInt32(txtSoftwareId.Text);
        }
        catch (Exception)
        {
            SoftwareId = 1;
        }

        Customer customer = new Customer();

        customer.FirstName = txtFirstName.Text;
        customer.LastName = txtLastName.Text;
        customer.PaymentMethodID = ddlPaymentMethod.SelectedItem.Text;
        customer.NewsLetter = cbNewsletter.Checked;
        customer.Total = Convert.ToDouble(lblTotalCostOutput.Text);
        customer.Software = SoftwareId;
        customer.Amount = lblAmountOutput.Text;
        customer.PaymentMethodText = ddlPaymentMethod.SelectedItem.Text;

        int customerId = BusinessClass.Customer_Insert(Convert.ToInt16(ddlPaymentMethod.SelectedItem.Value), customer.FirstName, customer.LastName, customer.NewsLetter);
        BusinessClass.Transaction_Insert(customerId, SoftwareId, DateTime.Now, Convert.ToDouble(lblTotalCostOutput.Text));

        Session["Customer"] = customer;
        Response.Redirect("Display.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}