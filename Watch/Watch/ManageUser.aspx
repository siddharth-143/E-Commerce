<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h1>Users Details</h1>
        <hr />
        <asp:GridView class="table table-striped" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Uid" DataSourceID="SqlDataSource1" Height="339px" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <%--<asp:BoundField DataField="Uid" HeaderText="Uid" InsertVisible="False" ReadOnly="True" SortExpression="Uid" />--%>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Uid" HeaderText="Uid" SortExpression="Uid" InsertVisible="False" ReadOnly="True">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Username" HeaderText="Username" SortExpression="Username">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <%--<asp:BoundField HeaderStyle-CssClass="table-light" DataField="Password" HeaderText="Password" SortExpression="Password" />--%>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Name" HeaderText="Name" SortExpression="Name">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Email" HeaderText="Email" SortExpression="Email">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField HeaderStyle-CssClass="table-light" DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                    <HeaderStyle CssClass="table-light"></HeaderStyle>
                </asp:BoundField>
                <asp:ButtonField CommandName="Ed" Text="Edit" />
                <asp:ButtonField CommandName="Del" Text="Remove" />
                <asp:ButtonField CommandName="Details" Text="Details" />
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT Uid, Username, Name, Email, Mobile, Gender FROM Users ORDER BY Uid"></asp:SqlDataSource>
    </div>
</asp:Content>

