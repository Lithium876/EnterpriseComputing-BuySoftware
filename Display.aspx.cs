//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = (Customer)Session["Customer"];

        lblName.Text = customer.FirstName + ' ' + customer.LastName;
        lblSoftware.Text = Convert.ToString(customer.Software);
        lblCost.Text = Convert.ToString(customer.Total);
        lblNewsletter.Text = Convert.ToString(customer.NewsLetter);
        lblAmount.Text = customer.Amount;
        lblPaymentMethod.Text = customer.PaymentMethodText;

    }
    protected void btnShopAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}