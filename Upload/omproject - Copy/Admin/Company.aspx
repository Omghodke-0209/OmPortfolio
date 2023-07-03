<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Admin_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row col-md-12">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <div class="card">
        <div class="card-header">
            <h4>Company Master</h4>
        </div>
        <div class="card-body">
            <table class="w-100">
            <tr>
                <td style="text-align:right;">Enter Company Name</td>
                <td>
                    <asp:TextBox ID="txtCname" runat="server" CssClass="form-control" MaxLength="50" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnCompanySave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
   
                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-info" Enabled="False" OnClick="Button1_Click" Text="Update" />
                    <asp:HiddenField ID="hdfId" runat="server" />
                </td>
               
            </tr>
        </table>
        </div>

        

    </div>

    <!--This below div is for gridView-->
    <div class=" table mt-4" >
                       
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="C_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1148px" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="C_id" HeaderText="Company Id" ReadOnly="True" SortExpression="C_id" InsertVisible="False" />
                            <asp:BoundField DataField="C_name" HeaderText="Company Name" SortExpression="C_name" />

                             <asp:ButtonField CommandName="Ed" Text="Edit">
                               <ControlStyle CssClass="btn btn-info btn-sm" />
                              </asp:ButtonField>
                                  <asp:ButtonField CommandName="Del" Text="Delete">
                                 <ControlStyle CssClass="btn btn-danger btn-sm text-white m-md-2" />
                                 </asp:ButtonField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                   
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [Comapny]"></asp:SqlDataSource>
                   
                   
    </div>
</asp:Content>

