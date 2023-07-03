using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class Admin_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave1_Click(object sender, EventArgs e)
    {
        try
        {
            //check product name
            string strcmd = "select ProductID from Products where ProductName='" + txtProductName.Text + "'";
            DataTable dt = SQLHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                //warning
            }
            else
            {
                //save
                string strPic = "~/images/noimage.png";
                if (FileUpload1.HasFile)
                {
                    string strExt = Path.GetExtension(FileUpload1.FileName);
                    strExt = strExt.ToLower();
                    if (strExt == ".png" || strExt == ".jpg" || strPic == ".jpeg" || strPic == ".bmp")
                    {
                        string strPath = Server.MapPath("~//ProductPics//");
                        //generate GUID
                        string strFolder = Guid.NewGuid().ToString();
                        if (!Directory.Exists(strPath + strFolder))
                        {
                            Directory.CreateDirectory(strPath + strFolder);
                        }
                        //get file name only
                        string strFileName = Path.GetFileName(FileUpload1.FileName);
                        //path for table
                        strPic = "~//ProductPics//" + strFolder + "//" + strFileName;
                        FileUpload1.SaveAs(strPath + strFolder + "//" + FileUpload1.FileName);
                    }

                    else
                    {
                        //warning
                        lblMsg.Text = "Select Only Image File";
                        return;
                    }
                }
                strcmd = "insert into Products(CatID,C_id,ProductName,Price,Picture) values(" +
                    ddlCatId.SelectedValue + "," + ddlCompId.SelectedValue + ",'" + txtProductName.Text +
                    "'," + txtPrice.Text + ",'" + strPic + "')";
                SQLHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Product saved successfully";
                GridView1.DataBind();
                //empty
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}