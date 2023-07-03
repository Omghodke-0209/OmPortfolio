<%@ Page Title="Category Master" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="Admin_CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row col-md-12">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <div class="card">
        <div class="card-header">
            <h4>Category Master<asp:HiddenField ID="hdfID" runat="server" />
            </h4>
        </div>
        <div class="card-body">
            <table class="w-100">
            <tr>
                <td style="text-align:right;">Enter Category Name</td>
                <td>
                    <asp:TextBox ID="txtCatName" runat="server" CssClass="form-control" MaxLength="50" Width="350px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCatName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info" Enabled="False" OnClick="btnUpdate_Click" Text="Update" />
                </td>
            </tr>
        </table>
        </div>
        

    </div>
    <div class="table mt-3">

        <asp:GridView ID="GridView1" runat="server" CssClass="table" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CatID" DataSourceID="SqlDataSource1" ForeColor="#333333" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CatID" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="CatID" />
                <asp:BoundField DataField="CatName" HeaderText="Category Name" SortExpression="CatName" />
                <asp:ButtonField CommandName="Ed" Text="Edit">
                <ControlStyle CssClass="btn btn-info btn-sm" />
                </asp:ButtonField>
                <asp:ButtonField CommandName="Del" Text="Delete">
                <ControlStyle CssClass="btn btn-danger btn-sm text-white" />
                </asp:ButtonField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [Category] ORDER BY [CatName]"></asp:SqlDataSource>

    </div>
</asp:Content>

