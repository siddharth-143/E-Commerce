<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageOrders.aspx.cs" Inherits="ManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container mt-2">
        <h4>Manage Orders</h4>
        <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PurchaseID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <%--<asp:BoundField DataField="CartAmount" HeaderText="CartAmount" SortExpression="CartAmount" />--%>
                <%--<asp:BoundField DataField="CartDiscount" HeaderText="CartDiscount" SortExpression="CartDiscount" />--%>
                <asp:BoundField DataField="TotalPayed" HeaderText="TotalPayed" SortExpression="TotalPayed" />
                <%--<asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />--%>
                <%--<asp:BoundField DataField="PaymentStatus" HeaderText="PaymentStatus" SortExpression="PaymentStatus" />--%>
                <asp:BoundField DataField="DateOfPurchase" HeaderText="DateOfPurchase" SortExpression="DateOfPurchase" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="PinCode" />
                <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" SortExpression="MobileNumber" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString1 %>" SelectCommand="SELECT tblPurchase.* FROM tblPurchase"></asp:SqlDataSource>
    </div>
</asp:Content>

