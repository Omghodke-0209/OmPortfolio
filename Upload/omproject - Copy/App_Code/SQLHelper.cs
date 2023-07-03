using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for SQLHelper
/// </summary>
public class SQLHelper
{
    public static SqlConnection GetConnection()
    {
        string strCon = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        SqlConnection con = new SqlConnection(strCon);
        return con;
    }
    public static void ExecuteNonQuery(string strcmd)
    {
        //insert/update/delete
        try
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand(strcmd, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public static DataTable FillData(string strcmd)
    {
        //to get data from the tables
        try
        {
            SqlConnection con = GetConnection();
            SqlCommand cmd = new SqlCommand(strcmd, con);
            SqlDataAdapter dtadp = new SqlDataAdapter();
            dtadp.SelectCommand = cmd;
            DataTable dt = new DataTable();
            dtadp.Fill(dt);
            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}