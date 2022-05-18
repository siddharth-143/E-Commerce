<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" Font-Bold="True"></asp:Label>
        <div>
            <h2>Orders Detail's</h2>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PurchaseID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="CartAmount" HeaderText="CartAmount" SortExpression="CartAmount" />
                    <asp:BoundField DataField="CartDiscount" HeaderText="CartDiscount" SortExpression="CartDiscount" />
                    <asp:BoundField DataField="TotalPayed" HeaderText="TotalPayed" SortExpression="TotalPayed" />
                    <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                    <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" />
                    <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                    <asp:ButtonField CommandName="Del" Text="Delete">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT [PurchaseID], [UserID], [CartAmount], [CartDiscount], [TotalPayed], [PaymentType], [DateOfPurchase], [PinCode], [Qty] FROM [tblPurchase] WHERE ([UserID] = @UserID2)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID2" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

