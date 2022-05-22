<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container pt-5">
        <table class="table table-striped border-2">
            <tr>
                <td>Username</td>
                <td>
                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Full Name</td>
                <td>
                    <asp:Label ID="lblFullName" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td>
                    <asp:Label ID="lblMobile" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <asp:Label ID="lblGender" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Font-Bold="True"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

<%-- <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Uid" DataSourceID="SqlDataSource1" EditRowStyle-BorderStyle="Solid" CommandRowStyle-BorderStyle="Solid" FieldHeaderStyle-HorizontalAlign="NotSet">
        <Fields>
            <asp:BoundField DataField="Uid" HeaderText="Uid" InsertVisible="False" ReadOnly="True" SortExpression="Uid" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Usertype" HeaderText="Usertype" SortExpression="Usertype" />
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary" Text="Back" OnClick="btnBack_Click" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT Users.* FROM Users WHERE (Uid = @Uid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Uid" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>--%>