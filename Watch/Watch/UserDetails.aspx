<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Uid" DataSourceID="SqlDataSource1" EditRowStyle-BorderStyle="Solid" CommandRowStyle-BorderStyle="Solid" FieldHeaderStyle-HorizontalAlign="NotSet">
        <Fields>
            <asp:BoundField DataField="Uid" HeaderText="Uid" InsertVisible="False" ReadOnly="True" SortExpression="Uid" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Usertype" HeaderText="Usertype" SortExpression="Usertype" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary" Text="Back" OnClick="btnBack_Click" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT Users.* FROM Users WHERE (Uid = @Uid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Uid" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

