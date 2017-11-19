﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;


[DataObject]
public class BusinessClass
{
    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["1401375ConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int Software_Insert(int CategoryID, String SoftwareName, String SoftwareSize, String SoftwareCost, String SoftwareDescription)
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("spSoftware_Insert", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Stored Procedure Parameters
            cmd.Parameters.AddWithValue("@categoryID", CategoryID);
            cmd.Parameters.AddWithValue("@softwareName", SoftwareName);
            cmd.Parameters.AddWithValue("@softwareSize", SoftwareSize);
            cmd.Parameters.AddWithValue("@softwareCost", SoftwareCost);
            cmd.Parameters.AddWithValue("@softwareDescription", SoftwareDescription);

            //Convert Default Image to Bytes
            Image image = Image.FromFile(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"./App_Theme/images/no-image.png"));
            MemoryStream ms = new MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            byte[] bytes = ms.ToArray();

            cmd.Parameters.AddWithValue("@softwareImage", bytes);

            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();

            return result;
        }
        catch (Exception)
        {
            throw;
        }
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable Software_SelectByCategory_IEnumerable(int CategoryId)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("spSoftware_SelectByCategory", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@categoryID", CategoryId);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int Software_UpdateById(int SoftwareID, int CategoryID, String SoftwareName, String SoftwareSize, String SoftwareCost, String SoftwareDescription)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());

        SqlCommand cmd = new SqlCommand("spSoftware_UpdateById", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@softwareID", SoftwareID);
        cmd.Parameters.AddWithValue("@categoryID", CategoryID);
        cmd.Parameters.AddWithValue("@softwareName", SoftwareName);
        cmd.Parameters.AddWithValue("@softwareSize", SoftwareSize);
        cmd.Parameters.AddWithValue("@softwareCost", SoftwareCost);
        cmd.Parameters.AddWithValue("@softwareDescription", SoftwareDescription);

        con.Open();
        int updateCount = cmd.ExecuteNonQuery();
        con.Close();

        return updateCount;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int Software_DeleteById(int SoftwareID)
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("spSoftware_DeleteById", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Add Parameters
            cmd.Parameters.AddWithValue("@softwareID", SoftwareID);

            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();

            return res;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static int Customer_Insert(int PaymentId, String FirstName, String LastName, Boolean Newsletter)
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("spCustomer_Insert", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Stored Procedure Parameters
            //Declare a parameter to store the newly generated Student Id
            cmd.Parameters.AddWithValue("@customerId", 0).Direction = ParameterDirection.Output;

            cmd.Parameters.AddWithValue("@paymentMethodID", PaymentId);
            cmd.Parameters.AddWithValue("@firstName", FirstName);
            cmd.Parameters.AddWithValue("@lastName", LastName);
            cmd.Parameters.AddWithValue("@newsletter", Newsletter);

            con.Open();
            cmd.ExecuteNonQuery();
            int outCustomerId = Convert.ToInt32(cmd.Parameters["@CustomerId"].Value);
            con.Close();

            return outCustomerId;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static int Transaction_Insert(int CustomerId, int SoftwareId, DateTime TransactionDate, double TotalCost)
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            SqlCommand cmd = new SqlCommand("spTransaction_Insert", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //Stored Procedure Parameters

            cmd.Parameters.AddWithValue("@customerId", CustomerId);
            cmd.Parameters.AddWithValue("@softwareId", SoftwareId);
            cmd.Parameters.AddWithValue("@transactionDate", TransactionDate);
            cmd.Parameters.AddWithValue("@totalCost", TotalCost);

            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();

            return result;
        }
        catch (Exception)
        {
            throw;
        }
    }

    public BusinessClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}