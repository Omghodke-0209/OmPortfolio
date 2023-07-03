<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="Admin_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="w-100">
        <tr>
            <td>Select Category:</td>
            <td>
                <asp:DropDownList ID="ddlCatId" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-Select" DataSourceID="SqlDataSource2" DataTextField="CatName" DataValueField="CatID" Width="300px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [CatName], [CatID] FROM [Category] ORDER BY [CatName]"></asp:SqlDataSource>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="ddlCatId" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>Select Company:</td>
            <td>
                <asp:DropDownList ID="ddlCompId" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-select" DataSourceID="SqlDataSource3" DataTextField="C_name" DataValueField="C_id" Width="300px">
                </asp:DropDownList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="ddlCompId" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter Product Name:</td>
            <td>
                <asp:TextBox ID="txtProductName" runat="server" OnTextChanged="TextBox1_TextChanged" CssClass="form-control" MaxLength="50"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtProductName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>Enter Price:</td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" OnTextChanged="TextBox1_TextChanged" TextMode="Number"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="txtPrice" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Product Picture:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:HiddenField ID="hdf1" runat="server" />
                <asp:Button ID="btnSave1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave1_Click" />
&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" />
            </td>
        </tr>
    </table>
    </div>


    <!-- This code is for gridview-->
    <div class="table mt-4">

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="1003px">
            <Columns>
                <asp:BoundField HeaderText="ProductID" />
                <asp:BoundField HeaderText="CatName" />
                <asp:BoundField HeaderText="CompName" />
                <asp:BoundField HeaderText="ProductName" />
                <asp:BoundField HeaderText="Price" />
                <asp:BoundField HeaderText="ProductPicture" />
                <asp:BoundField />
            </Columns>
        </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [CatName], [CatID] FROM [Category] ORDER BY [CatName]"></asp:SqlDataSource>
                <br />

    </div>
</asp:Content>

