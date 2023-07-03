using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        lblMsg.CssClass = "alert alert-danger col-md-12";
        try
        {
            string strcmd = "select UserID,UPassword,RoleID,FullName,Active from " +
                " Users where UserName='" + txtEmail.Text + "'";
            DataTable dt = SQLHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                bool isActive = (bool)dt.Rows[0]["Active"];
                if(isActive)
                {
                    string strPassword = dt.Rows[0]["UPassword"].ToString();
                    if(txtPassword.Text==strPassword)
                    {
                        Session["RoleID"]= dt.Rows[0]["RoleID"].ToString();
                        Session["UserID"]= dt.Rows[0]["UserID"].ToString();
                        Session["FullName"]= dt.Rows[0]["FullName"].ToString();

                        if (Session["RoleID"].ToString()== "1")
                        {
                            //admin
                            Response.Redirect("~/Admin/Default.aspx");
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Password !!!";
                    }
                }
                else
                {
                    lblMsg.Text = "Account is suspended.";
                }
            }
            else
            {
                lblMsg.Text = "Invalid Username !!!";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}