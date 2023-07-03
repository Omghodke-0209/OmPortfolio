using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   

    private void SetLabel(bool isSuccess, string strMsg)
    {
        if (isSuccess)
        {
            lblMsg.CssClass = "alert alert-success";
        }
        else
        {
            lblMsg.CssClass = "alert alert-danger";
        }
        lblMsg.Text = strMsg;
    }
    private void Clears()
    {
        txtCname.Text = "";
        hdfId.Value = "";
        btnCompanySave.Enabled = true;
        btnUpdate.Enabled = false;
        GridView1.DataBind();
        txtCname.Focus();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            //check category existance
            string strcmd = "select C_id from Comapny where C_name='" + txtCname.Text + "'";
            DataTable dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                SetLabel(false, "Company is already exist !!!");
                txtCname.Focus();
            }
            else
            {
                strcmd = "insert into Comapny(C_name) values('" + txtCname.Text + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                SetLabel(true, "Company saved successfully");
                Clears();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //check category existance
            string strcmd = "select C_id from Comapny where C_name='" + txtCname.Text + "'and " +
                "C_ID<>" + hdfId.Value;
            DataTable dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                SetLabel(false, "company is already exist !!!");
                txtCname.Focus();
            }
            else
            {
                strcmd = "update Comapny set C_name='" + txtCname.Text + " '  where C_id=" + hdfId.Value;
                SQLHelper.ExecuteNonQuery(strcmd);
                SetLabel(true, "company Updated successfully");
                Clears();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        int index = 0;
        if (e.CommandName == "Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);
            hdfId.Value = GridView1.Rows[index].Cells[0].Text;
            txtCname.Text = GridView1.Rows[index].Cells[1].Text;
            btnCompanySave.Enabled = false;
            btnUpdate.Enabled = true;



        }
    }
}