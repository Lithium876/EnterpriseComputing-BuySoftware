//ID#: 1401375
//Developer: Lomar Lilly
//Module: Enterprise Computing

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Software
/// </summary>
public class Software
{
    public String SoftwareId { get; set; }
    public String SoftwareName { get; set; }
    public int SoftwareAmount { get; set; }
    public String SoftwareCost { get; set; }
    public Double SoftwareTotalCost { get; set; }

    public Double calculateSoftwareTotalCost()
    {
        SoftwareCost = SoftwareCost.Replace(", ", "");
        return Convert.ToDouble(SoftwareCost) * SoftwareAmount;
    }

    public Software()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}