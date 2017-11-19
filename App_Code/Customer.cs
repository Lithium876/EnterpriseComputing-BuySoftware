using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string PaymentMethodID { get; set; }
    public double Total { get; set; }
    public int Software { get; set; }
    public string Amount { get; set; }
    public string PaymentMethodText { get; set; }
    public Boolean NewsLetter { get; set; }

	public Customer()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}