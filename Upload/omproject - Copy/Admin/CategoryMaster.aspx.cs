using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_CategoryMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void SetLabel(bool isSuccess,string strMsg)
    {
        if(isSuccess)
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
        txtCatName.Text = "";
        hdfID.Value="";
        btnSave.Enabled = true;
        btnUpdate.Enabled = false;
        GridView1.DataBind();
        txtCatName.Focus();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            //check category existance
            string strcmd = "select CatID from Category where CatName='" + txtCatName.Text + "'";
            DataTable dt = SQLHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                SetLabel(false, "Category is already exist !!!");
                txtCatName.Focus();
            }
            else
            {
                strcmd = "insert into Category(CatName) values('" + txtCatName.Text + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                SetLabel(true, "Category saved successfully");
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
        if (e.CommandName=="Ed")
        {
            index = Convert.ToInt32(e.CommandArgument);
            hdfID.Value = GridView1.Rows[index].Cells[0].Text;
            txtCatName.Text= GridView1.Rows[index].Cells[1].Text;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;



        }

        
          
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            //check category existance
            string strcmd = "select CatID from Category where CatName='" + txtCatName.Text + "'and " +
                "catID<>" + hdfID.Value;
            DataTable dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                SetLabel(false, "Category is already exist !!!");
                txtCatName.Focus();
            }
            else
            {
                strcmd = "update Category set CatName='"+ txtCatName.Text + " '  where CatID="+hdfID.Value;
                SQLHelper.ExecuteNonQuery(strcmd);
                SetLabel(true, "Category Updated successfully");
                Clears();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

   
}