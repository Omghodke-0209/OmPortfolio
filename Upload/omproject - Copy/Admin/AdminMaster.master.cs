using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["RoleID"].ToString()!="1")
        {
            //not admin
            Response.Redirect("~/Default.aspx");
        }
        if(Session["UserID"].ToString()=="")
        {
            Response.Redirect("~/Default.aspx");
        }
        if(!Page.IsPostBack)
        {
            lblUserName.Text = Session["FullName"].ToString();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["RoleID"] = "";
        Session["UserID"] = "";
        Session["FullName"] = "";
        Response.Redirect("~/Default.aspx");
    }
}
